---
title: Use the context in Web Apps in Adobe Campaign
redirect_from: /2018/07/use-the-context-in-web-apps-in-adobe-campaign/
categories:
  - adobe campaign
  - automation
  - javascript
  - neolane
  - opensource
---

<!-- more -->

In HTML:

```
<%= ctx.query.recipient.@firstName %>
```

In JavaScript code

```js
var now = formatDate(new Date(), "%4Y-%2M-%2D %02H:%02N:%02S")

xtk.session.Write(
  <recipient xtkschema="nms:recipient" _operation="update" _key="@id" id={ctx.recipient.@id}
    acquisitionDate={now}
    acquisitionChannel="Webapp"
  />
);
```
