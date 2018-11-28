---
id: 872
title: Call another workflow in Adobe Campaign
date: 2018-07-24T19:39:31+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=872
permalink: /2018/07/call-another-workflow-in-adobe-campaign/
categories:
  - adobe campaign
  - automation
  - neolane
  - opensource
---
Wokflow 1 will call Workflow 2.

In workflow 1:

<img class="aligncenter size-full wp-image-877" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Call-another-workflow-activities.jpg?resize=258%2C134&#038;ssl=1" alt="" width="258" height="134" data-recalc-dims="1" /><img class="aligncenter size-full wp-image-876" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Call-another-workflow-JavaScript-Code.jpg?resize=525%2C252&#038;ssl=1" alt="" width="525" height="252" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Call-another-workflow-JavaScript-Code.jpg?w=1238&ssl=1 1238w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Call-another-workflow-JavaScript-Code.jpg?resize=300%2C144&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Call-another-workflow-JavaScript-Code.jpg?resize=768%2C368&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Call-another-workflow-JavaScript-Code.jpg?resize=1024%2C491&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

<pre class="lang:js decode:true">xtk.workflow.PostEvent("freshLoadingPosCounterAsia", "signal", "", &lt;variables market={vars.market}/&gt;, false);</pre>

<pre class="lang:js decode:true">/**
 * @var workflowId Identifier or internal name of the workflow
 * @var activity The name of the activity from which the event starts
 * @var transition The name of the transition to activate. If this name is empty, the event will be issued on the first valid transition (expiry type events are ignored). 
 * @var parameters The parameters of the event in the form of an XML element. The name of the element must be variables. If you do not want to pass a variable, you can use an empty element &lt;variables/&gt; or an empty string "".
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
)</pre>

Note: Workflow 2 will be exeucted asynchronously, and must be started before calling PostEvent.

In Workflow 2:

 <img class="aligncenter size-full wp-image-878" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Call-another-workflow-External-Signal-activity.jpg?resize=117%2C105&#038;ssl=1" alt="" width="117" height="105" data-recalc-dims="1" /><img class="aligncenter size-full wp-image-879" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Call-another-workflow-External-Signal-detail.jpg?resize=525%2C442&#038;ssl=1" alt="" width="525" height="442" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Call-another-workflow-External-Signal-detail.jpg?w=531&ssl=1 531w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Call-another-workflow-External-Signal-detail.jpg?resize=300%2C253&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />