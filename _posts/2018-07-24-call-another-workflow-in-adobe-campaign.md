---
id: 872
title: Call another workflow in Adobe Campaign
date: 2018-07-24T19:39:31
author: Florian Courgey
layout: post
permalink: /2018/07/call-another-workflow-in-adobe-campaign/
categories: [adobe campaign,automation,neolane,opensource]
---
This tutorial will walk you through setting up a `workflow1` calling `workflow2` upon completion. Also contains business cases (wait for multiple workflows to complete), and exception handling.
<p class="text-center">⚙️🔜⚙️</p>
<!--more-->

## Generic case: `workflow1` calls `workflow2` with `PostEvent`

The *calling* `workflow1` contains your business logic and ends with a `javascript activity` (containing `xtk.workflow.PostEvent()`):

![](/assets/images/2019/01/adobe-campaign-call-workflow-postevent-workflow1.jpg)

The *called* `workflow2` has a `signal activity` and then some logic:

![](/assets/images/2019/01/adobe-campaign-call-workflow-postevent-workflow2.jpg)

The generic JS call is as follow:
```js
xtk.workflow.PostEvent("workflowInternalName", "signalInternalName", "", <variables/>, false);
```

So in our case:
```js
var myVar1 = "hello world!";
xtk.workflow.PostEvent("workflow2", "signal", "", <variables var1={myVar1}/>, false);
```

Start `workflow2` (to activate its `signal`), then `workflow1`. We can see in the logs that the value has been passed over, in a synchronous call:

Logs of `workflow1`:

![](/assets/images/2019/01/adobe-campaign-call-workflow-postevent-workflow1-audit-logs.jpg)

Logs of `workflow2`:

![](/assets/images/2019/01/adobe-campaign-call-workflow-postevent-workflow2-audit-logs.jpg)

```js
/**
 * @var workflowId Identifier or internal name of the workflow
 * @var activity The name of the activity from which the event starts
 * @var transition The name of the transition to activate. If this name is empty, the event will be issued on the first valid transition (expiry type events are ignored). 
 * @var parameters The parameters of the event in the form of an XML element. The name of the element must be variables. If you do not want to pass a variable, you can use an empty element <variables/> or an empty string "".
 * @var complete All pending tasks of the specified activity are finished
 *
 * @return null
 */
function PostEvent (
    String       workflowId,
    String       activity,
    String       transition,
    XML          parameters,
    Boolean      complete
)
```
 
 References:
 - https://docs.campaign.adobe.com/doc/AC/en/jsapi/sm-workflow-PostEvent.html
 
 ## Business case: wait for multiple workflows to be done, then call a final workflow
 
 3 workflows `start1`, `start2` and `start3` needs to be done, before the last workflow `final` is executed:
 
 ![](/assets/images/2019/01/adobe-campaign-call-workflow-postevent-multiple-123.jpg)
 
 They contain this JS code:
 ```js
 // start1  
logInfo('start1 done');  
var params = <variables var1="hello"/>;  
xtk.workflow.PostEvent("finalWorkflow", "signal1", "", params, false);  
// start2  
logInfo('start2 done');  
var myVar = "var myVar";  
var params = <variables var2={myVar}/>;  
xtk.workflow.PostEvent("finalWorkflow", "signal2", "", params, false);  
// start3  
logInfo('start3 done');  
var myObject = {key:"value"};  
var params = <variables var3={myObject.key}/>;  
xtk.workflow.PostEvent("finalWorkflow", "signal3", "", params, false);  
 ```
 
 The `final` workflow contains 3 signals `signal1`, `signal2` and `signal3`, all linked to an `AND` activity:
 ![](/assets/images/2019/01/adobe-campaign-call-workflow-postevent-multiple-final.jpg)
 With this code
 ```js
logInfo('Final');
logInfo('vars.var1', vars.var1);
logInfo('vars.var2', vars.var2);
logInfo('vars.var3', vars.var3);
 ```
 

 Run the last workflow, then the 3 first, and you'll have the following logs:
 ![](/assets/images/2019/01/adobe-campaign-call-workflow-postevent-multiple-logs.jpg)
 
 ## Business case: exception handling
 
