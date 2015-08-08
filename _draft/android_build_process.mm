<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1424013397143" ID="ID_973825573" MODIFIED="1424442249880" TEXT="Root">
<node CREATED="1424013397143" ID="ID_62951551" MODIFIED="1424442400162" POSITION="left" TEXT="release">
<node CREATED="1424013469390" ID="ID_1543959083" MODIFIED="1424013469390" TEXT="-set-release-mode">
<node CREATED="1424013626893" ID="ID_92385349" MODIFIED="1424013888784" TEXT="-set-mode-check">
<node CREATED="1424013910076" ID="ID_405989093" MODIFIED="1424013947833" TEXT="self:Check debug/release mode is set"/>
</node>
<node CREATED="1424013798665" ID="ID_1497483643" MODIFIED="1424013808453" TEXT="self: set properties to be release"/>
</node>
<node CREATED="1424013477512" ID="ID_1758770148" MODIFIED="1424013541306" TEXT="-release-obfuscation-check">
<node CREATED="1424016424902" ID="ID_51564927" MODIFIED="1424016480616" STYLE="fork" TEXT="self:out.dex.jar.input.ref">
<icon BUILTIN="help"/>
</node>
</node>
<node CREATED="1424013542431" ID="ID_344669541" MODIFIED="1424447077281" TEXT="-package">
<node CREATED="1424016670622" ID="ID_109520659" MODIFIED="1424442459080" TEXT="-dex">
<node CREATED="1424016879145" ID="ID_1852062921" MODIFIED="1424016881640" TEXT="-compile">
<node CREATED="1424016981365" ID="ID_1406310475" MODIFIED="1424016982582" TEXT="-pre-build"/>
<node CREATED="1424016988074" ID="ID_1137689164" MODIFIED="1424016988925" TEXT="-build-setup">
<node CREATED="1424355467138" ID="ID_608640030" MODIFIED="1424355603344" TEXT="-setup">
<node CREATED="1424355582740" ID="ID_1164272919" MODIFIED="1424355595976" TEXT="-check-env">
<node CREATED="1424355917285" ID="ID_574907341" MODIFIED="1424355922897" TEXT="self:SDK check"/>
</node>
<node CREATED="1424355706181" ID="ID_454035502" MODIFIED="1424355757284" TEXT="self:check project type is library/test/test project/"/>
</node>
<node CREATED="1424355476783" ID="ID_1387640299" MODIFIED="1424355557976" TEXT="self:set default properties, create output folder"/>
</node>
<node CREATED="1424016993674" ID="ID_343422354" MODIFIED="1424016994693" TEXT="-code-gen">
<node CREATED="1424355944030" ID="ID_1343229663" MODIFIED="1424356115364" TEXT="self:1)merge manifest, 2)if manifest has code, handle aidl, renderscript files, resource by aapt tool,  build confiigf ile"/>
</node>
<node CREATED="1424016999855" ID="ID_341500259" MODIFIED="1424017000773" TEXT="-pre-compile"/>
<node CREATED="1424017006166" ID="ID_1407963664" MODIFIED="1424355366728" TEXT="self:a. set test project/project compile path, compile code, filter for instrumented , ja if menifest file has code,">
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1424016887630" ID="ID_333140063" MODIFIED="1424016888448" TEXT="-post-compile"/>
<node CREATED="1424016892887" ID="ID_616078091" MODIFIED="1424016893793" TEXT="-obfuscate">
<node CREATED="1424356163696" ID="ID_667441634" MODIFIED="1424356179772" TEXT="self: if progurd is enable, do it"/>
</node>
<node CREATED="1424016920716" ID="ID_393632660" MODIFIED="1424016953496" TEXT="self:dex emma_device.jar if is.instrumented and not library project and manifest file has code"/>
</node>
<node CREATED="1424016679066" ID="ID_1388977300" MODIFIED="1424016680220" TEXT="-package-resources">
<node CREATED="1424440203865" ID="ID_1287088661" MODIFIED="1424440206434" TEXT="-crunch">
<node CREATED="1424440231023" ID="ID_1209186324" MODIFIED="1424440585191" TEXT="self:update pro-processed png cache by aapt tool(aapt crunch)"/>
</node>
<node CREATED="1424440207817" ID="ID_748626916" MODIFIED="1424440570618" TEXT="self: package resource if not a library by aapt tool (aapt package)"/>
</node>
<node CREATED="1424016753699" ID="ID_1061492082" MODIFIED="1424016815587" TEXT="self:package emma_device.jar if is.instrumented and not library project"/>
</node>
<node CREATED="1424013567239" ID="ID_737883343" MODIFIED="1424013576728" TEXT="-post-package"/>
<node CREATED="1424013585440" ID="ID_1800042437" MODIFIED="1424013586729" TEXT="-release-prompt-for-password">
<node CREATED="1424441045792" ID="ID_776609195" MODIFIED="1424441229627" TEXT="self: alert prompt to input keystore  and alise password if has keystore, and has no passworrd"/>
</node>
<node CREATED="1424013592320" ID="ID_847607832" MODIFIED="1424013593192" TEXT="-release-nosign">
<node CREATED="1424441079997" ID="ID_1428746001" MODIFIED="1424441306178" TEXT="self: echo to reminder sign manually if theere is not key storre"/>
</node>
<node CREATED="1424013598897" ID="ID_1156510316" MODIFIED="1424013599856" TEXT="-release-sign">
<node CREATED="1424441392181" ID="ID_333420717" MODIFIED="1424441429831" TEXT="self: sign the apk and zip align the apk if has key store and not library prjoect"/>
</node>
<node CREATED="1424013605167" ID="ID_895808577" MODIFIED="1424441745367" TEXT="-post-build"/>
</node>
<node CREATED="1424441862372" ID="ID_1434255186" MODIFIED="1424442305104" POSITION="left" TEXT="debug">
<node CREATED="1424441869427" ID="ID_817309544" MODIFIED="1424441888332" TEXT="-set-debug-files">
<node CREATED="1424441970352" ID="ID_121254856" MODIFIED="1424441971627" TEXT="-set-mode-check"/>
<node CREATED="1424441974033" ID="ID_1799375153" MODIFIED="1424442054729" TEXT="self: specify the apk name and set debug mode in property"/>
</node>
<node CREATED="1424441895701" ID="ID_494272918" MODIFIED="1424441896940" TEXT="-do-debug">
<node CREATED="1424442112209" ID="ID_414976536" MODIFIED="1424442113719" TEXT="-set-debug-mode"/>
<node CREATED="1424442119942" ID="ID_1945147201" MODIFIED="1424442120879" TEXT="-debug-obfuscation-check"/>
<node CREATED="1424442121950" ID="ID_1090626582" MODIFIED="1424442129388" TEXT="-package"/>
<node CREATED="1424442135964" ID="ID_274447591" MODIFIED="1424442137079" TEXT="-post-package"/>
<node CREATED="1424442143781" ID="ID_327745831" MODIFIED="1424442168894" TEXT="self: zip align the apk if  not library project"/>
</node>
<node CREATED="1424441904093" ID="ID_1815488837" MODIFIED="1424441905005" TEXT="-post-build"/>
</node>
<node CREATED="1424442254929" ID="ID_335762377" MODIFIED="1424442272836" POSITION="left" TEXT="instrument">
<node CREATED="1424442289857" ID="ID_1127065238" MODIFIED="1424442299331" TEXT="-set-instrumented-mode">
<node CREATED="1424442366216" ID="ID_562049171" MODIFIED="1424442367410" TEXT="-set-mode-check"/>
<node CREATED="1424442368058" ID="ID_1598101272" MODIFIED="1424442391645" TEXT="self: set build is instrumented in property"/>
</node>
<node CREATED="1424442299953" ID="ID_1029385550" MODIFIED="1424442301099" TEXT="-do-debug"/>
</node>
</node>
</map>
