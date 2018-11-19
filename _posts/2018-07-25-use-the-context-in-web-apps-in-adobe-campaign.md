---
id: 882
title: Use the context in Web Apps in Adobe Campaign
date: 2018-07-25T18:04:38+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=882
permalink: /2018/07/use-the-context-in-web-apps-in-adobe-campaign/
categories:
  - adobe campaign
  - automation
  - javascript
  - neolane
  - opensource
---
In HTML:

<pre class="lang:default decode:true ">&lt;%= ctx.query.recipient.@firstName %&gt;</pre>

In JavaScript code

<pre class="lang:js decode:true ">var now = formatDate(new Date(), "%4Y-%2M-%2D %02H:%02N:%02S")

xtk.session.Write(
  &lt;recipient xtkschema="nms:recipient" _operation="update" _key="@id" id={ctx.recipient.@id}
    acquisitionDate={now}
    acquisitionChannel="Webapp"
  /&gt;
);
</pre>

&nbsp;