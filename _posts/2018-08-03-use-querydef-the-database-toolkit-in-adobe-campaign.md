---
id: 931
title: Use queryDef, the Database toolkit in Adobe Campaign
date: 2018-08-03T16:24:52+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=931
permalink: /2018/08/use-querydef-the-database-toolkit-in-adobe-campaign/
tinymce-comment-field_enabled:
  - "1"
categories:
  - adobe campaign
  - javascript
  - linux
  - neolane
  - opensource
---
Use quick and reliable Adobe Campaign methods such as nms.delivery.load(&#8220;12435&#8243;), nms.recipient.create( { firstName:&#8221;John&#8221; } ) and build complex XML E4X queries to go in details!

<!--more-->

Entity Schema static methods

<pre class="lang:default decode:true">// get via @id and save
var delivery = nms.delivery.load("12435")
delivery.label = "New label"
delivery.save()

// create via XML-E4X and save
var recipient = nms.recipient.create(
  &lt;recipient 
    email = "support@neolane.com" 
    lastName = "Neolane" 
    firstName = "Support"/&gt;)
recipient.save()

// create via JS and save
var recipient = nms.recipient.create()
recipient.email = ..
recipient.lastName = ..
recipient.firstName = ..
recipient.save()</pre>

&nbsp;

&nbsp;

Base query to get all Deliveries BUT Proofs BEFORE the beginning of the month, MAXIMUM 3 results:

<pre class="lang:default decode:true">var q = xtk.queryDef.create(
  &lt;queryDef schema="nms:delivery" operation="select" lineCount="3"&gt;
    &lt;select&gt;
      &lt;node expr="@id"/&gt;
      &lt;node expr="@label"/&gt;
    &lt;/select&gt;
    &lt;where&gt;
      &lt;condition expr={"@label NOT LIKE '%Proof%'"} bool-operator="AND"/&gt;
      &lt;condition expr={"@created &lt;= '2018-08-01'"} bool-operator="AND"/&gt;
    &lt;/where&gt;
    &lt;orderBy&gt;
      &lt;node expr="@lastModified" sortDesc="true"/&gt; 
    &lt;/orderBy&gt;    
  &lt;/queryDef&gt;
);
var deliveries = q.ExecuteQuery()
for each(var delivery in deliveries.delivery){
  logInfo(delivery.@label)
}</pre>

&nbsp;

Count

<pre class="lang:default decode:true ">jobCount = xtk.queryDef.create(
      &lt;queryDef schema="nms:remaHypothesis" operation="get"&gt;
        &lt;select&gt;
          &lt;node expr="Count(@id)" alias="@count"/&gt;
        &lt;/select&gt;
        &lt;where&gt;
          &lt;condition expr={"@status="+HYPOTHESIS_STATUS_RUNNING}/&gt;
        &lt;/where&gt;
      &lt;/queryDef&gt;)

    iJobCount = iJobCount + parseInt(jobCount.ExecuteQuery().@count)</pre>

&nbsp;

Multiple WHERE&#8230;AND in 1 condition / count() / countDistinct()

<pre class="lang:default decode:true ">var xmlQuery = &lt;queryDef schema="nms:trackingLogRcp" operation="select" lineCount="1000000"&gt;
  &lt;select&gt;
    &lt;node expr="DateOnly(@logDate)" groupBy="1"/&gt;
    &lt;node expr="@userAgent" groupBy="1"/&gt;
    &lt;node expr="count(@id)"/&gt;
    &lt;node expr="countDistinct([@broadLog-id])"/&gt;
  &lt;/select&gt;
  &lt;where&gt;
    &lt;condition expr={"@logDate IS NOT NULL and @logDate &lt; #" + today + "# and [@url-id] &lt;&gt; 1"}/&gt;
  &lt;/where&gt;
&lt;/queryDef&gt;

</pre>

&nbsp;

Append a Where condition / date Format.toISO8601

<pre class="lang:default decode:true">if(condition){
  xmlQuery.where.appendChild(&lt;condition expr={"@logDate &gt;= #" + Format.toISO8601(lastConsolidation) + "#"}/&gt;)
}
var result = xtk.queryDef.create(xmlQuery).ExecuteQuery()</pre>

&nbsp;

Append a where from empty <where/>

<pre class="lang:default decode:true ">// fill select from loop
var select = &lt;select/&gt;;
for each( var targetKey in space.targetKey ){
  select.appendChild(&lt;node expr={xpath} alias={"@tmp" + j}/&gt;);
}

// fill where from loop
var where = &lt;where/&gt;
for( var i=0; i &lt; aPKXPaths.length; i++ ) {
  where.appendChild(&lt;condition expr={aPKXPaths[i] + "=" + keyValue}/&gt;)
}

// create query
var xmlQryKeys = &lt;queryDef operation="get" schema={strTargetSchema}/&gt;;
xmlQryKeys.appendChild(select);
xmlQryKeys.appendChild(where);</pre>

&nbsp;

&nbsp;

instance.engine / exec with parameters / date Format.parseDateTimeInter

<pre class="lang:default decode:true ">var dbEngine = instance.engine
dbEngine.exec("UPDATE NmsUserAgentStats SET iVisitorsOfTheDay="
  + record.@visitors + " WHERE tsDate = $(dt)", Format.parseDateTimeInter(record.@date.toString()))</pre>

&nbsp;