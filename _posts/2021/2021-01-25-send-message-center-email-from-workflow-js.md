---
title: Send Message Center realtime emails from Workflows! (Javascript)
categories: [opensource,adobe campaign]
author: "Yannick Le Voguer"
---

From a workflow in Classic instance A, send a SOAP message to Message Center instance B.

<p class="text-center">🐍👑🌍</p>

<!--more-->

## External Account

Create an external account of `Type=Execution Instance` (internal value `11`). Make sure to fill in the URL, login and password:

![](/assets/images/2021/message-center-external-account-settings.jpg)

Get its Primary key for later use.

## Javascript Code

In a workflow, paste the following code:

```js
loadLibrary("/nl/core/shared/nl.js");
NL.require("/nl/core/shared/xtk.js")
  .require('/nms/executionInstance.js');
var extAccount = 11111; // change External Account Primary Key here
var event = <rtEvent type="my_event_type" wishedChannel="0" email="recipient@yopmail.com" externalId="xxx">
                <ctx>
                      <vars attribute1="value 1">
                        <element1>Value xxx</element1>
                      </vars>
                </ctx>
        </rtEvent>
var rtCell = NL.ExecutionInstance.getExtAccount(extAccount, NL.ExecutionInstance.MESSAGECENTER_TYPE);
logInfo(rtCell); // <extAccount account="xxx" active="1" name="xxx" [...]/>
vars.login = String(rtCell.@account);
vars.password = String(rtCell.@password);
vars.url = String(rtCell.@server);
document.cnx = new HttpSoapConnection(vars.url + '/nl/jsp/soaprouter.jsp', 'utf-8', 0)
document.soapSrv = new SoapService(cnx, 'urn:nms:rtEvent')
document.soapSrv.addMethod('ExecuteQuery', 'xtk:queryDef#ExecuteQuery',
                           ['sessiontoken', 'string','entity', 'NLElement'],
                           ['pdomOutput', 'NLElement'])
var tokens = NL.ExecutionInstance.logonRemote(vars.url, vars.login, vars.password);
logInfo(JSON.stringify(tokens)); // {"sessionToken": "xxx", "securityToken": "xxx"}
document.cnx.addTokens(tokens["sessionToken"], tokens["securityToken"]);
document.soapSrv.addMethod("PushEvent","nms:rtEvent#PushEvent",["sessiontoken", "string", "domDoc", "NLElement"],
[]);
document.soapSrv.PushEvent("",event);
```

All credits to [Yannick Le Voguer](https://www.linkedin.com/in/yannick-le-voguer-2b195421/), thanks!
