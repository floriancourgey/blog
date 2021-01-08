---
title: Asynchronous API calls from Adobe Campaign
categories: [opensource,adobe campaign]
---

Speed up your HTTP calls with parallele HttpClientRequest API calls! Ideal for batching unit calls.

<p class="text-center">🐍👑🌍</p>

<!--more-->


## Use h2 for each section
```js
// get data from previous activity
var query = NLWS.xtkQueryDef.create({queryDef:{
  schema:vars.targetSchema, operation: "select", lineCount: 9999999,
  select:{node:[
    {expr: '@id', alias: '@recordId'},
    {expr: "@deliveryId"},
  ]}
}});
var records = query.ExecuteQuery().getElements();

var endpoint = getOption('endpoint');

// Async API calls: for faster execution, we do N API call at a time
// @see https://docs.adobe.com/content/help/en/campaign-classic/technicalresources/api/c-HttpClientRequest.html

var recCount = vars.recCount; // optimisation: to make sure it's not a XML parsing, we store it as a Javascript variable
var requests = []; // use to store all HttpClientRequest for "HttpClientRequest.wait(requests)"

// function called after each async API call
var onComplete = function(request, context, status){
  try {
    var recordId = context.recordId;
    var request = request.response;
    // parse XML
    var xmlDoc = DOMDocument.fromXMLString(String(resp.body));
    // get a node
    var node1 = xmlDoc.getElementsByTagName("node1");
    var valueNode1 = State[0].childNodes[0].nodeValue;
    // update current temporary table
    var sql = "UPDATE "+vars.tableName+" SET sNode1 = '"+valueNode1+"' WHERE iId = "+recordId;
    sqlExec(sql);
    logInfo('onComplete Success for recordId: '+recordId+', node1: '+valueNode1+', Context_'+context.id+'. Progress: '+(recCount-records.length)+'/'+recCount);
  } catch(e) {
    logWarning('Exception for response', resp.body);
  }
  // call next
  sendNext(context);
}

// for each record
function sendNext(context) {
  // Repeat until the first execute() passes
  while(records.length != 0) {
    // get and remove first element
    var record = records.shift();
    
    // store recordId in context
    context.recordId = record.$recordId; // used by onComplete function to update the temp table 
  
    var req = new HttpClientRequest(endpoint);
    req.complete = onComplete;
    req.header["Content-Type"] = "text/xml; charset=utf-8";
    req.method = "POST";
    req.body = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:sms="SMS">' +
      // [...]
    '</soapenv:Envelope>';
    try {
      var hasProxy = false;
      var async = true;
      var timeout = 2000;
      req.execute(hasProxy, async, timeout, context);
      requests.push(req);
      return;
    } catch(error){
      logWarning('Error while getting response for broadLogId '+record.$recordId+', continue. Error:', error);
      continue; // continue because not called by onComplete
    }
  }
} 

// Start N requests
sendNext({id: 1});
sendNext({id: 2});
sendNext({id: 3});
sendNext({id: 4});
sendNext({id: 5});
sendNext({id: 6});

// Wait until all requests are completed
HttpClientRequest.wait(requests);

logInfo('Javascript Done');
```
