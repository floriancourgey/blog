---
title: Use queryDef, the Database toolkit in Adobe Campaign
redirect_from: /2018/08/use-querydef-the-database-toolkit-in-adobe-campaign/
categories:
  - adobe campaign
  - javascript
  - linux
  - neolane
  - opensource
---
Use quick and reliable Adobe Campaign methods such as `NLWS.nmsDelivery.load("12435")`, `NLWS.nmsRecipient.create({ firstName:"John" })` and build complex XML E4X queries to go in details!

<!--more-->

Entity Schema static methods
## Load, save, create in E4X
```js
// get via @id and save
var delivery = NLWS.nmsDelivery.load("12435")
delivery.label = "New label"
delivery.save()

// create via XML-E4X and save
var recipient = NLWS.nmsRecipient.create(
  <recipient
    email = "support@neolane.com"
    lastName = "Neolane"
    firstName = "Support"/>)
recipient.save()

// create via JSON, edit via JS and save
var recipient = NLWS.nmsRecipient.create({x:{ // the key 'x' doesn't matter
  email: 'a@a.a',
}})
recipient.firstName = 'John';
recipient.lastName = 'Doe';
recipient.save()
```

## Get with JSON
```js
var email = "contact@hello.world";
var query = NLWS.xtkQueryDef.create({queryDef: {
  schema: "nms:recipient", operation: "get", // "get" does a SQL "LIMIT 1"
    select: { node: [{expr: "@id"}] }, // get @id only
    where: {
      condition: [{expr: "@email= '"+email+"'"}] // filter by email
    }
  }
});
var res = query.ExecuteQuery();
var recipient = NLWS.nmsRecipient.load(res.$id);
recipient.email = null;
recipient.save();
```

## SQL Insert into helper
```js
var fields = {
  'sFirstName': vFirstName,
  'sLastName': vLastName,
};
var log = false;
insertInto(vars.tableName, fields, log);
```
See my [Adobe Campaign helpers (SQL, string, XML, linux..)](/2019/2019-03-19-adobe-campaign-helpers)

## Select multiple with `where` and `orderBy`

Base query to get all Deliveries BUT Proofs BEFORE the beginning of the month, MAXIMUM 3 results:

```js
var q = xtk.queryDef.create(
  <queryDef schema="nms:delivery" operation="select" lineCount="3">
    <select>
      <node expr="@id"/>
      <node expr="@label"/>
    </select>
    <where>
      <condition expr={"@label NOT LIKE '%Proof%'"} bool-operator="AND"/>
      <condition expr={"@created <= '2018-08-01'"} bool-operator="AND"/>
    </where>
    <orderBy>
      <node expr="@lastModified" sortDesc="true"/>
    </orderBy>    
  </queryDef>
);
var deliveries = q.ExecuteQuery()
for each(var delivery in deliveries.delivery){
  logInfo(delivery.@label)
}
```

## Select raw data from workflow transition
Plug a `query` into a `javascript` activity, then in the JS, retrieve the results. Usefule for DQM with JS functions:
```js
var xml = sqlSelect("collection,@id", "SELECT iId as id FROM "+vars.tableName); // <select><collection id="1"/><collection id="2"/></select>
logInfo(xml.toXMLString());// "<select><collection id="1"/><collection id="2"/></select>"
for each(var record in xml.collection){
  logInfo('id:'+record.@id); // "id: 1" "id: 2"
  // if the query was based on nms:recipient, retrieve the JS recipient with:
  var recipient = NLWS.nmsRecipient.load(record.@id);
  logInfo(recipient.email);
  recipient.lastName = recipient.lastName.toUpperCase();
  recipient.save();
}
```

## Count

```js
jobCount = xtk.queryDef.create(
  <queryDef schema="nms:remaHypothesis" operation="get">
    <select>
      <node expr="Count(@id)" alias="@count"/>
    </select>
    <where>
      <condition expr={"@status="+HYPOTHESIS_STATUS_RUNNING}/>
    </where>
  </queryDef>)

iJobCount = iJobCount + parseInt(jobCount.ExecuteQuery().@count)
```

Multiple WHERE&#8230;AND in 1 condition / count() / countDistinct()

```js
var xmlQuery = <queryDef schema="nms:trackingLogRcp" operation="select" lineCount="1000000">
  <select>
    <node expr="DateOnly(@logDate)" groupBy="1"/>
    <node expr="@userAgent" groupBy="1"/>
    <node expr="count(@id)"/>
    <node expr="countDistinct([@broadLog-id])"/>
  </select>
  <where>
    <condition expr={"@logDate IS NOT NULL and @logDate < #" + today + "# and [@url-id] <> 1"}/>
  </where>
</queryDef>
```

## Construct a where step by step
Append a Where condition / date Format.toISO8601

```js
if(condition){
  xmlQuery.where.appendChild(<condition expr={"@logDate >= #" + Format.toISO8601(lastConsolidation) + "#"}/>)
}
var result = xtk.queryDef.create(xmlQuery).ExecuteQuery()
```

Append a `where` to an empty `<where/>`

```js
// fill select from loop
var select = <select/>;
for each( var targetKey in space.targetKey ){
  select.appendChild(<node expr={xpath} alias={"@tmp" + j}/>);
}

// fill where from loop
var where = <where/>
for( var i=0; i < aPKXPaths.length; i++ ) {
  where.appendChild(<condition expr={aPKXPaths[i] + "=" + keyValue}/>)
}

// create query
var xmlQryKeys = <queryDef operation="get" schema={strTargetSchema}/>;
xmlQryKeys.appendChild(select);
xmlQryKeys.appendChild(where);
```
## Raw SQL code execution
instance.engine / exec with parameters / date Format.parseDateTimeInter

```js
var dbEngine = instance.engine
dbEngine.exec("UPDATE NmsUserAgentStats SET iVisitorsOfTheDay="
  + record.@visitors + " WHERE tsDate = $(dt)", Format.parseDateTimeInter(record.@date.toString()))
```
