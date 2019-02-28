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
Use quick and reliable Adobe Campaign methods such as nms.delivery.load("12435"), nms.recipient.create( { firstName:"John" } ) and build complex XML E4X queries to go in details!

<!--more-->

Entity Schema static methods

```js
// get via @id and save
var delivery = nms.delivery.load("12435")
delivery.label = "New label"
delivery.save()

// create via XML-E4X and save
var recipient = nms.recipient.create(
  <recipient 
    email = "support@neolane.com" 
    lastName = "Neolane" 
    firstName = "Support"/>)
recipient.save()

// create via JS and save
var recipient = nms.recipient.create()
recipient.email = ..
recipient.lastName = ..
recipient.firstName = ..
recipient.save()
```

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

Count

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

instance.engine / exec with parameters / date Format.parseDateTimeInter

```js
var dbEngine = instance.engine
dbEngine.exec("UPDATE NmsUserAgentStats SET iVisitorsOfTheDay="
  + record.@visitors + " WHERE tsDate = $(dt)", Format.parseDateTimeInter(record.@date.toString()))
```
