---
title: Functions and Objects available in Adobe Campaign
categories: [opensource,adobe campaign]
---
Excerpt here...
<p class="text-center">🐍👑🌍</p>
<!--more-->

## Functions and objects

Can be used in JSSPs, Workflows and Web apps

JSSP ACC debug - Constants, objects and functions

{% raw %}
| Name | Type | toString() |
|-|-|-|
| Function | function | function Function() |
| Object | function | function Object() |
| eval | function | function eval() |
| alert | function | function alert() |
| logError | function | function logError() |
| logWarning | function | function logWarning() |
| logInfo | function | function logInfo() |
| logVerbose | function | function logVerbose() |
| formatDate | function | function formatDate() |
| parseDate | function | function parseDate() |
| parseTimeStamp | function | function parseTimeStamp() |
| digestStrMd5 | function | function digestStrMd5() |
| digestStrSha1 | function | function digestStrSha1() |
| digestStrSha224 | function | function digestStrSha224() |
| digestStrSha256 | function | function digestStrSha256() |
| digestStrSha384 | function | function digestStrSha384() |
| digestStrSha512 | function | function digestStrSha512() |
| HMACStr | function | function HMACStr() |
| escapeXmlStr | function | function escapeXmlStr() |
| encodeHtml | function | function encodeHtml() |
| htmlToText | function | function htmlToText() |
| getUrl | function | function getUrl() |
| patchAttribute | function | function patchAttribute() |
| startBuffering | function | function startBuffering() |
| stopBuffering | function | function stopBuffering() |
| simpleRevCrypt | function | function simpleRevCrypt() |
| reversibleCrypt | function | function reversibleCrypt() |
| reversibleDecrypt | function | function reversibleDecrypt() |
| unreversibleCrypt | function | function unreversibleCrypt() |
| compareUnreversibleCrypt | function | function compareUnreversibleCrypt() |
| escapeUrl | function | function escapeUrl() |
| installDirectory | function | function installDirectory() |
| encryptDES | function | function encryptDES() |
| decryptDES | function | function decryptDES() |
| DESencrypt | function | function DESencrypt() |
| DESdecrypt | function | function DESdecrypt() |
| obfuscate | function | function obfuscate() |
| unobfuscate | function | function unobfuscate() |
| expandVar | function | function expandVar() |
| logon | function | function logon() |
| logonEscalation | function | function logonEscalation() |
| logonWithUser | function | function logonWithUser() |
| logonWithToken | function | function logonWithToken() |
| logonWithContext | function | function logonWithContext() |
| getCurrentLocale | function | function getCurrentLocale() |
| getOperatorLocale | function | function getOperatorLocale() |
| findClientIP | function | function findClientIP() |
| checkHTTPAllowed | function | function checkHTTPAllowed() |
| canShowErrors | function | function canShowErrors() |
| useSecurityToken | function | function useSecurityToken() |
| httpOnlySessionCookie | function | function httpOnlySessionCookie() |
| getNewSecurityToken | function | function getNewSecurityToken() |
| getBearerToken | function | function getBearerToken() |
| IMSLoggedIn | function | function IMSLoggedIn() |
| digitalContentToJST | function | function digitalContentToJST() |
| loadFile | function | function loadFile() |
| loadXmlFile | function | function loadXmlFile() |
| cryptString | function | function cryptString() |
| decryptString | function | function decryptString() |
| decryptWithDESCompat | function | function decryptWithDESCompat() |
| getEnv | function | function getEnv() |
| writeraw | function | function writeraw() |
| loadString | function | function loadString() |
| write | function | function write() |
| writeln | function | function writeln() |
| getOption | function | function getOption() |
| setOption | function | function setOption() |
| sqlGetString | function | function sqlGetString() |
| sqlGetStringOnDataSource | function | function sqlGetStringOnDataSource() |
| sqlGetMemo | function | function sqlGetMemo() |
| sqlGetMemoOnDataSource | function | function sqlGetMemoOnDataSource() |
| sqlGetInt | function | function sqlGetInt() |
| sqlGetIntOnDataSource | function | function sqlGetIntOnDataSource() |
| sqlGetDouble | function | function sqlGetDouble() |
| sqlGetDoubleOnDataSource | function | function sqlGetDoubleOnDataSource() |
| sqlGetDate | function | function sqlGetDate() |
| sqlGetDateOnDataSource | function | function sqlGetDateOnDataSource() |
| sqlExec | function | function sqlExec() |
| getCurrentDate | function | function getCurrentDate() |
| sqlExecOnDataSource | function | function sqlExecOnDataSource() |
| sqlExecScript | function | function sqlExecScript() |
| sqlSelect | function | function sqlSelect() |
| generateImgTag | function | function generateImgTag() |
| getImageUrl | function | function getImageUrl() |
| getNewIdRange | function | function getNewIdRange() |
| dictionaryCheck | function | function dictionaryCheck() |
| self | object | [object global] |
| document | object | [object global] |
| instanceName | string | my_instance1 |
| databaseId | string | u0A1E609D002AD358 |
| undefined | undefined | undefined |
| Array | function | function Array() |
| Boolean | function | function Boolean() |
| Error | function | function Error() |
| InternalError | function | function InternalError() |
| EvalError | function | function EvalError() |
| RangeError | function | function RangeError() |
| ReferenceError | function | function ReferenceError() |
| SyntaxError | function | function SyntaxError() |
| TypeError | function | function TypeError() |
| URIError | function | function URIError() |
| Math | object | [object Math] |
| isNaN | function | function isNaN() |
| isFinite | function | function isFinite() |
| parseFloat | function | function parseFloat() |
| parseInt | function | function parseInt() |
| Number | function | function Number() |
| NaN | number | NaN |
| Infinity | number | Infinity |
| JSON | object | [object JSON] |
| RegExp | function | function RegExp() |
| escape | function | function escape() |
| unescape | function | function unescape() |
| uneval | function | function uneval() |
| decodeURI | function | function decodeURI() |
| encodeURI | function | function encodeURI() |
| decodeURIComponent | function | function decodeURIComponent() |
| encodeURIComponent | function | function encodeURIComponent() |
| String | function | function String() |
| Int8Array | function | function Int8Array() |
| Uint8Array | function | function Uint8Array() |
| Int16Array | function | function Int16Array() |
| Uint16Array | function | function Uint16Array() |
| Int32Array | function | function Int32Array() |
| Uint32Array | function | function Uint32Array() |
| Float32Array | function | function Float32Array() |
| Float64Array | function | function Float64Array() |
| Uint8ClampedArray | function | function Uint8ClampedArray() |
| ArrayBuffer | function | function ArrayBuffer() |
| Namespace | function | function Namespace() |
| QName | function | function QName() |
| isXMLName | function | function isXMLName() |
| XML | function | function XML() |
| XMLList | function | function XMLList() |
| Iterator | function | function Iterator() |
| StopIteration | object | [object StopIteration] |
| Date | function | function Date() |
| Proxy | object | [object Proxy] |
| HttpSoapConnection | function | function HttpSoapConnection() |
| SoapService | function | function SoapService() |
| SoapRequest | object | [object SoapRequest] |
| MemoryBuffer | function | function MemoryBuffer() |
| StringGroup | function | function StringGroup() |
| UserContext | object | [object UserContext] |
| HttpClientRequest | function | function HttpClientRequest() |
| HttpClientResponse | object | [object HttpClientResponse] |
| HttpResponseHeader | object | [object HttpResponseHeader] |
| HttpHeader | object | [object HttpHeader] |
| EntityCollection | object | [object EntityCollection] |
| ScriptArrayIterator | object | [object ScriptArrayIterator] |
| NLNamespace | object | [object NLNamespace] |
| NLSchema | object | [object NLSchema] |
| adb | object | [object NLNamespace] |
| ncm | object | [object NLNamespace] |
| nl | object | [object NLNamespace] |
| nms | object | [object NLNamespace] |
| xtk | object | [object NLNamespace] |
| temp | object | [object NLNamespace] |
| tst | object | [object NLNamespace] |
| NLWS | object | [object NLNamespace] |
| encryptedTrackingPasswordChecker | function | function encryptedTrackingPasswordChecker() |
| loadLibrary | function | function loadLibrary() |
| loadLibraryDebug | function | function loadLibraryDebug() |
| applyXsl | function | function applyXsl() |
| applyXslFromFile | function | function applyXslFromFile() |
| applyXslFromStyleSheet | function | function applyXslFromStyleSheet() |
| saveFile | function | function saveFile() |
| saveXmlFile | function | function saveXmlFile() |
| saveFileFromBase64 | function | function saveFileFromBase64() |
| saveString | function | function saveString() |
| saveXmlString | function | function saveXmlString() |
| saveBase64String | function | function saveBase64String() |
| fileRename | function | function fileRename() |
| fileGetTempName | function | function fileGetTempName() |
| fileIsRelative | function | function fileIsRelative() |
| fileSize | function | function fileSize() |
| decrypt | function | function decrypt() |
| crypt | function | function crypt() |
| applyXmlDiff | function | function applyXmlDiff() |
| convertJst | function | function convertJst() |
| scanCustomFields | function | function scanCustomFields() |
| scanCustomFieldsEx | function | function scanCustomFieldsEx() |
| scanURLs | function | function scanURLs() |
| setEnv | function | function setEnv() |
| sleep | function | function sleep() |
| visitorCookieName | function | function visitorCookieName() |
| genNewVisitorId | function | function genNewVisitorId() |
| checkRight | function | function checkRight() |
| getUUID | function | function getUUID() |
| execCommand | function | function execCommand() |
| setMaxProgress | function | function setMaxProgress() |
| setProgress | function | function setProgress() |
| startProgressTransaction | function | function startProgressTransaction() |
| endProgressTransaction | function | function endProgressTransaction() |
| clearProgressTransactions | function | function clearProgressTransactions() |
| logProperty | function | function logProperty() |
| executeQuery | function | function executeQuery() |
| executeQueryEx | function | function executeQueryEx() |
| getChartData | function | function getChartData() |
| digestChartData | function | function digestChartData() |
| expandAbstractFormQuery | function | function expandAbstractFormQuery() |
| getTableData | function | function getTableData() |
| generateTable | function | function generateTable() |
| analyzeExpr | function | function analyzeExpr() |
| analyzeExprEx | function | function analyzeExprEx() |
| parseExprToAST | function | function parseExprToAST() |
| parseExprToASTEx | function | function parseExprToASTEx() |
| expandJst | function | function expandJst() |
| releaseContext | function | function releaseContext() |
| setContext | function | function setContext() |
| registerQuerySchema | function | function registerQuerySchema() |
| registerQuerySchemaEx | function | function registerQuerySchemaEx() |
| buildSqlTable | function | function buildSqlTable() |
| setSchemaSqlTable | function | function setSchemaSqlTable() |
| buildColumnList | function | function buildColumnList() |
| registerSchema | function | function registerSchema() |
| getSchema | function | function getSchema() |
| interactionProposeOffers | function | function interactionProposeOffers() |
| interactionInsertProp | function | function interactionInsertProp() |
| interactionUpdateProp | function | function interactionUpdateProp() |
| interactionInsertVisitor | function | function interactionInsertVisitor() |
| interactionLogError | function | function interactionLogError() |
| File | function | function File() |
| FileIterator | function | [object FileIterator] |
| ZipFile | function | function ZipFile() |
| DOMNode | object | [object DOMNode] |
| DOMDocument | function | function DOMDocument() |
| DOMElement | object | [object DOMElement] |
| DOMAttr | object | [object DOMAttr] |
| DOMCharacterData | object | [object DOMCharacterData] |
| NLProxy | function | function NLProxy() |
| DBEngine | object | [object DBEngine] |
| DBStatement | object | [object DBStatement] |
| DBStatementIterator | function | [object DBStatementIterator] |
| FTP | function | function FTP() |
| Application | object | [object Application] |
| CurrentLogin | object | [object CurrentLogin] |
| EnumValue | object | [object EnumValue] |
| Enum | object | [object Enum] |
| SchemaKey | object | [object SchemaKey] |
| NodeDef | object | [object NodeDef] |
| Schema | function | function Schema() |
| BroadLogNormalizer | function | function BroadLogNormalizer() |
| instanceVarDir | string | /usr/local/neolane/nl6/var/my_instance1 |
| instanceConfDir | string | /usr/local/neolane/nl6/conf/ |
| application | object | [object Application] |
| testEmail | function | function testEmail() |
| testNLStatBasic | function | function testNLStatBasic() |
| testNLStatSync | function | function testNLStatSync() |
| testParseTimeStamp | function | function testParseTimeStamp() |
| testRunWorkflow | function | function testRunWorkflow() |
| testMerge | function | function testMerge() |
| testFindNode | function | function testFindNode() |
| testXmlFindAndReleaseNode | function | function testXmlFindAndReleaseNode() |
| testJSONParse | function | function testJSONParse() |
| testAESEncryptXml | function | function testAESEncryptXml() |
| testAESDecryptXml | function | function testAESDecryptXml() |
| testAESEncryptString | function | function testAESEncryptString() |
| testAESDecryptString | function | function testAESDecryptString() |
| testMidSourcingFilter | function | function testMidSourcingFilter() |
| testMidSourcingFilterWithConfiguration | function | function testMidSourcingFilterWithConfiguration() |
| testMimeEncode | function | function testMimeEncode() |
| usePKCS5ToHashPassword | function | function usePKCS5ToHashPassword() |
| checkPassword | function | function checkPassword() |
| testSplitString | function | function testSplitString() |
| generateTrackingTag | function | function generateTrackingTag() |
| HttpServletRequest | object | [object HttpServletRequest] |
| HttpServletResponse | object | [object HttpServletResponse] |
| RequestParameters | object | [object RequestParameters] |
| Cookie | function | function Cookie() |
| Cookies | object | [object Cookies] |
| CaptchaValidate | function | function CaptchaValidate() |
| CaptchaIDGen | function | function CaptchaIDGen() |
| escapeXmlString | function | function escapeXmlString() |
| sg_xtk_dashboard | object | [object StringGroup] |
| NL | object | [object Object] |
| ROOT | object | [object global] |
| SERVER | boolean | true |
| CLIENT | boolean | false |
| DEBUG | boolean | false |
| LOGS | boolean | true |
| console | object | [object Object] |
| _webApp_fco_debug_jssp_context__preview | function | function _webApp_fco_debug_jssp_context__preview(request, response) { if (typeof NL !== "undefined" && NL.client) { NL.client._jsspReinit( |
| formatLanguage | string | en-us |
| defaultOverviewListLineRenderer | function | function defaultOverviewListLineRenderer(rowCustomization, noDelete) { "use strict"; var jsonActions = {controller: controller, commands: []}; |
| defaultGridListLineRenderer | function | function defaultGridListLineRenderer(rowCustomization) { "use strict"; return function (row, index, $container, $list) {var $icon, contentDesc |
| defaultLinkListLineRenderer | function | function defaultLinkListLineRenderer(rowCustomization) { "use strict"; return function (row, index, $container, $list) {var linkConf = {ellips |
| defaultBlockViewListLineRenderer | function | function defaultBlockViewListLineRenderer(item, index, $container) { "use strict"; var lastViewConf = NL.session.confManager.get(NL.session.un |
| defaultLinkEditLineRenderer | function | function defaultLinkEditLineRenderer(rowCustomization) { "use strict"; return function (row, index, $container, $list) {var $line, $icon, icon |
| initDashboard | function | function initDashboard(menuEntries, isInConsole) { "use strict"; return function () {$("#dashboardHeader").nlDashboardHeader({controller: cont |
| dashboardNavigationBlockCreation | function | function dashboardNavigationBlockCreation(content, overflowContent, options) { "use strict"; var $block; if (!NL.isEmpty(options.selector) |
| getReportViewConf | function | function getReportViewConf() { "use strict"; var $reportSection = $("#reportSection"); var $reportList = $reportSection.find("#reportList" |
| getSwitchableViewConf | function | function getSwitchableViewConf(viewSettings) { "use strict"; var viewConf = {type: "code", onDisplay: function () {var section = document.getE |
| getGeneralViewConf | function | function getGeneralViewConf(viewName, viewImage, viewParams) { "use strict"; return getSwitchableViewConf({view: viewName, label: nms_campaign |
| getUsableVerticalSpace | function | function getUsableVerticalSpace(epsilon) { "use strict"; if (epsilon === undefined) { epsilon = 0; } var headersHeight = 0; |
| _collectViews | function | function _collectViews(viewList, viewsData, blockName, dashboardContext, filterView, bIsOtherView, defaultViewsLabel) { var filterViewDef = []; |
| _genNavtreeViewBlock | function | function _genNavtreeViewBlock(universe, blockName, mainContentConfVarName, mainContentWidgetVarName, overflowContentConfVarName, overflowContentWidget |
| _getAvailableActions | function | function _getAvailableActions(actions, dashboardContext, defaultViewsLabel) { var availableActions = []; _collectViews(actions, availableActio |
| XtkIEEvent | function | function XtkIEEvent() { "use strict"; this.data = event; } |
| XtkGeckoEvent | function | function XtkGeckoEvent(event) { "use strict"; this.data = event; } |
| NewEvent | function | function NewEvent(evt) { "use strict"; if (typeof event == "undefined") { return new XtkGeckoEvent(evt); } else { return n |
| findXtkObject | function | function findXtkObject(htmlObject) { "use strict"; if (htmlObject == null) { return null; } if (htmlObject.xtkObject != undefi |
| g_xtkContext | object | [object Object] |
| openView | function | function openView(url) { "use strict"; var divLoading = document.getElementById("divLoading"); if (divLoading) { divLoading.style. |
| addSecurityToken | function | function addSecurityToken(strUrl, strSecurityToken, bAlways) {  |
| isNeolaneConsole | function | function isNeolaneConsole() { "use strict"; if (NL && NL.Cookie) { return (new NL.Cookie("_console")).getValue(); } return (ne |
| REPORT_COLORS | object | #3B87A2,#FF8012,#8CA23B,#A23B5E,#004A62,#FFCCA0,#C75400,#CAD4A5,#A5C8D4,#6D0026,#D4A5B4,#4F6400 |
| htmlSanitizer | function | function () { var html4 = {}; html4.eflags = {OPTIONAL_ENDTAG: 1, BREAKS_FLOW: 2, EMPTY: 4, NAVIGATES: 8, CDATA: 16, RCDATA: 32, UNSAFE: 64}; |
| WORKFLOW_STATE_EDITION | number | 0 |
| WORKFLOW_STATE_RUNNING | number | 2 |
| WORKFLOW_STATE_STARTED | number | 11 |
| WORKFLOW_STATE_TESTING | number | 9 |
| WORKFLOW_STATE_STARTING | number | 10 |
| WORKFLOW_STATE_PAUSING | number | 12 |
| WORKFLOW_STATE_PAUSED | number | 13 |
| WORKFLOW_STATE_RESUMING | number | 14 |
| WORKFLOW_STATE_STOPPING | number | 15 |
| WORKFLOW_STATE_STOPPING2 | number | 16 |
| WORKFLOW_STATE_RESTARTING | number | 17 |
| WORKFLOW_STATE_RESTARTING2 | number | 18 |
| WORKFLOW_STATE_STOPPED | number | 20 |
| WORKFLOW_STATE_FINISHED | number | 20 |
| WORKFLOW_STARTSTATE_UNDEFINED | number | 0 |
| WORKFLOW_STARTSTATE_STARTING | number | 1 |
| OPERATION_STATUS_ALL | number | -1 |
| OPERATION_STATUS_EDITION | number | 0 |
| OPERATION_STATUS_STARTED | number | 1 |
| OPERATION_STATUS_FINISHED | number | 2 |
| OPERATION_STATUS_CANCELING | number | 3 |
| OPERATION_STATUS_CANCELED | number | 4 |
| OPERATION_CANCELSTATE_UNDEFINED | number | 0 |
| OPERATION_CANCELSTATE_CANCELING | number | 3 |
| OPERATION_CANCELSTATE_CANCELED | number | 4 |
| OPERATION_BUDGETSTATUS_EDITION | number | 0 |
| OPERATION_BUDGETSTATUS_DEFINED | number | 1 |
| OPERATION_BUDGETSTATUS_FINISHED | number | 2 |
| OPERATION_LOG_TYPE_ERROR | number | 0 |
| OPERATION_LOG_TYPE_WARNING | number | 1 |
| OPERATION_LOG_TYPE_INFO | number | 2 |
| OPERATION_LOG_TYPE_STATUS | number | 3 |
| OPERATION_LOG_TYPE_VERBOSE | number | 4 |
| OPERATION_TYPE_UNIQUE | number | 0 |
| OPERATION_TYPE_RECURRENT | number | 1 |
| OPERATION_TYPE_PERIODIC | number | 2 |
| TASK_STATUS_EDITION | number | 0 |
| TASK_STATUS_FORECASTED | number | 1 |
| TASK_STATUS_STARTED | number | 2 |
| TASK_STATUS_FINISHED | number | 3 |
| TASK_STATUS_CANCELED | number | 4 |
| TASK_STATUS_PENDING | number | 5 |
| TASK_STATUS_VALIDATED | number | 6 |
| TASK_STATUS_REFUSED | number | 7 |
| TASK_PRIORITY_NORMAL | number | 1 |
| TASK_TYPE_TASK | number | 0 |
| TASK_TYPE_MILESTONE | number | 1 |
| TASK_TYPE_GROUPING | number | 2 |
| TASK_TYPE_NOTIFICATION | number | 3 |
| TASK_TYPE_ASSET | number | 4 |
| TASK_VALIDATIONTYPE_TARGET | number | 0 |
| TASK_VALIDATIONTYPE_CONTENT | number | 1 |
| TASK_VALIDATIONTYPE_BUDGET | number | 2 |
| TASK_VALIDATIONTYPE_EXTRACTION | number | 3 |
| TASK_VALIDATIONTYPE_FCP | number | 4 |
| TASK_VALIDATIONTYPE_SANDBOX | number | 5 |
| TASK_VALIDATIONTYPE_AVAILABLE | number | 6 |
| TASK_VALIDATIONTYPE_EXTERNAL | number | 7 |
| TASK_VALIDATIONSTATE_UNDEFINED | number | 0 |
| TASK_VALIDATIONSTATE_VALIDATED | number | 1 |
| TASK_VALIDATIONSTATE_REFUSED | number | 2 |
| TASK_NTF_INITIAL | number | 0 |
| TASK_NTF_TASK | number | 1 |
| TASK_NTF_FINISHED | number | 2 |
| TASK_NTF_CANCELED | number | 3 |
| TASK_NTF_RES_FINISHED | number | 4 |
| TASK_NTF_RES_CANCELED | number | 5 |
| TASK_NTF_VALIDATED | number | 6 |
| TASK_NTF_REFUSED | number | 7 |
| TASK_NTF_ALERT | number | 8 |
| TASK_FILTER_ALL | number | 50 |
| TASK_FILTER_LATE | number | 51 |
| DELIVERY_FILTER_ALL | number | 0 |
| DELIVERY_FILTER_EDITION | number | 1 |
| DELIVERY_FILTER_TOVALIDATE | number | 2 |
| DELIVERY_FILTER_STARTED | number | 3 |
| DELIVERY_FILTER_FINISHED | number | 4 |
| DELIVERY_FILTER_FAILED | number | 5 |
| DELIVERY_FILTER_CANCELED | number | 6 |
| DELIVERY_STATE_EDITION | number | 0 |
| DELIVERY_STATE_TARGETPENDING | number | 11 |
| DELIVERY_STATE_TARGETSELECTION | number | 12 |
| DELIVERY_STATE_TARGETARBITRATION | number | 13 |
| DELIVERY_STATE_TARGETREADY | number | 15 |
| DELIVERY_STATE_MSGPREPENDING | number | 21 |
| DELIVERY_STATE_PREPARATION | number | 22 |
| DELIVERY_STATE_MESSAGEFINISHED | number | 25 |
| DELIVERY_STATE_PREPAREFAILED | number | 37 |
| DELIVERY_STATE_READY | number | 45 |
| DELIVERY_STATE_DELAYED | number | 51 |
| DELIVERY_STATE_STARTED | number | 55 |
| DELIVERY_STATE_RETRYPENDING | number | 61 |
| DELIVERY_STATE_RETRY | number | 62 |
| DELIVERY_STATE_CANCELPENDING | number | 81 |
| DELIVERY_STATE_CANCEL | number | 85 |
| DELIVERY_STATE_PAUSEPENDING | number | 71 |
| DELIVERY_STATE_PAUSE | number | 75 |
| DELIVERY_STATE_FINISHED | number | 95 |
| DELIVERY_STATE_DELETED | number | 100 |
| DELIVERY_STATUS_CANCELED | number | 4 |
| DELIVERY_DELETE_STATUS_DELETED | number | 2 |
| DELIVERY_MESSAGETYPE_EMAIL | number | 0 |
| DELIVERY_MESSAGETYPE_SMS | number | 1 |
| DELIVERY_MESSAGETYPE_PHONE | number | 2 |
| DELIVERY_MESSAGETYPE_PAPER | number | 3 |
| DELIVERY_MESSAGETYPE_FAX | number | 4 |
| DELIVERY_MESSAGETYPE_AGENCY | number | 5 |
| DELIVERY_MESSAGETYPE_FACEBOOK | number | 20 |
| DELIVERY_MESSAGETYPE_TWITTER | number | 25 |
| DELIVERY_MESSAGETYPE_MOBILEAPP | number | 40 |
| DELIVERY_MESSAGETYPE_IOS | number | 41 |
| DELIVERY_MESSAGETYPE_ANDROID | number | 42 |
| DELIVERY_MESSAGETYPE_OTHER | number | 120 |
| DELIVERY_PUBLICATION_STATUS_NOTAPPLICABLE | number | 0 |
| DELIVERY_PUBLICATION_STATUS_EDITION | number | 1 |
| DELIVERY_PUBLICATION_STATUS_DEPLOYED | number | 2 |
| DELIVERY_PUBLICATION_STATUS_FAILED | number | 3 |
| DELIVERY_PUBLICATION_STATUS_PRODUCTION | number | 100 |
| MESSAGE_TYPE_TASK | number | 9 |
| DELIVERY_STATUS_IGNORED | number | 0 |
| DELIVERY_STATUS_SENT | number | 1 |
| DELIVERY_STATUS_TOSENT | number | 6 |
| DELIVERY_MODE_EXTERNAL | number | 0 |
| DELIVERY_MODE_BULK | number | 1 |
| DELIVERY_MODE_DESCRIPTIVE | number | 2 |
| DELIVERY_MODE_MIDSOURCING | number | 4 |
| DELIVERY_KPI_ERROR_THRESHOLD | number | 85 |
| DELIVERY_KPI_WARNING_THRESHOLD | number | 95 |
| FAILURE_RAISON_CONTROL | number | 127 |
| MESSAGE_TYPE_ALL | number | 127 |
| VALIDATION_MODE_AUTO | number | 0 |
| VALIDATION_MODE_MANUAL | number | 1 |
| DEFAULT_MAX_RUNNINGS | number | 10 |
| TIME_RANGE_DAY | number | 0 |
| TIME_RANGE_FORECASTED | number | 1 |
| STOCKLINE_TYPE_REAL | number | 0 |
| STOCKLINE_TYPE_ORDER | number | 1 |
| STOCKLINE_TYPE_CONSUME | number | 2 |
| CONTENT_STATUS_EDITION | number | 0 |
| CONTENT_STATUS_INWAITING | number | 1 |
| CONTENT_STATUS_VALIDATED | number | 2 |
| CONTENT_STATUS_REFUSED | number | 3 |
| CONTENT_STATUS_FCP_INWAITING | number | 4 |
| CONTENT_STATUS_FCP_VALIDATED | number | 5 |
| CONTENT_STATUS_FCP_REFUSED | number | 6 |
| CONTENT_STATUS_INPROGRESS | number | 10 |
| CONTENT_STATUS_AVAILABLE | number | 11 |
| CONTENT_STATUS_EXTERNAL_INWAITING | number | 15 |
| CONTENT_STATUS_EXTERNAL_REFUSED | number | 16 |
| TARGET_STATUS_EDITION | number | 0 |
| TARGET_STATUS_INWAITING | number | 1 |
| TARGET_STATUS_VALIDATED | number | 2 |
| TARGET_STATUS_REFUSED | number | 3 |
| BUDGET_STATUS_EDITION | number | 0 |
| BUDGET_STATUS_INWAITING | number | 1 |
| BUDGET_STATUS_VALIDATED | number | 2 |
| BUDGET_STATUS_REFUSED | number | 3 |
| COMPUTATION_STATE_UNDEFINED | number | 0 |
| COMPUTATION_STATE_INWAITING | number | 1 |
| COMPUTATION_STATE_INPROCESS | number | 2 |
| COMPUTATION_STATE_FINISHED | number | 3 |
| EXTRACTION_STATUS_EDITION | number | 0 |
| EXTRACTION_STATUS_INWAITING | number | 1 |
| EXTRACTION_STATUS_VALIDATED | number | 2 |
| EXTRACTION_STATUS_REFUSED | number | 3 |
| EXTRACTION_STATUS_SENT | number | 4 |
| SANDBOX_STATUS_EDITION | number | 0 |
| SANDBOX_STATUS_INWAITING | number | 1 |
| SANDBOX_STATUS_VALIDATED | number | 2 |
| SANDBOX_STATUS_REFUSED | number | 3 |
| VALIDATION_TYPE_TARGET | number | 0 |
| VALIDATION_TYPE_CONTENT | number | 1 |
| VALIDATION_TYPE_BUDGET | number | 2 |
| VALIDATION_TYPE_EXTRACTION | number | 3 |
| VALIDATION_TYPE_FCP | number | 4 |
| VALIDATION_TYPE_SANDBOX | number | 5 |
| VALIDATION_TYPE_AVAILABLE | number | 6 |
| VALIDATION_TYPE_EXTERNAL | number | 7 |
| VALIDATION_TYPE_STARTING | number | 9 |
| VALIDATION_TYPE_MANUAL | number | 10 |
| VALIDATION_TYPE_SUBMITFCP | number | 11 |
| VALIDATION_TYPE_SUBMITCONTENT | number | 12 |
| VALIDATION_TYPE_SUBMITEDITION | number | 13 |
| VALIDATION_TYPE_VALIDATION | number | 20 |
| VALIDATION_TYPE_PUBLICATION | number | 21 |
| VALIDATION_TYPE_CANCELLATION | number | 22 |
| VALIDATION_TYPE_RESERVATION | number | 23 |
| VALIDATION_TYPE_FORMAT | number | 24 |
| VALIDATION_TYPE_SUBMITBUDGET | number | 25 |
| VALIDATION_TYPE_LOCK | number | 30 |
| VALIDATION_TYPE_UNLOCK | number | 31 |
| ASSET_STATUS_EDITION | number | 0 |
| ASSET_STATUS_VALIDATIONPENDING | number | 1 |
| ASSET_STATUS_INPROCESS | number | 2 |
| ASSET_STATUS_VALIDATED | number | 3 |
| ASSET_STATUS_REFUSED | number | 4 |
| ASSET_STATUS_PUBLICATIONPENDING | number | 5 |
| ASSET_STATUS_PUBLICATIONINPROCESS | number | 6 |
| ASSET_STATUS_PUBLISHED | number | 7 |
| ASSET_STATUS_CANCELED | number | 8 |
| DATATRANSFER_STATUS_EDITION | number | 0 |
| DATATRANSFER_STATUS_RUNNING | number | 2 |
| DATATRANSFER_STATUS_CANCELING | number | 3 |
| DATATRANSFER_STATUS_CANCELED | number | 4 |
| DATATRANSFER_STATUS_FINISHED | number | 5 |
| DATATRANSFER_STATUS_ERROR | number | 6 |
| DATATRANSFER_STATUS_PAUSING | number | 7 |
| DATATRANSFER_STATUS_PAUSED | number | 8 |
| COSTLINE_TYPE_PLANNED | number | 0 |
| COSTLINE_TYPE_RESERVED | number | 1 |
| COSTLINE_TYPE_COMMITTED | number | 2 |
| COSTLINE_TYPE_EXPENSED | number | 3 |
| VALIDATIONLOG_ACTION_VALIDATED | number | 0 |
| VALIDATIONLOG_ACTION_REFUSED | number | 1 |
| VALIDATIONLOG_ACTION_CANCELED | number | 2 |
| MEASURE_TYPE_WITHOUTCONTROL | number | 0 |
| MEASURE_TYPE_WITHCONTROL | number | 1 |
| HYPOTHESIS_STATE_EDITION | number | 0 |
| HYPOTHESIS_STATE_WAITING | number | 1 |
| HYPOTHESIS_STATE_STARTED | number | 2 |
| HYPOTHESIS_STATE_FINISHED | number | 3 |
| HYPOTHESIS_STATE_ERROR | number | 4 |
| OPERATOR_TYPE_OP | number | 0 |
| OPERATOR_TYPE_GROUP | number | 1 |
| OPERATOR_TYPE_RIGHT | number | 2 |
| WORKFLOWTASK_STATUS_PENDING | number | 0 |
| WORKFLOWTASK_STATUS_COMPLETED | number | 1 |
| MOBILE_MSGTYPE_SMS | number | 0 |
| MOBILE_MSGTYPE_WAPPUSH | number | 1 |
| MOBILE_MSGTYPE_MMS | number | 2 |
| CATALOG_STATUS_EDITION | number | 0 |
| CATALOG_STATUS_VALIDATIONPENDING | number | 1 |
| CATALOG_STATUS_INPROCESS | number | 2 |
| CATALOG_STATUS_VALIDATED | number | 3 |
| CATALOG_STATUS_REFUSED | number | 4 |
| CATALOG_STATUS_PUBLISHED | number | 7 |
| CATALOG_STATUS_CANCELED | number | 8 |
| CATALOG_VALIDATIONMODE_MANUAL | number | 0 |
| CATALOG_VALIDATIONMODE_AUTO | number | 1 |
| CENTRALLOCAL_TYPE_LOCAL | number | 0 |
| CENTRALLOCAL_TYPE_MUTUALIZED | number | 1 |
| CENTRALLOCAL_MODE_CENTRALIZED | number | 0 |
| CENTRALLOCAL_MODE_LOCALIZEDOP | number | 1 |
| CENTRALLOCAL_MODE_LOCALIZEDWEB | number | 2 |
| CENTRALLOCAL_MODE_DISTRIBUTED | number | 3 |
| LOCALORDER_STATUS_PROOF | number | 0 |
| LOCALORDER_STATUS_RESERVED | number | 1 |
| LOCALORDER_STATUS_VALIDATED | number | 2 |
| LOCALORDER_STATUS_REFUSED | number | 6 |
| LOCALORDER_STATUS_AVAILABLE | number | 3 |
| LOCALORDER_STATUS_CANCELED | number | 4 |
| LOCALORDER_STATUS_ERROR | number | 5 |
| LOCALVALIDATIONLOG_STATUS_INWAITING | number | 0 |
| LOCALVALIDATIONLOG_STATUS_VALIDATED | number | 1 |
| LOCALVALIDATIONLOG_STATUS_REFUSED | number | 2 |
| LOCALDISTRIBUTION_VALIDATIONMODE_MANUAL | number | 0 |
| LOCALDISTRIBUTION_VALIDATIONMODE_AUTOMATIC | number | 1 |
| OPERATION_WEBAPPTYPE_NONE | number | 0 |
| OPERATION_WEBAPPTYPE_DEFAULT | number | 1 |
| OPERATION_WEBAPPTYPE_USER | number | 2 |
| OPERATION_WEBAPPTYPE_EXTERNAL | number | 3 |
| RESOURCE_TYPE_FILE | number | 0 |
| SIMULATION_STATUS_EDIT | number | 0 |
| SIMULATION_STATUS_PENDING | number | 1 |
| SIMULATION_STATUS_RUNNING | number | 2 |
| SIMULATION_STATUS_CANCELING | number | 3 |
| SIMULATION_STATUS_CANCELED | number | 4 |
| SIMULATION_STATUS_FINISHED | number | 5 |
| SIMULATION_STATUS_ERROR | number | 6 |
| SIMULATION_STATUS_PAUSEPENDING | number | 7 |
| SIMULATION_STATUS_PAUSE | number | 8 |
| HYPOTHESIS_STATUS_EDIT | number | 0 |
| HYPOTHESIS_STATUS_PENDING | number | 1 |
| HYPOTHESIS_STATUS_RUNNING | number | 2 |
| HYPOTHESIS_STATUS_CANCELING | number | 3 |
| HYPOTHESIS_STATUS_CANCELED | number | 4 |
| HYPOTHESIS_STATUS_FINISHED | number | 5 |
| HYPOTHESIS_STATUS_ERROR | number | 6 |
| HYPOTHESIS_STATUS_PAUSEPENDING | number | 7 |
| HYPOTHESIS_STATUS_PAUSE | number | 8 |
| HYPOTHESIS_TYPE_DELIVERY | number | 0 |
| HYPOTHESIS_TYPE_OFFER | number | 1 |
| HYPOTHESIS_TYPE_ALL | number | 127 |
| WEBAPP_STATE_EDITION | number | 0 |
| WEBAPP_STATE_TOPUBLISH | number | 5 |
| WEBAPP_STATE_PROD | number | 10 |
| REPORT_STATE_PROD | number | 10 |
| SANDBOXMODE_COMPLETE | number | 0 |
| SANDBOXMODE_SANDBOX | number | 1 |
| SANDBOXMODE_SIMULATION | number | 2 |
| SANDBOXMODE_ENFORCEMENT_COMPLETE | number | 1 |
| VALIDATION_NOTIF | number | 0 |
| PUBLICATION_NOTIF | number | 1 |
| OPERATION_NOTIF | number | 2 |
| CANCELLATION_NOTIF | number | 3 |
| PROPOSITION_STATUS_ACCEPTED | number | 3 |
| PROPOSITION_STATUS_CONTROL | number | 99 |
| VALIDATION_TYPE_DELAY | number | 0 |
| VALIDATION_TYPE_DATE | number | 1 |
| PROCESS_TYPE_CREATEOPERATION | number | 0 |
| PROCESS_TYPE_CREATEWORKFLOW | number | 1 |
| PROCESS_TYPE_CANCELOPERATION | number | 2 |
| GROUP_TYPE_NMS | number | 0 |
| GROUP_TYPE_SEG | number | 1 |
| GROUP_TYPE_FILE | number | 2 |
| GROUP_TYPE_TEMPLATE | number | 3 |
| GROUP_ORIGIN_NMS | number | 0 |
| GROUP_ORIGIN_SEG | number | 1 |
| GROUP_ORIGIN_FILE | number | 2 |
| GROUP_ORIGIN_IMPORTLEAD | number | 3 |
| OFFER_STATUS_EDITION | number | 0 |
| OFFER_STATUS_VALIDATIONPENDING | number | 1 |
| OFFER_STATUS_INPROCESS | number | 2 |
| OFFER_STATUS_VALIDATED | number | 3 |
| OFFER_STATUS_REFUSED | number | 4 |
| OFFER_STATUS_CANCELED | number | 5 |
| OFFER_STATUS_PUBLISHED | number | 6 |
| OFFER_STATUS_PRODUCTIONPENDING | number | 7 |
| OFFER_STATUS_CANCELPENDING | number | 8 |
| OFFERVIEW_STATE_EDITION | number | 0 |
| OFFERVIEW_STATE_VALIDATIONPENDING | number | 1 |
| OFFERVIEW_STATE_VALIDATED | number | 3 |
| OFFERVIEW_STATE_REFUSED | number | 4 |
| OFFERVIEW_STATE_CANCELED | number | 5 |
| OFFERVIEW_STATE_PUBLISHED | number | 6 |
| SERVICE_TYPE_EMAIL | number | 0 |
| SERVICE_TYPE_MOBILE | number | 1 |
| SERVICE_TYPE_FACEBOOK | number | 20 |
| SERVICE_TYPE_TWEETER | number | 25 |
| SERVICE_TYPE_APP | number | 40 |
| ACTION_TYPE_NONE | number | 0 |
| ACTION_TYPE_TOVALIDATE | number | 1 |
| ACTION_TYPE_REFUSED | number | 2 |
| ACTION_TYPE_SUBMIT | number | 3 |
| ACTION_TYPE_SUBSCRIBE | number | 4 |
| ACTION_TYPE_CONFIRM | number | 5 |
| ACTION_TYPE_EXTRACTION_APPROVAL | number | 6 |
| ACTION_TYPE_EXTRACTION_INWAITING | number | 7 |
| ACTION_TYPE_FCP_APPROVAL | number | 8 |
| ACTION_TYPE_TOEDIT | number | 9 |
| ACTION_TYPE_PREPARATION_INWAITING | number | 10 |
| ACTION_TYPE_EXPIRED | number | 11 |
| OUTGOINGLEAD_STAGE_UNQUALIFIED | string | unqualified |
| OUTGOINGLEAD_STAGE_MARKETINGQUALIFIED | string | marketingQualified |
| OUTGOINGLEAD_STAGE_SALESACCEPTED | string | salesAccepted |
| OUTGOINGLEAD_STAGE_ABANDONNED | string | abandonned |
| OUTGOINGLEAD_STAGE_REJECTED | string | rejected |
| OUTGOINGLEAD_STAGE_OPPORTUNITY | string | opportunity |
| OUTGOINGLEAD_STAGE_CLOSEDLOST | string | closedLost |
| OUTGOINGLEAD_STAGE_CLOSEDWON | string | closedWon |
| OPPORTUNITY_STATUS_INPROGRESS | string | inProgress |
| OPPORTUNITY_STATUS_CLOSEDWON | string | closedWon |
| OPPORTUNITY_STATUS_CLOSEDLOST | string | closedLost |
| CONTENT_EDITING_MODE_DEFAULT | number | 0 |
| CONTENT_EDITING_MODE_DCE | number | 1 |
| CONTENT_EDITING_MODE_AEM | number | 2 |
| deliveryActionStateType | function | function deliveryActionStateType(jsonParams) { "use strict"; var iActionType = ACTION_TYPE_NONE; if (jsonParams.deliveryState == DELIVERY_ |
| buildStateContentConfig | function | function buildStateContentConfig(jsonParams, mode) { "use strict"; var stringPointer; if (SERVER) { stringPointer = sg_nms_campaig |
| deliveryKPIConfig | function | function deliveryKPIConfig(delivery) { "use strict"; var stringPointer; if (SERVER) { stringPointer = sg_nms_campaign; } else |
| buildCommandBarConfig | function | function buildCommandBarConfig(jsonParams, onRefresh) { "use strict"; var stringPointer; if (SERVER) { stringPointer = sg_nms_camp |
| assetContentTypeImg | function | function assetContentTypeImg(iUserContentType, strContentType) { "use strict"; if (iUserContentType === 0) { return "nlui-img-contentT |
| deliveryLogofromMessageType | function | function deliveryLogofromMessageType(iMessageType) { "use strict"; var strLogo = ""; if (iMessageType == DELIVERY_MESSAGETYPE_EMAIL) { |
| validationTypeLabel | function | function validationTypeLabel(btType, sg) { "use strict"; if (btType == VALIDATION_TYPE_TARGET) { return sg.validationTypeTargetLabel() |
| catalogOperationTypeLabel | function | function catalogOperationTypeLabel(iType, iSharedMode, sg) { "use strict"; var stringPointer; if (typeof sg !== "undefined") { str |
| localOrderStatusLabel | function | function localOrderStatusLabel(iStatus, bNewInstance, sg) { "use strict"; var stringPointer; if (typeof sg !== "undefined") { stri |
| displayPlanning | function | function displayPlanning(strStart, strEnd, sg) { "use strict"; var stringPointer; if (typeof sg !== "undefined") { stringPointer = |
| displayDeliveryStateLabel | function | function displayDeliveryStateLabel(iStatus, iState, strState) { "use strict"; var stringPointer; if (SERVER) { stringPointer = sg_ |
| displayDeliveryStateImg | function | function displayDeliveryStateImg(iStatus, iState, strImg) { "use strict"; if (iState == DELIVERY_STATE_PREPAREFAILED && iStatus == DEL |
| displayFileSize | function | function displayFileSize(lSize, sg) { "use strict"; var stringPointer; if (typeof sg !== "undefined") { stringPointer = sg; } |
| displayDurationLabel | function | function displayDurationLabel(value, sg) { "use strict"; var stringPointer; if (typeof sg !== "undefined") { stringPointer = sg; |
| showHideBlock | function | function showHideBlock(blockId, disableEffect) { "use strict"; var objet = document.getElementById(blockId); var url = document.getElement |
| showHideFilterContainer | function | function showHideFilterContainer() { "use strict"; var iValue = 1; if (NL.XTK.parseInt(document.controller.getValue("/ctx/vars/filterVisib |
| resetFilters | function | function resetFilters(list) { "use strict"; if (list && document.controller) { document.controller.resetObservers(); list.load |
| getValue | function | function getValue(node, strXPath) { "use strict"; var value = getXPathValue(node, strXPath); if (typeof value === "undefined") { v |
| show_props | function | function show_props(obj, obj_nom) { "use strict"; var result = ""; for (var i in obj) { result += obj_nom + "" + i + " = " + obj[i |
| sg | object | [object StringGroup] |
| macIntegration | object | [object Object] |
| nms_group_createAudienceMapping | function | function nms_group_createAudienceMapping(segmentId, destinationId) { var mappingId = macIntegration.createSegmentMapping(segmentId, parseInt(desti |
| nms_group_deleteAudienceMapping | function | function nms_group_deleteAudienceMapping(segmentId, destinationId, mappingId) { if (!mappingId) { return false; } var success = ma |
| pushOperationLogInfo | function | function pushOperationLogInfo(iOperationId, strMessage) { "use strict"; logInfo(strMessage); pushOperationLog(iOperationId, OPERATION_LOG_ |
| pushOperationLog | function | function pushOperationLog(iOperationId, iType, strMessage) { "use strict"; xtk.session.Write(<operationLog _operation="insert" xtkschema="nms: |
| XtkOperationProcess | function | function XtkOperationProcess() { "use strict"; this.strUserJavascript = null; } |
| WakeupWorkflowTask | function | function WakeupWorkflowTask(iWorkflowId, iObjectId) { "use strict"; var count = 0; const MAX_RETRY = 3; do { var workflowTask |
| DOC_CONTEXT_CONSOLE | number | 0 |
| DOC_CONTEXT_WEB | number | 1 |
| DOC_CONTEXT_NOTIFICATION | number | 2 |
| htmlDocumentList | function | function htmlDocumentList(entity, context) { "use strict"; function htmFileUrl(fileEntity) { var strLabel = NL.XTK.toString(fileEntit |
| htmlDeliveryMirrorPage | function | function htmlDeliveryMirrorPage(delivery, context) { "use strict"; var sg = new StringGroup("nms:campaign"); if (String(delivery.mapping.s |
| CalculateExpectedValidationDate | function | function CalculateExpectedValidationDate(eParameter) { "use strict"; return NL.XTK.formatDateTime(nms.operation.CalculateExpectedValidationDat |
| CalculateNextReminderDate | function | function CalculateNextReminderDate(lastReminderDate, expectedDate, eParameter) { "use strict"; if (NL.XTK.toString(expectedDate) == "") { |
| getAdditionalAssignees | function | function getAdditionalAssignees(parameter) { "use strict"; var strAssignees = ""; for each (var assignee in parameter.assignee) { |
| execSQLLogInfo | function | function execSQLLogInfo(strSqlOrder, bTrace) { "use strict"; if (NL.XTK.parseBoolean(bTrace, false)) { logInfo("SQL: " + strSqlOrder); |
| completeQueryWithNbMessages | function | function completeQueryWithNbMessages(strSchema, iEntityId, query) { "use strict"; query.select.appendChild(<node expr="count([newsgroup/@id])" |
| convertBorderStyle | function | function convertBorderStyle(ndBorder, bOfficeMode) { function convertOneBorderStyle(ndOneBorderStyle) { var strCSSStyle = ""; var |
| getEnumValuesElt | function | function getEnumValuesElt(strSchema, strXPath) { var enumELt = <enum/>; function findNode(parent) { for each (var childNode in parent |
| nms_webApp_DeleteWebApp | function | function nms_webApp_DeleteWebApp(sWebAppId) { if (sWebAppId) { var collection = <dictionaryString-collection xtkschema="xtk:dictionaryStri |
| activity | xml | |
{% endraw %}

## Method
Create a Web app with 1 page containing the following HTML code:
```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Starter Template · Bootstrap</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
  </head>
  <body style="" class="">
<main class="container mt-5 pt-3">
<h1>JSSP ACC debug - Constants, objects and functions [Format HTML]</h1>
<table class="table table-sm table-hover">
<thead>
<tr><th>name</th><th>type</th><th>toString()</th></tr>
</thead>
<tbody><% for each(var x in Object.getOwnPropertyNames(this)){ %>
<tr>
<td><%= x %></td>
<td><%= typeof this[x] %></td>
<td><%= (''+this[x]).substr(0, 150) %></td>
</tr>
<% } %></tbody>
</table>
</main>
</body>
</html>
```

And for markdown output:
```html
<main class="container mt-5 pt-3">
  <h1>JSSP ACC debug - Constants, objects and functions [Format MD]</h1>
  |Header1|Header2|Header3|<br />
  |-|-|-|<br />
  <% for each(var x in Object.getOwnPropertyNames(this)){ %>
    | <%= x %> | <%= typeof this[x] %> | <%= (''+this[x]).substr(0, 150) %> |<br />
  <% } %> 
</main>
```

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script type="text/javascript">
  $(function(){
    $('main > article > .post-content > table').DataTable({
      pageLength: 50,
    });
  });
</script>
