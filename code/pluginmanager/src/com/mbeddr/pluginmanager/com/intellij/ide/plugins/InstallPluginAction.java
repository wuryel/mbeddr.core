/*
 * Copyright 2000-2014 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.mbeddr.pluginmanager.com.intellij.ide.plugins;

import com.intellij.CommonBundle;
import com.intellij.icons.AllIcons;
import com.intellij.ide.IdeBundle;
import com.intellij.ide.plugins.*;
import com.intellij.openapi.actionSystem.AnAction;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.Presentation;
import com.intellij.openapi.extensions.PluginId;
import com.intellij.openapi.project.DumbAware;
import com.intellij.openapi.ui.Messages;
import com.intellij.openapi.util.text.StringUtil;
import com.intellij.util.Function;
import com.intellij.util.net.IOExceptionDialog;
import com.intellij.xml.util.XmlStringUtil;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;
import java.io.IOException;
import java.util.*;

/**
 * @author lloix
 */
public class InstallPluginAction extends AnAction implements DumbAware {
  private static final InstalledPluginsState ourState = InstalledPluginsState.getInstance();
  private static final Set<IdeaPluginDescriptor> ourInstallingNodes = new HashSet<IdeaPluginDescriptor>();

  private final PluginManagerMain myHost;
  private final PluginManagerMain myInstalled;

  public InstallPluginAction(PluginManagerMain mgr, PluginManagerMain installed) {
    super(IdeBundle.message("action.download.and.install.plugin"), IdeBundle.message("action.download.and.install.plugin"), AllIcons.Actions.Install);
    myHost = mgr;
    myInstalled = installed;
  }

  @Override
  public void update(AnActionEvent e) {
    Presentation presentation = e.getPresentation();
    IdeaPluginDescriptor[] selection = getPluginTable().getSelectedObjects();
    boolean enabled = (selection != null);

    if (enabled) {
      for (IdeaPluginDescriptor descr : selection) {
        presentation.setText(IdeBundle.message("action.download.and.install.plugin"));
        presentation.setDescription(IdeBundle.message("action.download.and.install.plugin"));
        enabled &= !ourInstallingNodes.contains(descr);
        if (descr instanceof PluginNode) {
          enabled &= !PluginManagerColumnInfo.isDownloaded((PluginNode)descr);
          if (((PluginNode)descr).getStatus() == PluginNode.STATUS_INSTALLED) {
            presentation.setText(IdeBundle.message("action.update.plugin"));
            presentation.setDescription(IdeBundle.message("action.update.plugin"));
            enabled &= ourState.hasNewerVersion(descr.getPluginId());
          }
        }
        else if (descr instanceof IdeaPluginDescriptorImpl) {
          presentation.setText(IdeBundle.message("action.update.plugin"));
          presentation.setDescription(IdeBundle.message("action.update.plugin"));
          PluginId id = descr.getPluginId();
          enabled = enabled && ourState.hasNewerVersion(id);
        }
      }
    }

    presentation.setEnabled(enabled);
  }

  @Override
  public void actionPerformed(AnActionEvent e) {
    install(null);
  }

  public static boolean isInstalling(IdeaPluginDescriptor node) {
    return ourInstallingNodes.contains(node);
  }
  
  public void install(@Nullable final Runnable onSuccess) {
    install(onSuccess, false);
  }

  public void install(@Nullable final Runnable onSuccess, boolean confirmed) {
    IdeaPluginDescriptor[] selection = getPluginTable().getSelectedObjects();

    if (confirmed || userConfirm(selection)) {
      final List<PluginNode> list = new ArrayList<PluginNode>();
      for (IdeaPluginDescriptor descr : selection) {
        PluginNode pluginNode = null;
        if (descr instanceof PluginNode) {
          pluginNode = (PluginNode)descr;
        }
        else if (descr instanceof IdeaPluginDescriptorImpl) {
          PluginId pluginId = descr.getPluginId();
          pluginNode = new PluginNode(pluginId);
          pluginNode.setName(descr.getName());
          pluginNode.setDepends(Arrays.asList(descr.getDependentPluginIds()), descr.getOptionalDependentPluginIds());
          pluginNode.setSize("-1");
          pluginNode.setRepositoryName(PluginInstaller.UNKNOWN_HOST_MARKER);
        }

        if (pluginNode != null) {
          list.add(pluginNode);
          ourInstallingNodes.add(pluginNode);
        }
      }

      final InstalledPluginsTableModel installedModel = (InstalledPluginsTableModel)myInstalled.getPluginsModel();
      final Set<IdeaPluginDescriptor> disabled = new HashSet<IdeaPluginDescriptor>();
      final Set<IdeaPluginDescriptor> disabledDependants = new HashSet<IdeaPluginDescriptor>();
      for (PluginNode node : list) {
        final PluginId pluginId = node.getPluginId();
        if (installedModel.isDisabled(pluginId)) {
          disabled.add(node);
        }
        final List<PluginId> depends = node.getDepends();
        if (depends != null) {
          final Set<PluginId> optionalDeps = new HashSet<PluginId>(Arrays.asList(node.getOptionalDependentPluginIds()));
          for (PluginId dependantId : depends) {
            if (optionalDeps.contains(dependantId)) continue;
            final IdeaPluginDescriptor pluginDescriptor = PluginManager.getPlugin(dependantId);
            if (pluginDescriptor != null && installedModel.isDisabled(dependantId)) {
              disabledDependants.add(pluginDescriptor);
            }
          }
        }
      }

      if (suggestToEnableInstalledPlugins(installedModel, disabled, disabledDependants, list)) {
        myInstalled.setRequireShutdown(true);
      }

      try {
        Runnable onInstallRunnable = new Runnable() {
          @Override
          public void run() {
            for (PluginNode node : list) {
              installedModel.appendOrUpdateDescriptor(node);
            }
            if (!myInstalled.isDisposed()) {
              getPluginTable().updateUI();
              myInstalled.setRequireShutdown(true);
            }
            else {
              boolean needToRestart = false;
              for (PluginNode node : list) {
                final IdeaPluginDescriptor pluginDescriptor = PluginManager.getPlugin(node.getPluginId());
                if (pluginDescriptor == null || pluginDescriptor.isEnabled()) {
                  needToRestart = true;
                  break;
                }
              }

              if (needToRestart) {
                PluginManagerMain.notifyPluginsUpdated(null);
              }
            }
            if (onSuccess != null) {
              onSuccess.run();
            }
          }
        };
        Runnable cleanupRunnable = new Runnable() {
          @Override
          public void run() {
            ourInstallingNodes.removeAll(list);
          }
        };
        PluginManagerMain.downloadPlugins(list, myHost.getPluginsModel().getAllPlugins(), onInstallRunnable, cleanupRunnable);
      }
      catch (final IOException e1) {
        ourInstallingNodes.removeAll(list);
        PluginManagerMain.LOG.error(e1);
        //noinspection SSBasedInspection
        SwingUtilities.invokeLater(new Runnable() {
          @Override
          public void run() {
            IOExceptionDialog.showErrorDialog(IdeBundle.message("action.download.and.install.plugin"), IdeBundle.message("error.plugin.download.failed"));
          }
        });
      }
    }
  }

