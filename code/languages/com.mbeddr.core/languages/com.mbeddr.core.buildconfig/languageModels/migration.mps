<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:441b7324-eed9-44c7-b84f-7c4d2160221d(com.mbeddr.core.buildconfig.migration)">
  <persistence version="9" />
  <languages>
    <use id="90746344-04fd-4286-97d5-b46ae6a81709" name="jetbrains.mps.lang.migration" version="0" />
    <use id="28f9e497-3b42-4291-aeba-0a1039153ab1" name="jetbrains.mps.lang.plugin" version="0" />
    <use id="d4615e3b-d671-4ba9-af01-2b78369b0ba7" name="jetbrains.mps.lang.pattern" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="c17a" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.language(MPS.OpenAPI/)" />
    <import index="lui2" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.module(MPS.OpenAPI/)" />
    <import index="51wr" ref="r:b31f1c3c-99aa-4f1e-a329-cba27efb1a6b(com.mbeddr.core.buildconfig.structure)" />
    <import index="slm6" ref="90746344-04fd-4286-97d5-b46ae6a81709/r:52a3d974-bd4f-4651-ba6e-a2de5e336d95(jetbrains.mps.lang.migration/jetbrains.mps.lang.migration.methods)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1465982738277781862" name="jetbrains.mps.baseLanguage.structure.PlaceholderMember" flags="ng" index="2tJIrI" />
      <concept id="1154032098014" name="jetbrains.mps.baseLanguage.structure.AbstractLoopStatement" flags="nn" index="2LF5Ji">
        <child id="1154032183016" name="body" index="2LFqv$" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123134" name="parameter" index="3clF46" />
        <child id="1068580123135" name="body" index="3clF47" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ng" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
      </concept>
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <child id="5375687026011219971" name="member" index="jymVt" unordered="true" />
      </concept>
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
      </concept>
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ng" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="6329021646629104957" name="jetbrains.mps.baseLanguage.structure.TextCommentPart" flags="nn" index="3SKdUq">
        <property id="6329021646629104958" name="text" index="3SKdUp" />
      </concept>
      <concept id="6329021646629104954" name="jetbrains.mps.baseLanguage.structure.SingleLineComment" flags="nn" index="3SKdUt">
        <child id="6329021646629175155" name="commentPart" index="3SKWNk" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
    </language>
    <language id="c7d5b9dd-a05f-4be2-bc73-f2e16994cc67" name="jetbrains.mps.baseLanguage.lightweightdsl">
      <concept id="8880393040217246788" name="jetbrains.mps.baseLanguage.lightweightdsl.structure.MethodParameterInstance" flags="ig" index="ffn8J">
        <reference id="8880393040217294897" name="decl" index="ffrpq" />
      </concept>
      <concept id="3751132065236767083" name="jetbrains.mps.baseLanguage.lightweightdsl.structure.DependentTypeInstance" flags="ig" index="q3mfm">
        <reference id="3751132065236767084" name="decl" index="q3mfh" />
        <reference id="9097849371505568270" name="point" index="1QQUv3" />
      </concept>
      <concept id="3751132065236767060" name="jetbrains.mps.baseLanguage.lightweightdsl.structure.MethodInstance" flags="ig" index="q3mfD">
        <reference id="19209059688387895" name="decl" index="2VtyIY" />
      </concept>
      <concept id="6478870542308708689" name="jetbrains.mps.baseLanguage.lightweightdsl.structure.PropertyInstance" flags="ig" index="3tT0cZ">
        <reference id="8585153554445465961" name="decl" index="25KYV2" />
      </concept>
      <concept id="6478870542308703666" name="jetbrains.mps.baseLanguage.lightweightdsl.structure.MemberPlaceholder" flags="ng" index="3tTeZs">
        <property id="6478870542308703667" name="caption" index="3tTeZt" />
        <reference id="6478870542308703669" name="decl" index="3tTeZr" />
      </concept>
      <concept id="6478870542308871428" name="jetbrains.mps.baseLanguage.lightweightdsl.structure.StringPropertyInstance" flags="ig" index="3tYpXE">
        <property id="6478870542308871429" name="value" index="3tYpXF" />
      </concept>
    </language>
    <language id="3a13115c-633c-4c5c-bbcc-75c4219e9555" name="jetbrains.mps.lang.quotation">
      <concept id="5455284157993911077" name="jetbrains.mps.lang.quotation.structure.NodeBuilderInitProperty" flags="ng" index="2pJxcG">
        <reference id="5455284157993911078" name="property" index="2pJxcJ" />
      </concept>
      <concept id="5455284157993911097" name="jetbrains.mps.lang.quotation.structure.NodeBuilderInitPart" flags="ng" index="2pJxcK">
        <child id="5455284157993911094" name="expression" index="2pJxcZ" />
      </concept>
      <concept id="5455284157993863837" name="jetbrains.mps.lang.quotation.structure.NodeBuilder" flags="nn" index="2pJPEk">
        <child id="5455284157993863838" name="quotedNode" index="2pJPEn" />
      </concept>
      <concept id="5455284157993863840" name="jetbrains.mps.lang.quotation.structure.NodeBuilderNode" flags="nn" index="2pJPED">
        <reference id="5455284157993910961" name="concept" index="2pJxaS" />
        <child id="5455284157993911099" name="values" index="2pJxcM" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1143226024141" name="jetbrains.mps.lang.smodel.structure.SModelType" flags="in" index="H_c77" />
      <concept id="1171323947159" name="jetbrains.mps.lang.smodel.structure.Model_NodesOperation" flags="nn" index="2SmgA7">
        <child id="1758937410080001570" name="conceptArgument" index="1dBWTz" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="90746344-04fd-4286-97d5-b46ae6a81709" name="jetbrains.mps.lang.migration">
      <concept id="8352104482584315555" name="jetbrains.mps.lang.migration.structure.MigrationScript" flags="ig" index="3SyAh_">
        <property id="5820409521797704727" name="fromVersion" index="qMTe8" />
      </concept>
    </language>
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1153943597977" name="jetbrains.mps.baseLanguage.collections.structure.ForEachStatement" flags="nn" index="2Gpval">
        <child id="1153944400369" name="variable" index="2Gsz3X" />
        <child id="1153944424730" name="inputSequence" index="2GsD0m" />
      </concept>
      <concept id="1153944193378" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariable" flags="nr" index="2GrKxI" />
      <concept id="1153944233411" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariableReference" flags="nn" index="2GrUjf">
        <reference id="1153944258490" name="variable" index="2Gs0qQ" />
      </concept>
    </language>
  </registry>
  <node concept="3SyAh_" id="61MwuvYNUH2">
    <property role="qMTe8" value="1" />
    <property role="TrG5h" value="CompilerAsChild" />
    <node concept="3Tm1VV" id="61MwuvYNUH3" role="1B3o_S" />
    <node concept="3tTeZs" id="61MwuvYNUH4" role="jymVt">
      <property role="3tTeZt" value="&lt;no execute after&gt;" />
      <ref role="3tTeZr" to="slm6:7ay_HjIMt1a" resolve="execute after" />
    </node>
    <node concept="3tTeZs" id="61MwuvYNUH5" role="jymVt">
      <property role="3tTeZt" value="&lt;no required data&gt;" />
      <ref role="3tTeZr" to="slm6:3A3gNhf1WPI" resolve="requires data" />
    </node>
    <node concept="3tTeZs" id="61MwuvYNUH6" role="jymVt">
      <property role="3tTeZt" value="&lt;no produced data&gt;" />
      <ref role="3tTeZr" to="slm6:536fTXa4WHO" resolve="produces data" />
    </node>
    <node concept="2tJIrI" id="61MwuvYNUH7" role="jymVt" />
    <node concept="3tTeZs" id="61MwuvYNUH8" role="jymVt">
      <property role="3tTeZt" value="&lt;migration is not rerunnable&gt;" />
      <ref role="3tTeZr" to="slm6:1JWcQ2VeWIs" resolve="isRerunnable" />
    </node>
    <node concept="3tYpXE" id="61MwuvYNUIx" role="jymVt">
      <property role="TrG5h" value="description" />
      <property role="3tYpXF" value="enable to choose a compiler in the GNU platform" />
      <ref role="25KYV2" to="slm6:1_lSsE3RFpE" resolve="description" />
      <node concept="3Tm1VV" id="61MwuvYNUIz" role="1B3o_S" />
      <node concept="17QB3L" id="61MwuvYNUI$" role="1tU5fm" />
    </node>
    <node concept="q3mfD" id="61MwuvYNUHa" role="jymVt">
      <property role="TrG5h" value="execute" />
      <ref role="2VtyIY" to="slm6:4ubqdNOF9cA" resolve="execute" />
      <node concept="3Tm1VV" id="61MwuvYNUHc" role="1B3o_S" />
      <node concept="3clFbS" id="61MwuvYNUHe" role="3clF47">
        <node concept="2Gpval" id="61MwuvYNUUu" role="3cqZAp">
          <node concept="2GrKxI" id="61MwuvYNUUv" role="2Gsz3X">
            <property role="TrG5h" value="mod" />
          </node>
          <node concept="3clFbS" id="61MwuvYNUUw" role="2LFqv$">
            <node concept="3cpWs8" id="61MwuvYNVuC" role="3cqZAp">
              <node concept="3cpWsn" id="61MwuvYNVuF" role="3cpWs9">
                <property role="TrG5h" value="mo" />
                <node concept="H_c77" id="61MwuvYNVuB" role="1tU5fm" />
                <node concept="2GrUjf" id="61MwuvYNVvt" role="33vP2m">
                  <ref role="2Gs0qQ" node="61MwuvYNUUv" resolve="mod" />
                </node>
              </node>
            </node>
            <node concept="2Gpval" id="61MwuvYO0GO" role="3cqZAp">
              <node concept="2GrKxI" id="61MwuvYO0GP" role="2Gsz3X">
                <property role="TrG5h" value="platform" />
              </node>
              <node concept="3clFbS" id="61MwuvYO0GQ" role="2LFqv$">
                <node concept="3clFbF" id="61MwuvYO0WJ" role="3cqZAp">
                  <node concept="37vLTI" id="61MwuvYO1BY" role="3clFbG">
                    <node concept="2pJPEk" id="61MwuvYO1Ho" role="37vLTx">
                      <node concept="2pJPED" id="61MwuvYO2kz" role="2pJPEn">
                        <ref role="2pJxaS" to="51wr:61MwuvYNDp3" resolve="GCCCompiler" />
                        <node concept="2pJxcG" id="61MwuvYO2lM" role="2pJxcM">
                          <ref role="2pJxcJ" to="51wr:61MwuvYNDbU" resolve="binary" />
                          <node concept="2OqwBi" id="61MwuvYO2se" role="2pJxcZ">
                            <node concept="2GrUjf" id="61MwuvYO2oj" role="2Oq$k0">
                              <ref role="2Gs0qQ" node="61MwuvYO0GP" resolve="platform" />
                            </node>
                            <node concept="3TrcHB" id="61MwuvYO2BP" role="2OqNvi">
                              <ref role="3TsBF5" to="51wr:4BxItZJ4BoK" resolve="compiler" />
                            </node>
                          </node>
                        </node>
                        <node concept="2pJxcG" id="61MwuvYO2CQ" role="2pJxcM">
                          <ref role="2pJxcJ" to="51wr:61MwuvYNDc4" resolve="debugOptions" />
                          <node concept="2OqwBi" id="61MwuvYO2I7" role="2pJxcZ">
                            <node concept="2GrUjf" id="61MwuvYO2Ec" role="2Oq$k0">
                              <ref role="2Gs0qQ" node="61MwuvYO0GP" resolve="platform" />
                            </node>
                            <node concept="3TrcHB" id="61MwuvYO32p" role="2OqNvi">
                              <ref role="3TsBF5" to="51wr:2nSRgleEPDx" resolve="debugOptions" />
                            </node>
                          </node>
                        </node>
                        <node concept="2pJxcG" id="61MwuvYO33u" role="2pJxcM">
                          <ref role="2pJxcJ" to="51wr:61MwuvYNDbP" resolve="options" />
                          <node concept="2OqwBi" id="61MwuvYO38N" role="2pJxcZ">
                            <node concept="2GrUjf" id="61MwuvYO34S" role="2Oq$k0">
                              <ref role="2Gs0qQ" node="61MwuvYO0GP" resolve="platform" />
                            </node>
                            <node concept="3TrcHB" id="61MwuvYO3kC" role="2OqNvi">
                              <ref role="3TsBF5" to="51wr:4BxItZJ4BoL" resolve="compilerOptions" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="2OqwBi" id="61MwuvYO100" role="37vLTJ">
                      <node concept="2GrUjf" id="61MwuvYO0WI" role="2Oq$k0">
                        <ref role="2Gs0qQ" node="61MwuvYO0GP" resolve="platform" />
                      </node>
                      <node concept="3TrEf2" id="61MwuvYO1d5" role="2OqNvi">
                        <ref role="3Tt5mk" to="51wr:61MwuvYNDh_" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="2OqwBi" id="61MwuvYNVzQ" role="2GsD0m">
                <node concept="37vLTw" id="61MwuvYNVzk" role="2Oq$k0">
                  <ref role="3cqZAo" node="61MwuvYNVuF" resolve="mo" />
                </node>
                <node concept="2SmgA7" id="61MwuvYNV$W" role="2OqNvi">
                  <node concept="chp4Y" id="61MwuvYNVAG" role="1dBWTz">
                    <ref role="cht4Q" to="51wr:4BxItZJ4BoI" resolve="DesktopPlatform" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="61MwuvYNUWY" role="2GsD0m">
            <node concept="37vLTw" id="61MwuvYNUWf" role="2Oq$k0">
              <ref role="3cqZAo" node="61MwuvYNUHg" resolve="m" />
            </node>
            <node concept="liA8E" id="61MwuvYNVni" role="2OqNvi">
              <ref role="37wK5l" to="lui2:~SModule.getModels():java.lang.Iterable" resolve="getModels" />
            </node>
          </node>
        </node>
      </node>
      <node concept="ffn8J" id="61MwuvYNUHg" role="3clF46">
        <property role="TrG5h" value="m" />
        <ref role="ffrpq" to="slm6:7fCCGqboj9J" resolve="m" />
        <node concept="3uibUv" id="61MwuvYNUHf" role="1tU5fm">
          <ref role="3uigEE" to="lui2:~SModule" resolve="SModule" />
        </node>
      </node>
      <node concept="q3mfm" id="61MwuvYNUHh" role="3clF45">
        <ref role="q3mfh" to="slm6:4F5w8gPXEEe" />
        <ref role="1QQUv3" node="61MwuvYNUHa" resolve="execute" />
      </node>
    </node>
    <node concept="3tTeZs" id="61MwuvYNUHi" role="jymVt">
      <property role="3tTeZt" value="&lt;no result checking&gt;" />
      <ref role="3tTeZr" to="slm6:1JWcQ2VeXpD" resolve="check" />
    </node>
  </node>
  <node concept="3SyAh_" id="5BMpRxKCkYE">
    <property role="qMTe8" value="0" />
    <property role="TrG5h" value="dummyMigration" />
    <node concept="3Tm1VV" id="5BMpRxKCkYF" role="1B3o_S" />
    <node concept="3tTeZs" id="5BMpRxKCkYG" role="jymVt">
      <property role="3tTeZt" value="&lt;no execute after&gt;" />
      <ref role="3tTeZr" to="slm6:7ay_HjIMt1a" resolve="execute after" />
    </node>
    <node concept="3tTeZs" id="5BMpRxKCkYH" role="jymVt">
      <property role="3tTeZt" value="&lt;no required data&gt;" />
      <ref role="3tTeZr" to="slm6:3A3gNhf1WPI" resolve="requires data" />
    </node>
    <node concept="3tTeZs" id="5BMpRxKCkYI" role="jymVt">
      <property role="3tTeZt" value="&lt;no produced data&gt;" />
      <ref role="3tTeZr" to="slm6:536fTXa4WHO" resolve="produces data" />
    </node>
    <node concept="2tJIrI" id="5BMpRxKCkYJ" role="jymVt" />
    <node concept="3tTeZs" id="5BMpRxKCkYK" role="jymVt">
      <property role="3tTeZt" value="&lt;migration is not rerunnable&gt;" />
      <ref role="3tTeZr" to="slm6:1JWcQ2VeWIs" resolve="isRerunnable" />
    </node>
    <node concept="3tTeZs" id="5BMpRxKCkYL" role="jymVt">
      <property role="3tTeZt" value="&lt;description&gt;" />
      <ref role="3tTeZr" to="slm6:1_lSsE3RFpE" resolve="description" />
    </node>
    <node concept="q3mfD" id="5BMpRxKCkYM" role="jymVt">
      <property role="TrG5h" value="execute" />
      <ref role="2VtyIY" to="slm6:4ubqdNOF9cA" resolve="execute" />
      <node concept="3Tm1VV" id="5BMpRxKCkYO" role="1B3o_S" />
      <node concept="3clFbS" id="5BMpRxKCkYQ" role="3clF47">
        <node concept="3SKdUt" id="5BMpRxKCl68" role="3cqZAp">
          <node concept="3SKdUq" id="5BMpRxKCl69" role="3SKWNk">
            <property role="3SKdUp" value="present because the language version was initialilly 1 and therefore all usage are with version" />
          </node>
        </node>
        <node concept="3SKdUt" id="5BMpRxKCl9s" role="3cqZAp">
          <node concept="3SKdUq" id="5BMpRxKCl9u" role="3SKWNk">
            <property role="3SKdUp" value="this migration most likely will never trigger." />
          </node>
        </node>
      </node>
      <node concept="ffn8J" id="5BMpRxKCkYS" role="3clF46">
        <property role="TrG5h" value="m" />
        <ref role="ffrpq" to="slm6:7fCCGqboj9J" resolve="m" />
        <node concept="3uibUv" id="5BMpRxKCkYR" role="1tU5fm">
          <ref role="3uigEE" to="lui2:~SModule" resolve="SModule" />
        </node>
      </node>
      <node concept="q3mfm" id="5BMpRxKCkYT" role="3clF45">
        <ref role="q3mfh" to="slm6:4F5w8gPXEEe" />
        <ref role="1QQUv3" node="5BMpRxKCkYM" resolve="execute" />
      </node>
    </node>
    <node concept="3tTeZs" id="5BMpRxKCkYU" role="jymVt">
      <property role="3tTeZt" value="&lt;no result checking&gt;" />
      <ref role="3tTeZr" to="slm6:1JWcQ2VeXpD" resolve="check" />
    </node>
  </node>
</model>
