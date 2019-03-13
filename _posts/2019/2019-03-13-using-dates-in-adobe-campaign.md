---
title: Using dates in Adobe Campaign
categories: [opensource,adobe campaign,date]
---

<p class="text-center">📊📧🌍</p>
<!--more-->

- Generic helpers
- xml2js
- js2sql
- sql2js

## Adobe Campaign helpers
```js
new Date(); // @return Date of the linux server
getCurrentDate(); // @return Date of the database server
```

## xml2js - XML String date to Javascript Date
```js
var query = NLWS.xtkQueryDef.create({queryDef: {
  schema: "nms:recipient", operation: "get", 
  select: { node: {expr: "@lastModified"} }, 
  where: { condition: {expr: "@id=123456"} },
}});
var recipientXml = query.ExecuteQuery();
var lastModified = parseTimeStamp(recipientXml.$lastModified); // @return Date
```

## js2sql - Javascript Date to SQL String format
Using 

```js
loadLibrary("xtk:common.js"); // for Format
var recipient = NLWS.nmsRecipient.load(recipientId);
task.lastModified = Format.formatDateTimeInter(getCurrentDate());
recipient.save();
```

## sql2js - SQL String to Javascript Date
```js
var recipient = NLWS.nmsRecipient.load(recipientId);
var lastModified = parseTimeStamp(recipient.lastModified); // @return Date
```

Accepted String formats for `parseTimeStamp`:
```console
2005-03-02 00:00:00
2005-03-02
2005-03-02T14:32:26
2005-03-02T14:32:26.0000
2005-03-02T14:32:26.0000000+01:00
2005-03-02T14:32:26+01:00
2005-03-02T14:32:26Z
2005-03-02T14:32:26.0005Z
2005/03/02 14:32:25
```
