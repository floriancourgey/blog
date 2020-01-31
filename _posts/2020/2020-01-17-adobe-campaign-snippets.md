---
title: Snippets for Adobe Campaign (JavaScript, XML, SQL)
categories: [opensource,adobe campaign]
---

Excerpt here...

<p class="text-center">🐍👑🌍</p>

<!--more-->

**bold** *italic*  ~~strikethrough~~

## Handling XML in JavaScript
```js
var xmlDoc = DOMDocument.load(vars.filename);
var entries = xmlDoc.getElementsByTagName('entry');
logInfo(entries.length);
for each(var entry in entries){
	  logInfo(entry.getValue('g:image_link'));
	  var sql = "INSERT INTO "+vars.tableName+" (iId, sProductId) VALUES ($(id), 'a')";
	  var recCount = sqlExec(sql);
	  logInfo('('+recCount+')', sql);
}
```

## Filtering
```console
0|@created|#2020-01-30 23:00:00.000Z#|>=|||||0|/|0
0|@blackList|0|=|AND||||0|/|0
0||||AND||||1|/|0
0|@email|'%@%.%'|LIKE|||||0|/|1
0|@mobilePhone||IS NOT NULL|OR||||0|/|1
```

![todo](/assets/images/2020/01/20200117-160032-screenshot-7.jpg)

## Select raw data from workflow transition
```javascript
var query = NLWS.xtkQueryDef.create({queryDef: {
  schema: vars.targetSchema, operation: 'select', lineCount: 999999999, // /!\ lineCount defaults to 10,000
  select: { node: [
    {expr: '@id'},
    {expr: '@email'},
  ]},
}});
var records = query.ExecuteQuery(); // DOMElement

for each(var record in records.getElements()){
  logInfo(record.$id);
  var cleanedEmail = record.$email.replace(/\s+/g, '').toLowerCase();
  sqlExec("UPDATE "+vars.tableName+" SET sEmail=$(sz) WHERE iId=$(l)", cleanedEmail, record.$id);
}
```
