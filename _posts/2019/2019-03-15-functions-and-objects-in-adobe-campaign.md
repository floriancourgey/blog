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

The following objects and functions can be called directly (which is an implicit use of `this.*`), or via `document.*`, `ROOT.*` and `self.*`. They are all a reference to the same object.

| Name | Type | toString() | tmp |
|-|-|-|-|
| Function | function | function Function() | |
| Object | function | function Object() | |
| eval | function | function eval() | |
| alert | function | function alert() | |
| logError | function | function logError() | |
| logWarning | function | function logWarning() | |
| logInfo | function | function logInfo() | |
| logVerbose | function | function logVerbose() | |
| formatDate | function | function formatDate() | |
| parseDate | function | function parseDate() | |
| parseTimeStamp | function | function parseTimeStamp() | |
| digestStrMd5 | function | function digestStrMd5() | |
| digestStrSha1 | function | function digestStrSha1() | |
| digestStrSha224 | function | function digestStrSha224() | |
| digestStrSha256 | function | function digestStrSha256() | |
| digestStrSha384 | function | function digestStrSha384() | |
| digestStrSha512 | function | function digestStrSha512() | |
| HMACStr | function | function HMACStr() | |
| escapeXmlStr | function | function escapeXmlStr() | |
| encodeHtml | function | function encodeHtml() | |
| htmlToText | function | function htmlToText() | |
| getUrl | function | function getUrl() | |
| patchAttribute | function | function patchAttribute() | |
| startBuffering | function | function startBuffering() | |
| stopBuffering | function | function stopBuffering() | |
| simpleRevCrypt | function | function simpleRevCrypt() | |
| reversibleCrypt | function | function reversibleCrypt() | |
| reversibleDecrypt | function | function reversibleDecrypt() | |
| unreversibleCrypt | function | function unreversibleCrypt() | |
| compareUnreversibleCrypt | function | function compareUnreversibleCrypt() | |
| escapeUrl | function | function escapeUrl() | |
| installDirectory | function | function installDirectory() | |
| encryptDES | function | function encryptDES() | |
| decryptDES | function | function decryptDES() | |
| DESencrypt | function | function DESencrypt() | |
| DESdecrypt | function | function DESdecrypt() | |
| obfuscate | function | function obfuscate() | |
| unobfuscate | function | function unobfuscate() | |
| expandVar | function | function expandVar() | |
| logon | function | function logon() | |
| logonEscalation | function | function logonEscalation() | |
| logonWithUser | function | function logonWithUser() | |
| logonWithToken | function | function logonWithToken() | |
| logonWithContext | function | function logonWithContext() | |
| getCurrentLocale | function | en-US | |
| getOperatorLocale | function | en-GB | |
| findClientIP | function | function findClientIP() | |
| checkHTTPAllowed | function | function checkHTTPAllowed() | |
| canShowErrors | function | function canShowErrors() | |
| useSecurityToken | function | function useSecurityToken() | |
| httpOnlySessionCookie | function | function httpOnlySessionCookie() | |
| getNewSecurityToken | function | function getNewSecurityToken() | |
| getBearerToken | function | function getBearerToken() | |
| IMSLoggedIn | function | function IMSLoggedIn() | |
| digitalContentToJST | function | function digitalContentToJST() | |
| loadFile | function | function loadFile() | |
| loadXmlFile | function | function loadXmlFile() | |
| cryptString | function | function cryptString() | |
| decryptString | function | function decryptString() | |
| decryptWithDESCompat | function | function decryptWithDESCompat() | |
| getEnv | function | function getEnv() | |
| writeraw | function | function writeraw() | |
| loadString | function | function loadString() | |
| write | function | function write() | |
| writeln | function | function writeln() | |
| getOption | function | function getOption() | |
| setOption | function | function setOption() | |
| sqlGetString | function | function sqlGetString() | |
| sqlGetStringOnDataSource | function | function sqlGetStringOnDataSource() | |
| sqlGetMemo | function | function sqlGetMemo() | |
| sqlGetMemoOnDataSource | function | function sqlGetMemoOnDataSource() | |
| sqlGetInt | function | function sqlGetInt() | |
| sqlGetIntOnDataSource | function | function sqlGetIntOnDataSource() | |
| sqlGetDouble | function | function sqlGetDouble() | |
| sqlGetDoubleOnDataSource | function | function sqlGetDoubleOnDataSource() | |
| sqlGetDate | function | function sqlGetDate() | |
| sqlGetDateOnDataSource | function | function sqlGetDateOnDataSource() | |
| sqlExec | function | function sqlExec() | |
| getCurrentDate | function | function getCurrentDate() | |
| sqlExecOnDataSource | function | function sqlExecOnDataSource() | |
| sqlExecScript | function | function sqlExecScript() | |
| sqlSelect | function | function sqlSelect() | |
| generateImgTag | function | function generateImgTag() | |
| getImageUrl | function | function getImageUrl() | |
| getNewIdRange | function | function getNewIdRange() | |
| dictionaryCheck | function | function dictionaryCheck() | |
| self | object | [object global] | |
| document | object | [object global] | |
| instanceName | string | my_instance1 | |
| databaseId | string | u9A9A999A999AA999 | |
| undefined | undefined | undefined | |
| Array | function | function Array() | |
| Boolean | function | function Boolean() | |
| Error | function | function Error() | |
| InternalError | function | function InternalError() | |
| EvalError | function | function EvalError() | |
| RangeError | function | function RangeError() | |
| ReferenceError | function | function ReferenceError() | |
| SyntaxError | function | function SyntaxError() | |
| TypeError | function | function TypeError() | |
| URIError | function | function URIError() | |
| Math | object | [object Math] | |
| isNaN | function | function isNaN() | |
| isFinite | function | function isFinite() | |
| parseFloat | function | function parseFloat() | |
| parseInt | function | function parseInt() | |
| Number | function | function Number() | |
| NaN | number | NaN | |
| Infinity | number | Infinity | |
| JSON | object | [object JSON] | |
| RegExp | function | function RegExp() | |
| escape | function | function escape() | |
| unescape | function | function unescape() | |
| uneval | function | function uneval() | |
| decodeURI | function | function decodeURI() | |
| encodeURI | function | function encodeURI() | |
| decodeURIComponent | function | function decodeURIComponent() | |
| encodeURIComponent | function | function encodeURIComponent() | |
| String | function | function String() | |
| Int8Array | function | function Int8Array() | |
| Uint8Array | function | function Uint8Array() | |
| Int16Array | function | function Int16Array() | |
| Uint16Array | function | function Uint16Array() | |
| Int32Array | function | function Int32Array() | |
| Uint32Array | function | function Uint32Array() | |
| Float32Array | function | function Float32Array() | |
| Float64Array | function | function Float64Array() | |
| Uint8ClampedArray | function | function Uint8ClampedArray() | |
| ArrayBuffer | function | function ArrayBuffer() | |
| Namespace | function | function Namespace() | |
| QName | function | function QName() | |
| isXMLName | function | function isXMLName() | |
| XML | function | function XML() | |
| XMLList | function | function XMLList() | |
| Iterator | function | function Iterator() | |
| StopIteration | object | [object StopIteration] | |
| Date | function | function Date() | |
| Proxy | object | [object Proxy] | |
| HttpSoapConnection | function | function HttpSoapConnection() | |
| SoapService | function | function SoapService() | |
| SoapRequest | object | [object SoapRequest] | |
| MemoryBuffer | function | function MemoryBuffer() | |
| StringGroup | function | function StringGroup() | |
| UserContext | object | [object UserContext] | |
| HttpClientRequest | function | function HttpClientRequest() | |
| HttpClientResponse | object | [object HttpClientResponse] | |
| HttpResponseHeader | object | [object HttpResponseHeader] | |
| HttpHeader | object | [object HttpHeader] | |
| EntityCollection | object | [object EntityCollection] | |
| ScriptArrayIterator | object | [object ScriptArrayIterator] | |
| NLNamespace | object | [object NLNamespace] | |
| NLSchema | object | [object NLSchema] | |
| adb | object | [object NLNamespace] | |
| ncm | object | [object NLNamespace] | |
| nl | object | [object NLNamespace] | |
| nms | object | [object NLNamespace] | |
| xtk | object | [object NLNamespace] | |
| temp | object | [object NLNamespace] | |
| tst | object | [object NLNamespace] | |
| NLWS | object | [object NLNamespace] | |
| encryptedTrackingPasswordChecker | function | function encryptedTrackingPasswordChecker() | |
| loadLibrary | function | function loadLibrary() | |
| loadLibraryDebug | function | function loadLibraryDebug() | |
| applyXsl | function | function applyXsl() | |
| applyXslFromFile | function | function applyXslFromFile() | |
| applyXslFromStyleSheet | function | function applyXslFromStyleSheet() | |
| saveFile | function | function saveFile() | |
| saveXmlFile | function | function saveXmlFile() | |
| saveFileFromBase64 | function | function saveFileFromBase64() | |
| saveString | function | function saveString() | |
| saveXmlString | function | function saveXmlString() | |
| saveBase64String | function | function saveBase64String() | |
| fileRename | function | function fileRename() | |
| fileGetTempName | function | function fileGetTempName() | |
| fileIsRelative | function | function fileIsRelative() | |
| fileSize | function | function fileSize() | |
| decrypt | function | function decrypt() | |
| crypt | function | function crypt() | |
| applyXmlDiff | function | function applyXmlDiff() | |
| convertJst | function | function convertJst() | |
| scanCustomFields | function | function scanCustomFields() | |
| scanCustomFieldsEx | function | function scanCustomFieldsEx() | |
| scanURLs | function | function scanURLs() | |
| setEnv | function | function setEnv() | |
| sleep | function | function sleep() | |
| visitorCookieName | function | function visitorCookieName() | |
| genNewVisitorId | function | function genNewVisitorId() | |
| checkRight | function | function checkRight() | |
| getUUID | function | function getUUID() | |
| execCommand | function | function execCommand() | |
| setMaxProgress | function | function setMaxProgress() | |
| setProgress | function | function setProgress() | |
| startProgressTransaction | function | function startProgressTransaction() | |
| endProgressTransaction | function | function endProgressTransaction() | |
| clearProgressTransactions | function | function clearProgressTransactions() | |
| logProperty | function | function logProperty() | |
| executeQuery | function | function executeQuery() | |
| executeQueryEx | function | function executeQueryEx() | |
| getChartData | function | function getChartData() | |
| digestChartData | function | function digestChartData() | |
| expandAbstractFormQuery | function | function expandAbstractFormQuery() | |
| getTableData | function | function getTableData() | |
| generateTable | function | function generateTable() | |
| analyzeExpr | function | function analyzeExpr() | |
| analyzeExprEx | function | function analyzeExprEx() | |
| parseExprToAST | function | function parseExprToAST() | |
| parseExprToASTEx | function | function parseExprToASTEx() | |
| expandJst | function | function expandJst() | |
| releaseContext | function | function releaseContext() | |
| setContext | function | function setContext() | |
| registerQuerySchema | function | function registerQuerySchema() | |
| registerQuerySchemaEx | function | function registerQuerySchemaEx() | |
| buildSqlTable | function | function buildSqlTable() | |
| setSchemaSqlTable | function | function setSchemaSqlTable() | |
| buildColumnList | function | function buildColumnList() | |
| registerSchema | function | function registerSchema() | |
| getSchema | function | function getSchema() | |
| interactionProposeOffers | function | function interactionProposeOffers() | |
| interactionInsertProp | function | function interactionInsertProp() | |
| interactionUpdateProp | function | function interactionUpdateProp() | |
| interactionInsertVisitor | function | function interactionInsertVisitor() | |
| interactionLogError | function | function interactionLogError() | |
| File | function | function File() | |
| FileIterator | function | [object FileIterator] | |
| ZipFile | function | function ZipFile() | |
| DOMNode | object | [object DOMNode] | |
| DOMDocument | function | function DOMDocument() | |
| DOMElement | object | [object DOMElement] | |
| DOMAttr | object | [object DOMAttr] | |
| DOMCharacterData | object | [object DOMCharacterData] | |
| NLProxy | function | function NLProxy() | |
| DBEngine | object | [object DBEngine] | |
| DBStatement | object | [object DBStatement] | |
| DBStatementIterator | function | [object DBStatementIterator] | |
| FTP | function | function FTP() | |
| Application | object | [object Application] | |
| CurrentLogin | object | [object CurrentLogin] | |
| EnumValue | object | [object EnumValue] | |
| Enum | object | [object Enum] | |
| SchemaKey | object | [object SchemaKey] | |
| NodeDef | object | [object NodeDef] | |
| Schema | function | function Schema() | |
| BroadLogNormalizer | function | function BroadLogNormalizer() | |
| instanceVarDir | string | /usr/local/neolane/nl6/var/my_instance1 | |
| instanceConfDir | string | /usr/local/neolane/nl6/conf/ | |
| application | object | [object Application] | |
| testEmail | function | function testEmail() | |
| testNLStatBasic | function | function testNLStatBasic() | |
| testNLStatSync | function | function testNLStatSync() | |
| testParseTimeStamp | function | function testParseTimeStamp() | |
| testRunWorkflow | function | function testRunWorkflow() | |
| testMerge | function | function testMerge() | |
| testFindNode | function | function testFindNode() | |
| testXmlFindAndReleaseNode | function | function testXmlFindAndReleaseNode() | |
| testJSONParse | function | function testJSONParse() | |
| testAESEncryptXml | function | function testAESEncryptXml() | |
| testAESDecryptXml | function | function testAESDecryptXml() | |
| testAESEncryptString | function | function testAESEncryptString() | |
| testAESDecryptString | function | function testAESDecryptString() | |
| testMidSourcingFilter | function | function testMidSourcingFilter() | |
| testMidSourcingFilterWithConfiguration | function | function testMidSourcingFilterWithConfiguration() | |
| testMimeEncode | function | function testMimeEncode() | |
| usePKCS5ToHashPassword | function | function usePKCS5ToHashPassword() | |
| checkPassword | function | function checkPassword() | |
| testSplitString | function | function testSplitString() | |
| generateTrackingTag | function | function generateTrackingTag() | |
| HttpServletRequest | object | [object HttpServletRequest] | |
| HttpServletResponse | object | [object HttpServletResponse] | |
| RequestParameters | object | [object RequestParameters] | |
| Cookie | function | function Cookie() | |
| Cookies | object | [object Cookies] | |
| CaptchaValidate | function | function CaptchaValidate() | |
| CaptchaIDGen | function | function CaptchaIDGen() | |
| escapeXmlString | function | function escapeXmlString() | |
| sg_xtk_dashboard | object | [object StringGroup] | |
| NL | object | [object Object] | |
| ROOT | object | [object global] | |
| SERVER | boolean | true | |
| CLIENT | boolean | false | |
| DEBUG | boolean | false | |
| LOGS | boolean | true | |
| console | object | [object Object] | |
| formatLanguage | string | en-us | |
| defaultOverviewListLineRenderer | function | function defaultOverviewListLineRenderer(rowCustomization, noDelete) | |
| defaultGridListLineRenderer | function | function defaultGridListLineRenderer(rowCustomization) | |
| defaultLinkListLineRenderer | function | function defaultLinkListLineRenderer(rowCustomization) | |
| defaultBlockViewListLineRenderer | function | function defaultBlockViewListLineRenderer(item, index, $container) | |
| defaultLinkEditLineRenderer | function | function defaultLinkEditLineRenderer(rowCustomization) | |
| initDashboard | function | function initDashboard(menuEntries, isInConsole) | |
| dashboardNavigationBlockCreation | function | function dashboardNavigationBlockCreation(content, overflowContent, options) | |
| getReportViewConf | function | function getReportViewConf() | |
| getSwitchableViewConf | function | function getSwitchableViewConf(viewSettings) | |
| getGeneralViewConf | function | function getGeneralViewConf(viewName, viewImage, viewParams) | |
| getUsableVerticalSpace | function | function getUsableVerticalSpace(epsilon) | |
| \_collectViews | function | function \_collectViews(viewList, viewsData, blockName, dashboardContext, filterView, bIsOtherView, defaultViewsLabel) | |
| \_genNavtreeViewBlock | function | function \_genNavtreeViewBlock(universe, blockName, mainContentConfVarName, mainContentWidgetVarName, overflowContentConfVarName, overflowContentWidget | |
| \_getAvailableActions | function | function \_getAvailableActions(actions, dashboardContext, defaultViewsLabel) | |
| XtkIEEvent | function | function XtkIEEvent() | |
| XtkGeckoEvent | function | function XtkGeckoEvent(event) | |
| NewEvent | function | function NewEvent(evt) | |
| findXtkObject | function | function findXtkObject(htmlObject) | |
| g_xtkContext | object | [object Object] | |
| openView | function | function openView(url) | |
| addSecurityToken | function | function addSecurityToken(strUrl, strSecurityToken, bAlways) | |
| isNeolaneConsole | function | function isNeolaneConsole() | |
| REPORT_COLORS | object | #3B87A2,#FF8012,#8CA23B,#A23B5E,#004A62,#FFCCA0,#C75400,#CAD4A5,#A5C8D4,#6D0026,#D4A5B4,#4F6400 | |
| htmlSanitizer | function | function () | |
| deliveryActionStateType | function | function deliveryActionStateType(jsonParams) | |
| buildStateContentConfig | function | function buildStateContentConfig(jsonParams, mode) | |
| deliveryKPIConfig | function | function deliveryKPIConfig(delivery) | |
| buildCommandBarConfig | function | function buildCommandBarConfig(jsonParams, onRefresh) | |
| assetContentTypeImg | function | function assetContentTypeImg(iUserContentType, strContentType) | |
| deliveryLogofromMessageType | function | function deliveryLogofromMessageType(iMessageType) | |
| validationTypeLabel | function | function validationTypeLabel(btType, sg) | |
| catalogOperationTypeLabel | function | function catalogOperationTypeLabel(iType, iSharedMode, sg) | |
| localOrderStatusLabel | function | function localOrderStatusLabel(iStatus, bNewInstance, sg) | |
| displayPlanning | function | function displayPlanning(strStart, strEnd, sg) | |
| displayDeliveryStateLabel | function | function displayDeliveryStateLabel(iStatus, iState, strState) | |
| displayDeliveryStateImg | function | function displayDeliveryStateImg(iStatus, iState, strImg) | |
| displayFileSize | function | function displayFileSize(lSize, sg) | |
| displayDurationLabel | function | function displayDurationLabel(value, sg) | |
| showHideBlock | function | function showHideBlock(blockId, disableEffect) | |
| showHideFilterContainer | function | function showHideFilterContainer() | |
| resetFilters | function | function resetFilters(list) | |
| getValue | function | function getValue(node, strXPath) | |
| show_props | function | function show_props(obj, obj_nom) | |
| sg | object | [object StringGroup] | |
| macIntegration | object | [object Object] | |
| nms_group_createAudienceMapping | function | function nms_group_createAudienceMapping(segmentId, destinationId)  | |
| nms_group_deleteAudienceMapping | function | function nms_group_deleteAudienceMapping(segmentId, destinationId, mappingId) | |
| pushOperationLogInfo | function | function pushOperationLogInfo(iOperationId, strMessage) | |
| pushOperationLog | function | function pushOperationLog(iOperationId, iType, strMessage) | |
| XtkOperationProcess | function | function XtkOperationProcess() | |
| WakeupWorkflowTask | function | function WakeupWorkflowTask(iWorkflowId, iObjectId) | |
| DOC_CONTEXT_CONSOLE | number | 0 | |
| DOC_CONTEXT_WEB | number | 1 | |
| DOC_CONTEXT_NOTIFICATION | number | 2 | |
| htmlDocumentList | function | function htmlDocumentList(entity, context) | |
| htmlDeliveryMirrorPage | function | function htmlDeliveryMirrorPage(delivery, context) | |
| CalculateExpectedValidationDate | function | function CalculateExpectedValidationDate(eParameter) | |
| CalculateNextReminderDate | function | function CalculateNextReminderDate(lastReminderDate, expectedDate, eParameter) | |
| getAdditionalAssignees | function | function getAdditionalAssignees(parameter) | |
| execSQLLogInfo | function | function execSQLLogInfo(strSqlOrder, bTrace) | |
| completeQueryWithNbMessages | function | function completeQueryWithNbMessages(strSchema, iEntityId, query) | |
| convertBorderStyle | function | function convertBorderStyle(ndBorder, bOfficeMode) | |
| getEnumValuesElt | function | function getEnumValuesElt(strSchema, strXPath) | |
| nms_webApp_DeleteWebApp | function | function nms_webApp_DeleteWebApp(sWebAppId) | |
| activity | xml | | |
| NL.ns | function | function (name) | |
| NL.side | function | function (expectedSide) | |
| NL.isDevDebug | function | function () | |
| NL.isEmpty | function | function (obj) | |
| NL.nvl | function | function () | |
| NL.coalesce | function | function () | |
| NL.isNundef | function | function (obj) | |
| NL.isDate | function | function (obj) | |
| NL.isBoolean | function | function (obj) | |
| NL.isString | function | function (obj) | |
| NL.isNumber | function | function (obj) | |
| NL.isFinite | function | function (obj) | |
| NL.isNaN | function | function (obj) | |
| NL.isFunction | function | function (obj) | |
| NL.isXML | function | function (obj) | |
| NL.isArray | function | function (obj) | |
| NL.isObject | function | function (obj) | |
| NL.isPlainObject | function | function (obj) | |
| NL.is | function | function (obj, type) | |
| NL.Utils | object | [object Object] | |
| NL.OO | object | [object Object] | |
| NL.toDebugString | function | function (object) | |
| NL.log | object | [object Object] | |
| NL.\_hookConsole | function | function (con) | |
| NL.\_hookLogger | function | function (logger) | |
| NL.route | function | function (path, type) | |
| NL.assert | function | function (value, message) | |
| NL.session | object | [object Object] | |
| NL.server | function | function () | |
| NL.require | function | function (name) | |
| NL.\_initClientSupport | function | function () | |
| NL.init | function | function () | |
| NL.\_loaded | boolean | true | |
| NL.DepMan | object | [object Object] | |
| NL.XML | function | function XML() { [native code] } | |
| NL.XTK | undefined | undefined | |
| NL.String | function | function String() { [native code] } | |
| NL.Number | function | function Number() { [native code] } | |
| NL.Locale | undefined | undefined | |
| NL.Timezone | undefined | undefined | |
| NL.Date | function | function Date() { [native code] } | |
| NL.DatePartial | undefined | undefined | |
| NL.NLSON | undefined | undefined | |
| NL.URL | undefined | undefined | |
| NL.client | undefined | undefined | |
| NL.JS | undefined | undefined | |
| NL.SQL | undefined | undefined | |
| NL.HTML | undefined | undefined | |
| NL.View | undefined | undefined | |
| NL.Cookie | function | function Cookie() { [native code] } | |
| NL.JSSPContext | undefined | undefined | |
| NL.API | undefined | undefined | |
| NL.XtkContext | undefined | undefined | |
| NL.XtkTimer | undefined | undefined | |
| NL.QueryDef | undefined | undefined | |
| NL.Widgets | undefined | undefined | |
| NL.Dashboard | undefined | undefined | |
| NL.DefaultListConf | undefined | undefined | |
| NL.WebForm | undefined | undefined | |
| NL.DataPolicy | undefined | undefined | |
| application.buildNumber | number | 8999 | |
| application.buildVersion | string | 9.9 | |
| application.instanceName | string | instance_mkt_stage1 | |
| application.instanceVarDir | string | /usr/local/neolane/nl6/var/instance_mkt_stage1 | |
| application.instanceConfDir | string | /usr/local/neolane/nl6/conf/ | |
| application.instanceUploadDir | string | /usr/local/neolane/nl6//var/instance_mkt_stage1/upload/ | |
| application.operator | object | [object CurrentLogin] | |
| application.arg | string | | |
| application.lang | string | eng | |
| application.locale | string | en-US | |
| application.isTrace | boolean | false | |
| application.isOOOInstalled | boolean | true | |
| application.hostName | string | instance-mkt-stage1-2 | |
| console.log | function | function (msg) { logWarning("!console.log: "+msg); } | |
| console.error | function | function (msg) { logWarning("!console.error: "+msg); } | |
| console.warn | function | function (msg) { logWarning("!console.warn: "+msg); } | |
| application.operator.login | string | my_login | |
| application.operator.id | number | 99999 | |
| application.operator.computeString | string | First Last (login_id) | |
| application.operator.groups | object | 99999999,9999,99999999 | |
| application.operator.rights | object | admin | |
| application.operator.timezone | string | America/New_York | |
| application.operator.locale | string | en-US | |
| application.operator.home | string | | |
| Format.REGION_SETTINGS['en-us'] | json | | |
| Format.REGION_SETTINGS['en-us'].digitGroupingSymbol | string | ',' | |
| Format.REGION_SETTINGS['en-us'].decimalSymbol | string | "." | |
| Format.REGION_SETTINGS['en-us'].shortDate | string | "%2M/%2D/%4Y" | |
| Format.REGION_SETTINGS['en-us'].longDate | string | "%A, %D %B, %4Y" | |
| Format.REGION_SETTINGS['en-us'].time | string | "%I:%2N:%2S %P" | |
| Format.REGION_SETTINGS['en-us'].shortDateTime | string | "%2M/%2D/%4Y %I:%2N:%2S %P" | |
| Format.REGION_SETTINGS['en-us'].AmPm | string | ["AM", "PM"] | |
| Format.REGION_SETTINGS['en-us'].shortQuarter | string | "Q%C %4Y" | |
| Format.REGION_SETTINGS['en-us'].longQuarter | string |  "%Q %4Y" | |
| Format.REGION_SETTINGS['en-us'].shortMonth | string | "%2M/%4Y" | |
| Format.REGION_SETTINGS['en-us'].longMonth | string | "%B %4Y" | |
| Format.REGION_SETTINGS['en-us'].shortWeek | string | "%4V-W%2W" | |
| Format.REGION_SETTINGS['en-us'].longWeek | string | "%4V - Week %2W" | |
| Format.REGION_SETTINGS['en-us'].shortHour | string | "%2Hh" | |
| Format.REGION_SETTINGS['en-us'].longHour | string | "%2Hh" | |
| Format.REGION_SETTINGS['en-us'].daysName | string | ["Sunday", "Monday"...] | |
| Format.REGION_SETTINGS['en-us'].shortDaysName | string |  ["Sun", "Mon"...] | |
| Format.REGION_SETTINGS['en-us'].monthsName | string |  ["January", "February"...] | |
| Format.REGION_SETTINGS['en-us'].quartersName | string |  ["1st quarter", "2nd quarter", "3rd quarter", "4th quarter"] | |
| Format.REGION_SETTINGS['en-us'].timeSpanUnits | string |  {seconds : 's', minutes : 'mn', hours : 'h', days : 'd', months : 'm', years : 'y'} | |
| Format.REGION_SETTINGS['en-us'].percentSeparator" : "" | |
| Format.REGION_SETTINGS['en-us'].currencySymbol": "$" | |
| NL.Locale.getFormat | function | function (name, options).getFor | |
| NL.Locale.defaultLanguage | string | en-us | |
| NL.Locale.getLocale | function | function (language) || NL | |
| NL.Locale.getValidLanguageFromHttpHeader | function | function (header, validityCheck) | |
| NL.Locale.parseBoolean | function | function (value, defaultReturn) | |
| NL.Locale.formatBoolean | function | function (value, format, defaultReturn) | |
| NL.Locale.parseString | function | function (value, defaultReturn) | |
| NL.Locale.parseNumber | function | function (value, defaultReturn) | |
| NL.Locale.parseInt | function | function (value, defaultReturn) | |
| NL.Locale.formatNumber | function | function (value, format, defaultReturn) | |
| NL.Locale.formatInt | function | function (value, format, defaultReturn) | |
| NL.Locale.formatPercent | function | function (value, decimalPlaces, defaultReturn) | |
| NL.Locale.formatDataSize | function | function (value, format, defaultReturn) | |
| NL.Locale.formatWithUnit | function | function (value, significantFigures, unit, defaultReturn) | |
| NL.Locale.getMonthName | function | function (arg) | |
| NL.Locale.\_splitFormat | function | function (format) | |
| NL.Locale.parseDateTime | function | function (value, format, defaultReturn) | |
| NL.Locale.parseDateOnly | function | function (value, format, defaultReturn) | |
| NL.Locale.parseTime | function | function (value, format, defaultReturn) | |
| NL.Locale.formatDateTime | function | function (value, format, defaultReturn) | |
| NL.Locale.formatDateOnly | function | function (value, format, defaultReturn) | |
| NL.Locale.formatTime | function | function (value, format, defaultReturn) | |
| NL.Locale.formatDatePartial | function | function (datePartial, interval, format) | |
| NL.Locale.formatTimeSpan | function | function (value, format, defaultReturn) | |
| getOption('XtkScript_batch') | string | cmd.exe /c $(filename.bat) |  |
| getOption('XtkScript_perl') | string | perl $(filename.pl) |  |
| getOption('XtkScript_python') | string | python $(filename.py) |  |
| getOption('XtkScript_ruby') | string | ruby $(filename.rb) |  |
| getOption('XtkScript_sh') | string | bash $(filename) |  |
| getOption('XtkScript_vbs') | string | cscript /nologo $(filename.vbs) |  |
| getOption('XtkFileRes_Public_URL') | string | https://instance-mkt-stage1.neolane.net/res/ |  |
| getOption('XtkEmail_Characters') | string | 0123456789_.-'+abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZµÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝßàáâãäåæçèéêëìíîïñòóôõöùúûüýÿ |  |
| getOption('NmsTracking_Instance') | string | instance_mkt_stage1 0 |  |
| getOption('NmsServer_MirrorPageUrl') | string | http://instance-mkt-stage1.neolane.net |  |
| getOption('NmsServer_URL') | string | https://instance-mkt-stage1.neolane.net |  |
| getOption('NmsServer_IntranetURL') | string | https://instance-mkt-stage1.neolane.net |  |
| getOption('NmsServer_LastPostUpgrade') | string | 8899 |  |
| getOption('NmsServer_LogoPath') | string | /nl/img |  |
| getOption('NmsDelivery_ImagePublishing') | string | tracking |  |
| getOption('NmsDelivery_ImageSubDirectory') | string | images |  |
| getOption('Nms_DefaultRcpSchema') | string | nms:recipient |  |
| getOption('NmsBroadcast_DefaultProvider') | string | defaultEmailBulk |  |
| getOption('NmsBilling_MainActionThreshold') | Integer | 100 |  |
{: #with-an-id}

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
<% var objectToDebug = this; var prefix = ""; %>
<main class="container mt-5 pt-3">
  <h1>JSSP ACC debug - Constants, objects and functions [Format MD]</h1>
  |Header1|Header2|Header3|<br />
  |-|-|-|<br />
  <% for each(var x in Object.getOwnPropertyNames(objectToDebug)){ %>
    | <%= prefix + x %> | <%= typeof objectToDebug[x] %> | <%= (''+objectToDebug[x]).substr(0, 150) %> |<br />
  <% } %> 
</main>
```

## Constants

| Name | Type | toString() | tmp |
|-|-|-|-|
| WORKFLOW_STATE_EDITION | number | 0 | |
| WORKFLOW_STATE_RUNNING | number | 2 | |
| WORKFLOW_STATE_STARTED | number | 11 | |
| WORKFLOW_STATE_TESTING | number | 9 | |
| WORKFLOW_STATE_STARTING | number | 10 | |
| WORKFLOW_STATE_PAUSING | number | 12 | |
| WORKFLOW_STATE_PAUSED | number | 13 | |
| WORKFLOW_STATE_RESUMING | number | 14 | |
| WORKFLOW_STATE_STOPPING | number | 15 | |
| WORKFLOW_STATE_STOPPING2 | number | 16 | |
| WORKFLOW_STATE_RESTARTING | number | 17 | |
| WORKFLOW_STATE_RESTARTING2 | number | 18 | |
| WORKFLOW_STATE_STOPPED | number | 20 | |
| WORKFLOW_STATE_FINISHED | number | 20 | |
| WORKFLOW_STARTSTATE_UNDEFINED | number | 0 | |
| WORKFLOW_STARTSTATE_STARTING | number | 1 | |
| OPERATION_STATUS_ALL | number | -1 | |
| OPERATION_STATUS_EDITION | number | 0 | |
| OPERATION_STATUS_STARTED | number | 1 | |
| OPERATION_STATUS_FINISHED | number | 2 | |
| OPERATION_STATUS_CANCELING | number | 3 | |
| OPERATION_STATUS_CANCELED | number | 4 | |
| OPERATION_CANCELSTATE_UNDEFINED | number | 0 | |
| OPERATION_CANCELSTATE_CANCELING | number | 3 | |
| OPERATION_CANCELSTATE_CANCELED | number | 4 | |
| OPERATION_BUDGETSTATUS_EDITION | number | 0 | |
| OPERATION_BUDGETSTATUS_DEFINED | number | 1 | |
| OPERATION_BUDGETSTATUS_FINISHED | number | 2 | |
| OPERATION_LOG_TYPE_ERROR | number | 0 | |
| OPERATION_LOG_TYPE_WARNING | number | 1 | |
| OPERATION_LOG_TYPE_INFO | number | 2 | |
| OPERATION_LOG_TYPE_STATUS | number | 3 | |
| OPERATION_LOG_TYPE_VERBOSE | number | 4 | |
| OPERATION_TYPE_UNIQUE | number | 0 | |
| OPERATION_TYPE_RECURRENT | number | 1 | |
| OPERATION_TYPE_PERIODIC | number | 2 | |
| TASK_STATUS_EDITION | number | 0 | |
| TASK_STATUS_FORECASTED | number | 1 | |
| TASK_STATUS_STARTED | number | 2 | |
| TASK_STATUS_FINISHED | number | 3 | |
| TASK_STATUS_CANCELED | number | 4 | |
| TASK_STATUS_PENDING | number | 5 | |
| TASK_STATUS_VALIDATED | number | 6 | |
| TASK_STATUS_REFUSED | number | 7 | |
| TASK_PRIORITY_NORMAL | number | 1 | |
| TASK_TYPE_TASK | number | 0 | |
| TASK_TYPE_MILESTONE | number | 1 | |
| TASK_TYPE_GROUPING | number | 2 | |
| TASK_TYPE_NOTIFICATION | number | 3 | |
| TASK_TYPE_ASSET | number | 4 | |
| TASK_VALIDATIONTYPE_TARGET | number | 0 | |
| TASK_VALIDATIONTYPE_CONTENT | number | 1 | |
| TASK_VALIDATIONTYPE_BUDGET | number | 2 | |
| TASK_VALIDATIONTYPE_EXTRACTION | number | 3 | |
| TASK_VALIDATIONTYPE_FCP | number | 4 | |
| TASK_VALIDATIONTYPE_SANDBOX | number | 5 | |
| TASK_VALIDATIONTYPE_AVAILABLE | number | 6 | |
| TASK_VALIDATIONTYPE_EXTERNAL | number | 7 | |
| TASK_VALIDATIONSTATE_UNDEFINED | number | 0 | |
| TASK_VALIDATIONSTATE_VALIDATED | number | 1 | |
| TASK_VALIDATIONSTATE_REFUSED | number | 2 | |
| TASK_NTF_INITIAL | number | 0 | |
| TASK_NTF_TASK | number | 1 | |
| TASK_NTF_FINISHED | number | 2 | |
| TASK_NTF_CANCELED | number | 3 | |
| TASK_NTF_RES_FINISHED | number | 4 | |
| TASK_NTF_RES_CANCELED | number | 5 | |
| TASK_NTF_VALIDATED | number | 6 | |
| TASK_NTF_REFUSED | number | 7 | |
| TASK_NTF_ALERT | number | 8 | |
| TASK_FILTER_ALL | number | 50 | |
| TASK_FILTER_LATE | number | 51 | |
| DELIVERY_FILTER_ALL | number | 0 | |
| DELIVERY_FILTER_EDITION | number | 1 | |
| DELIVERY_FILTER_TOVALIDATE | number | 2 | |
| DELIVERY_FILTER_STARTED | number | 3 | |
| DELIVERY_FILTER_FINISHED | number | 4 | |
| DELIVERY_FILTER_FAILED | number | 5 | |
| DELIVERY_FILTER_CANCELED | number | 6 | |
| DELIVERY_STATE_EDITION | number | 0 | |
| DELIVERY_STATE_TARGETPENDING | number | 11 | |
| DELIVERY_STATE_TARGETSELECTION | number | 12 | |
| DELIVERY_STATE_TARGETARBITRATION | number | 13 | |
| DELIVERY_STATE_TARGETREADY | number | 15 | |
| DELIVERY_STATE_MSGPREPENDING | number | 21 | |
| DELIVERY_STATE_PREPARATION | number | 22 | |
| DELIVERY_STATE_MESSAGEFINISHED | number | 25 | |
| DELIVERY_STATE_PREPAREFAILED | number | 37 | |
| DELIVERY_STATE_READY | number | 45 | |
| DELIVERY_STATE_DELAYED | number | 51 | |
| DELIVERY_STATE_STARTED | number | 55 | |
| DELIVERY_STATE_RETRYPENDING | number | 61 | |
| DELIVERY_STATE_RETRY | number | 62 | |
| DELIVERY_STATE_CANCELPENDING | number | 81 | |
| DELIVERY_STATE_CANCEL | number | 85 | |
| DELIVERY_STATE_PAUSEPENDING | number | 71 | |
| DELIVERY_STATE_PAUSE | number | 75 | |
| DELIVERY_STATE_FINISHED | number | 95 | |
| DELIVERY_STATE_DELETED | number | 100 | |
| DELIVERY_STATUS_CANCELED | number | 4 | |
| DELIVERY_DELETE_STATUS_DELETED | number | 2 | |
| DELIVERY_MESSAGETYPE_EMAIL | number | 0 | |
| DELIVERY_MESSAGETYPE_SMS | number | 1 | |
| DELIVERY_MESSAGETYPE_PHONE | number | 2 | |
| DELIVERY_MESSAGETYPE_PAPER | number | 3 | |
| DELIVERY_MESSAGETYPE_FAX | number | 4 | |
| DELIVERY_MESSAGETYPE_AGENCY | number | 5 | |
| DELIVERY_MESSAGETYPE_FACEBOOK | number | 20 | |
| DELIVERY_MESSAGETYPE_TWITTER | number | 25 | |
| DELIVERY_MESSAGETYPE_MOBILEAPP | number | 40 | |
| DELIVERY_MESSAGETYPE_IOS | number | 41 | |
| DELIVERY_MESSAGETYPE_ANDROID | number | 42 | |
| DELIVERY_MESSAGETYPE_OTHER | number | 120 | |
| DELIVERY_PUBLICATION_STATUS_NOTAPPLICABLE | number | 0 | |
| DELIVERY_PUBLICATION_STATUS_EDITION | number | 1 | |
| DELIVERY_PUBLICATION_STATUS_DEPLOYED | number | 2 | |
| DELIVERY_PUBLICATION_STATUS_FAILED | number | 3 | |
| DELIVERY_PUBLICATION_STATUS_PRODUCTION | number | 100 | |
| MESSAGE_TYPE_TASK | number | 9 | |
| DELIVERY_STATUS_IGNORED | number | 0 | |
| DELIVERY_STATUS_SENT | number | 1 | |
| DELIVERY_STATUS_TOSENT | number | 6 | |
| DELIVERY_MODE_EXTERNAL | number | 0 | |
| DELIVERY_MODE_BULK | number | 1 | |
| DELIVERY_MODE_DESCRIPTIVE | number | 2 | |
| DELIVERY_MODE_MIDSOURCING | number | 4 | |
| DELIVERY_KPI_ERROR_THRESHOLD | number | 85 | |
| DELIVERY_KPI_WARNING_THRESHOLD | number | 95 | |
| FAILURE_RAISON_CONTROL | number | 127 | |
| MESSAGE_TYPE_ALL | number | 127 | |
| VALIDATION_MODE_AUTO | number | 0 | |
| VALIDATION_MODE_MANUAL | number | 1 | |
| DEFAULT_MAX_RUNNINGS | number | 10 | |
| TIME_RANGE_DAY | number | 0 | |
| TIME_RANGE_FORECASTED | number | 1 | |
| STOCKLINE_TYPE_REAL | number | 0 | |
| STOCKLINE_TYPE_ORDER | number | 1 | |
| STOCKLINE_TYPE_CONSUME | number | 2 | |
| CONTENT_STATUS_EDITION | number | 0 | |
| CONTENT_STATUS_INWAITING | number | 1 | |
| CONTENT_STATUS_VALIDATED | number | 2 | |
| CONTENT_STATUS_REFUSED | number | 3 | |
| CONTENT_STATUS_FCP_INWAITING | number | 4 | |
| CONTENT_STATUS_FCP_VALIDATED | number | 5 | |
| CONTENT_STATUS_FCP_REFUSED | number | 6 | |
| CONTENT_STATUS_INPROGRESS | number | 10 | |
| CONTENT_STATUS_AVAILABLE | number | 11 | |
| CONTENT_STATUS_EXTERNAL_INWAITING | number | 15 | |
| CONTENT_STATUS_EXTERNAL_REFUSED | number | 16 | |
| TARGET_STATUS_EDITION | number | 0 | |
| TARGET_STATUS_INWAITING | number | 1 | |
| TARGET_STATUS_VALIDATED | number | 2 | |
| TARGET_STATUS_REFUSED | number | 3 | |
| BUDGET_STATUS_EDITION | number | 0 | |
| BUDGET_STATUS_INWAITING | number | 1 | |
| BUDGET_STATUS_VALIDATED | number | 2 | |
| BUDGET_STATUS_REFUSED | number | 3 | |
| COMPUTATION_STATE_UNDEFINED | number | 0 | |
| COMPUTATION_STATE_INWAITING | number | 1 | |
| COMPUTATION_STATE_INPROCESS | number | 2 | |
| COMPUTATION_STATE_FINISHED | number | 3 | |
| EXTRACTION_STATUS_EDITION | number | 0 | |
| EXTRACTION_STATUS_INWAITING | number | 1 | |
| EXTRACTION_STATUS_VALIDATED | number | 2 | |
| EXTRACTION_STATUS_REFUSED | number | 3 | |
| EXTRACTION_STATUS_SENT | number | 4 | |
| SANDBOX_STATUS_EDITION | number | 0 | |
| SANDBOX_STATUS_INWAITING | number | 1 | |
| SANDBOX_STATUS_VALIDATED | number | 2 | |
| SANDBOX_STATUS_REFUSED | number | 3 | |
| VALIDATION_TYPE_TARGET | number | 0 | |
| VALIDATION_TYPE_CONTENT | number | 1 | |
| VALIDATION_TYPE_BUDGET | number | 2 | |
| VALIDATION_TYPE_EXTRACTION | number | 3 | |
| VALIDATION_TYPE_FCP | number | 4 | |
| VALIDATION_TYPE_SANDBOX | number | 5 | |
| VALIDATION_TYPE_AVAILABLE | number | 6 | |
| VALIDATION_TYPE_EXTERNAL | number | 7 | |
| VALIDATION_TYPE_STARTING | number | 9 | |
| VALIDATION_TYPE_MANUAL | number | 10 | |
| VALIDATION_TYPE_SUBMITFCP | number | 11 | |
| VALIDATION_TYPE_SUBMITCONTENT | number | 12 | |
| VALIDATION_TYPE_SUBMITEDITION | number | 13 | |
| VALIDATION_TYPE_VALIDATION | number | 20 | |
| VALIDATION_TYPE_PUBLICATION | number | 21 | |
| VALIDATION_TYPE_CANCELLATION | number | 22 | |
| VALIDATION_TYPE_RESERVATION | number | 23 | |
| VALIDATION_TYPE_FORMAT | number | 24 | |
| VALIDATION_TYPE_SUBMITBUDGET | number | 25 | |
| VALIDATION_TYPE_LOCK | number | 30 | |
| VALIDATION_TYPE_UNLOCK | number | 31 | |
| ASSET_STATUS_EDITION | number | 0 | |
| ASSET_STATUS_VALIDATIONPENDING | number | 1 | |
| ASSET_STATUS_INPROCESS | number | 2 | |
| ASSET_STATUS_VALIDATED | number | 3 | |
| ASSET_STATUS_REFUSED | number | 4 | |
| ASSET_STATUS_PUBLICATIONPENDING | number | 5 | |
| ASSET_STATUS_PUBLICATIONINPROCESS | number | 6 | |
| ASSET_STATUS_PUBLISHED | number | 7 | |
| ASSET_STATUS_CANCELED | number | 8 | |
| DATATRANSFER_STATUS_EDITION | number | 0 | |
| DATATRANSFER_STATUS_RUNNING | number | 2 | |
| DATATRANSFER_STATUS_CANCELING | number | 3 | |
| DATATRANSFER_STATUS_CANCELED | number | 4 | |
| DATATRANSFER_STATUS_FINISHED | number | 5 | |
| DATATRANSFER_STATUS_ERROR | number | 6 | |
| DATATRANSFER_STATUS_PAUSING | number | 7 | |
| DATATRANSFER_STATUS_PAUSED | number | 8 | |
| COSTLINE_TYPE_PLANNED | number | 0 | |
| COSTLINE_TYPE_RESERVED | number | 1 | |
| COSTLINE_TYPE_COMMITTED | number | 2 | |
| COSTLINE_TYPE_EXPENSED | number | 3 | |
| VALIDATIONLOG_ACTION_VALIDATED | number | 0 | |
| VALIDATIONLOG_ACTION_REFUSED | number | 1 | |
| VALIDATIONLOG_ACTION_CANCELED | number | 2 | |
| MEASURE_TYPE_WITHOUTCONTROL | number | 0 | |
| MEASURE_TYPE_WITHCONTROL | number | 1 | |
| HYPOTHESIS_STATE_EDITION | number | 0 | |
| HYPOTHESIS_STATE_WAITING | number | 1 | |
| HYPOTHESIS_STATE_STARTED | number | 2 | |
| HYPOTHESIS_STATE_FINISHED | number | 3 | |
| HYPOTHESIS_STATE_ERROR | number | 4 | |
| OPERATOR_TYPE_OP | number | 0 | |
| OPERATOR_TYPE_GROUP | number | 1 | |
| OPERATOR_TYPE_RIGHT | number | 2 | |
| WORKFLOWTASK_STATUS_PENDING | number | 0 | |
| WORKFLOWTASK_STATUS_COMPLETED | number | 1 | |
| MOBILE_MSGTYPE_SMS | number | 0 | |
| MOBILE_MSGTYPE_WAPPUSH | number | 1 | |
| MOBILE_MSGTYPE_MMS | number | 2 | |
| CATALOG_STATUS_EDITION | number | 0 | |
| CATALOG_STATUS_VALIDATIONPENDING | number | 1 | |
| CATALOG_STATUS_INPROCESS | number | 2 | |
| CATALOG_STATUS_VALIDATED | number | 3 | |
| CATALOG_STATUS_REFUSED | number | 4 | |
| CATALOG_STATUS_PUBLISHED | number | 7 | |
| CATALOG_STATUS_CANCELED | number | 8 | |
| CATALOG_VALIDATIONMODE_MANUAL | number | 0 | |
| CATALOG_VALIDATIONMODE_AUTO | number | 1 | |
| CENTRALLOCAL_TYPE_LOCAL | number | 0 | |
| CENTRALLOCAL_TYPE_MUTUALIZED | number | 1 | |
| CENTRALLOCAL_MODE_CENTRALIZED | number | 0 | |
| CENTRALLOCAL_MODE_LOCALIZEDOP | number | 1 | |
| CENTRALLOCAL_MODE_LOCALIZEDWEB | number | 2 | |
| CENTRALLOCAL_MODE_DISTRIBUTED | number | 3 | |
| LOCALORDER_STATUS_PROOF | number | 0 | |
| LOCALORDER_STATUS_RESERVED | number | 1 | |
| LOCALORDER_STATUS_VALIDATED | number | 2 | |
| LOCALORDER_STATUS_REFUSED | number | 6 | |
| LOCALORDER_STATUS_AVAILABLE | number | 3 | |
| LOCALORDER_STATUS_CANCELED | number | 4 | |
| LOCALORDER_STATUS_ERROR | number | 5 | |
| LOCALVALIDATIONLOG_STATUS_INWAITING | number | 0 | |
| LOCALVALIDATIONLOG_STATUS_VALIDATED | number | 1 | |
| LOCALVALIDATIONLOG_STATUS_REFUSED | number | 2 | |
| LOCALDISTRIBUTION_VALIDATIONMODE_MANUAL | number | 0 | |
| LOCALDISTRIBUTION_VALIDATIONMODE_AUTOMATIC | number | 1 | |
| OPERATION_WEBAPPTYPE_NONE | number | 0 | |
| OPERATION_WEBAPPTYPE_DEFAULT | number | 1 | |
| OPERATION_WEBAPPTYPE_USER | number | 2 | |
| OPERATION_WEBAPPTYPE_EXTERNAL | number | 3 | |
| RESOURCE_TYPE_FILE | number | 0 | |
| SIMULATION_STATUS_EDIT | number | 0 | |
| SIMULATION_STATUS_PENDING | number | 1 | |
| SIMULATION_STATUS_RUNNING | number | 2 | |
| SIMULATION_STATUS_CANCELING | number | 3 | |
| SIMULATION_STATUS_CANCELED | number | 4 | |
| SIMULATION_STATUS_FINISHED | number | 5 | |
| SIMULATION_STATUS_ERROR | number | 6 | |
| SIMULATION_STATUS_PAUSEPENDING | number | 7 | |
| SIMULATION_STATUS_PAUSE | number | 8 | |
| HYPOTHESIS_STATUS_EDIT | number | 0 | |
| HYPOTHESIS_STATUS_PENDING | number | 1 | |
| HYPOTHESIS_STATUS_RUNNING | number | 2 | |
| HYPOTHESIS_STATUS_CANCELING | number | 3 | |
| HYPOTHESIS_STATUS_CANCELED | number | 4 | |
| HYPOTHESIS_STATUS_FINISHED | number | 5 | |
| HYPOTHESIS_STATUS_ERROR | number | 6 | |
| HYPOTHESIS_STATUS_PAUSEPENDING | number | 7 | |
| HYPOTHESIS_STATUS_PAUSE | number | 8 | |
| HYPOTHESIS_TYPE_DELIVERY | number | 0 | |
| HYPOTHESIS_TYPE_OFFER | number | 1 | |
| HYPOTHESIS_TYPE_ALL | number | 127 | |
| WEBAPP_STATE_EDITION | number | 0 | |
| WEBAPP_STATE_TOPUBLISH | number | 5 | |
| WEBAPP_STATE_PROD | number | 10 | |
| REPORT_STATE_PROD | number | 10 | |
| SANDBOXMODE_COMPLETE | number | 0 | |
| SANDBOXMODE_SANDBOX | number | 1 | |
| SANDBOXMODE_SIMULATION | number | 2 | |
| SANDBOXMODE_ENFORCEMENT_COMPLETE | number | 1 | |
| VALIDATION_NOTIF | number | 0 | |
| PUBLICATION_NOTIF | number | 1 | |
| OPERATION_NOTIF | number | 2 | |
| CANCELLATION_NOTIF | number | 3 | |
| PROPOSITION_STATUS_ACCEPTED | number | 3 | |
| PROPOSITION_STATUS_CONTROL | number | 99 | |
| VALIDATION_TYPE_DELAY | number | 0 | |
| VALIDATION_TYPE_DATE | number | 1 | |
| PROCESS_TYPE_CREATEOPERATION | number | 0 | |
| PROCESS_TYPE_CREATEWORKFLOW | number | 1 | |
| PROCESS_TYPE_CANCELOPERATION | number | 2 | |
| GROUP_TYPE_NMS | number | 0 | |
| GROUP_TYPE_SEG | number | 1 | |
| GROUP_TYPE_FILE | number | 2 | |
| GROUP_TYPE_TEMPLATE | number | 3 | |
| GROUP_ORIGIN_NMS | number | 0 | |
| GROUP_ORIGIN_SEG | number | 1 | |
| GROUP_ORIGIN_FILE | number | 2 | |
| GROUP_ORIGIN_IMPORTLEAD | number | 3 | |
| OFFER_STATUS_EDITION | number | 0 | |
| OFFER_STATUS_VALIDATIONPENDING | number | 1 | |
| OFFER_STATUS_INPROCESS | number | 2 | |
| OFFER_STATUS_VALIDATED | number | 3 | |
| OFFER_STATUS_REFUSED | number | 4 | |
| OFFER_STATUS_CANCELED | number | 5 | |
| OFFER_STATUS_PUBLISHED | number | 6 | |
| OFFER_STATUS_PRODUCTIONPENDING | number | 7 | |
| OFFER_STATUS_CANCELPENDING | number | 8 | |
| OFFERVIEW_STATE_EDITION | number | 0 | |
| OFFERVIEW_STATE_VALIDATIONPENDING | number | 1 | |
| OFFERVIEW_STATE_VALIDATED | number | 3 | |
| OFFERVIEW_STATE_REFUSED | number | 4 | |
| OFFERVIEW_STATE_CANCELED | number | 5 | |
| OFFERVIEW_STATE_PUBLISHED | number | 6 | |
| SERVICE_TYPE_EMAIL | number | 0 | |
| SERVICE_TYPE_MOBILE | number | 1 | |
| SERVICE_TYPE_FACEBOOK | number | 20 | |
| SERVICE_TYPE_TWEETER | number | 25 | |
| SERVICE_TYPE_APP | number | 40 | |
| ACTION_TYPE_NONE | number | 0 | |
| ACTION_TYPE_TOVALIDATE | number | 1 | |
| ACTION_TYPE_REFUSED | number | 2 | |
| ACTION_TYPE_SUBMIT | number | 3 | |
| ACTION_TYPE_SUBSCRIBE | number | 4 | |
| ACTION_TYPE_CONFIRM | number | 5 | |
| ACTION_TYPE_EXTRACTION_APPROVAL | number | 6 | |
| ACTION_TYPE_EXTRACTION_INWAITING | number | 7 | |
| ACTION_TYPE_FCP_APPROVAL | number | 8 | |
| ACTION_TYPE_TOEDIT | number | 9 | |
| ACTION_TYPE_PREPARATION_INWAITING | number | 10 | |
| ACTION_TYPE_EXPIRED | number | 11 | |
| OUTGOINGLEAD_STAGE_UNQUALIFIED | string | unqualified | |
| OUTGOINGLEAD_STAGE_MARKETINGQUALIFIED | string | marketingQualified | |
| OUTGOINGLEAD_STAGE_SALESACCEPTED | string | salesAccepted | |
| OUTGOINGLEAD_STAGE_ABANDONNED | string | abandonned | |
| OUTGOINGLEAD_STAGE_REJECTED | string | rejected | |
| OUTGOINGLEAD_STAGE_OPPORTUNITY | string | opportunity | |
| OUTGOINGLEAD_STAGE_CLOSEDLOST | string | closedLost | |
| OUTGOINGLEAD_STAGE_CLOSEDWON | string | closedWon | |
| OPPORTUNITY_STATUS_INPROGRESS | string | inProgress | |
| OPPORTUNITY_STATUS_CLOSEDWON | string | closedWon | |
| OPPORTUNITY_STATUS_CLOSEDLOST | string | closedLost | |
| CONTENT_EDITING_MODE_DEFAULT | number | 0 | |
| CONTENT_EDITING_MODE_DCE | number | 1 | |
| CONTENT_EDITING_MODE_AEM | number | 2 | |


<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script type="text/javascript">
  $(function(){
    $('main > article > .post-content > table').DataTable({
      pageLength: 10,
    });
  });
</script>
