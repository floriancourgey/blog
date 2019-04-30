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

## JS Adobe Campaign helpers
```js
/**
 * @return Date of the database server
 */
getCurrentDate()
/**
 * @return Date of the linux server
 * @deprecated, use @see getCurrentDate()
 */
// new Date()
```

## js2string - Javascript Date to String
```js
/**
 * Converts a Javascript Date to a String
 * @return string
 */
formatDate(Date date, String format , String timeZone = null)
formatDate(getCurrentDate(), "%4Y%2M%2D-%2H%2M%2S"); // "20190430-150837" for folder names
formatDate(getCurrentDate(), "%A %D %B %4Y"); // "Tue 30 Apr 2019" for technical emails
formatDate(getCurrentDate(), "%Al %D %Bl %4Y"); // "Tuesday 30 April 2019" for marketing emails
```
From https://docs.campaign.adobe.com/doc/AC/en/jsapi/f-formatDate.html

*Note: Prefix numbers with a number (2, 4..) to add leading zeros.*

*Note: Prefix names with l to use full name instead of short name.*

| Code | Type | Example |
|-|-|-|
| %Y | Year | 2019 |
| %M | Month of the year (1-12) | 6 |
| %2M | Month of the year (01-12) | 06 |
| %B | Month name (short) | Jan |
| %Bl | Month name (full) | January |
| %D | Day of the month (1-31) | 3 |
| %A | Day name (short) | Mon |
| %Al | Day name (short) | Monday |
| %J | Day of the year (1-366) | |
| %W | Week of the year | |
| %H | Hour 24h (0-23) | 5 |
| %2H | Hour 24h (00-23) | 05 |
| %I | Hour 12h (1-12) | |
| %P | AM/PM | AM |
| %N | Minutes (0-59) | |
| %S | Seconds (0-59) | |

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