  private static boolean suggestToEnableInstalledPlugins(InstalledPluginsTableModel pluginsModel,
                                                         Set<IdeaPluginDescriptor> disabled,
                                                         Set<IdeaPluginDescriptor> disabledDependants,
                                                         List<PluginNode> list) {
    if (!disabled.isEmpty() || !disabledDependants.isEmpty()) {
      String message = "";
      if (disabled.size() == 1) {
        message += "Updated plugin '" + disabled.iterator().next().getName() + "' is disabled.";
      }
      else if (!disabled.isEmpty()) {
        message += "Updated plugins " + StringUtil.join(disabled, new Function<IdeaPluginDescriptor, String>() {
          @Override
          public String fun(IdeaPluginDescriptor pluginDescriptor) {
            return pluginDescriptor.getName();
          }
        }, ", ") + " are disabled.";
      }

      if (!disabledDependants.isEmpty()) {
        message += "<br>";
        message += "Updated plugin" + (list.size() > 1 ? "s depend " : " depends ") + "on disabled";
        if (disabledDependants.size() == 1) {
          message += " plugin '" + disabledDependants.iterator().next().getName() + "'.";
        }
        else {
          message += " plugins " + StringUtil.join(disabledDependants, new Function<IdeaPluginDescriptor, String>() {
            @Override
            public String fun(IdeaPluginDescriptor pluginDescriptor) {
              return pluginDescriptor.getName();
            }
          }, ", ") + ".";
        }
      }
      message += " Disabled plugins " + (disabled.isEmpty() ? "and plugins which depend on disabled " :"") + "won't be activated after restart.";

      int result;
      if (!disabled.isEmpty() && !disabledDependants.isEmpty()) {
        result =
          Messages.showYesNoCancelDialog(XmlStringUtil.wrapInHtml(message), CommonBundle.getWarningTitle(), "Enable all",
                                         "Enable updated plugin" + (disabled.size() > 1 ? "s" : ""), CommonBundle.getCancelButtonText(),
                                         Messages.getQuestionIcon());
        if (result == Messages.CANCEL) return false;
      }
      else {
        message += "<br>Would you like to enable ";
        if (!disabled.isEmpty()) {
          message += "updated plugin" + (disabled.size() > 1 ? "s" : "");
        }
        else {
          //noinspection SpellCheckingInspection
          message += "plugin dependenc" + (disabledDependants.size() > 1 ? "ies" : "y");
        }
        message += "?";
        result = Messages.showYesNoDialog(XmlStringUtil.wrapInHtml(message), CommonBundle.getWarningTitle(), Messages.getQuestionIcon());
        if (result == Messages.NO) return false;
      }

      if (result == Messages.YES) {
        disabled.addAll(disabledDependants);
        pluginsModel.enableRows(disabled.toArray(new IdeaPluginDescriptor[disabled.size()]), true);
      }
      else if (result == Messages.NO && !disabled.isEmpty()) {
        pluginsModel.enableRows(disabled.toArray(new IdeaPluginDescriptor[disabled.size()]), true);
      }
      return true;
    }
    return false;
  }

  public PluginTable getPluginTable() {
    return myHost.getPluginTable();
  }

  //---------------------------------------------------------------------------
  //  Show confirmation message depending on the amount and type of the
  //  selected plugin descriptors: already downloaded plugins need "update"
  //  while non-installed yet need "install".
  //---------------------------------------------------------------------------
  private boolean userConfirm(IdeaPluginDescriptor[] selection) {
    String message;
    if (selection.length == 1) {
      if (selection[0] instanceof IdeaPluginDescriptorImpl) {
        message = IdeBundle.message("prompt.update.plugin", selection[0].getName());
      }
      else {
        message = IdeBundle.message("prompt.download.and.install.plugin", selection[0].getName());
      }
    }
    else {
      message = IdeBundle.message("prompt.install.several.plugins", selection.length);
    }

    return Messages.showYesNoDialog(myHost.getMainPanel(), message, IdeBundle.message("action.download.and.install.plugin"), Messages.getQuestionIcon()) == Messages.YES;
  }
}
