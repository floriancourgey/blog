---
title: Monitor paused Workflows on Adobe Campaign
categories: [opensource,adobe campaign]
---

Send a daily alert if some of your critical workflows are not running (status is paused, failed, restart required..).

<p class="text-center">⚙️🛑📧</p>

<!--more-->

## Workflow set up
The workflow runs daily @ 9AM and consists of a Scheduler, a Query on workflows, a Javascript activity and an Email Alert:

wf image

## Query set up
The query is based on `xtk:workflow`, where the `state` is different from `Started` and the `internalName` is in a whitelist with `OR` conditions:

query image

Use additional data to add the columns you need to display:

adtl data

You can use `@folderLabel` for the Folder Label alias.

## Test activity set up
The test activity performs a simple test on `vars.recCount > 0` without the default connection:

test image

## Javascript activity
The JS builds an HTML table based on the query results:
```js
var query = NLWS.xtkQueryDef.create({queryDef: {
  schema: vars.targetSchema, operation: "select",
  select: { node: [
    {expr: "@internalName"},
    {expr: "@label"},
    {expr: "@folderLabel"},
    {expr: "@lastStart"},
    {expr: "@state"},
  ]},
  orderBy: { node: [{expr:"@label", sortDesc:"false"}] }
}});
var records = query.ExecuteQuery();

vars.htmlEmail = '';
vars.htmlEmail += '<table border="1"><thead>';
vars.htmlEmail += '<tr><th>internalName</th><th>Label</th><th>State</th><th>Last Start</th><th>Folder</th></tr>';
vars.htmlEmail += '</thead><tbody>';
for each(var record in records.getElements()){
  vars.htmlEmail += '<tr>';
  vars.htmlEmail += '<td>'+record.$internalName+'</td>';
  vars.htmlEmail += '<td>'+record.$label+'</td>';
  vars.htmlEmail += '<td>'+record.$state+'</td>';
  vars.htmlEmail += '<td>'+record.$lastStart+'</td>';
  vars.htmlEmail += '<td>'+record.$folderLabel+'</td>';
  vars.htmlEmail += '</tr>';
}
vars.htmlEmail += '</tbody></table>';
```

## Email activity

The email uses `vars.recCount` and `vars.htmlEmail`:
```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
</HEAD>
<BODY>
<P>Hi,</P>
<P>This is to notify you that&nbsp;following workflows are STOPPED on <%= formatDate(new Date(), "%4Y/%2M/%2D") %>.</P>
<P><STRONG>List of non running workflows</STRONG>:<BR><%= vars.htmlEmail %></P>
<P>Please make sure that those workflows are <STRONG>always</STRONG> 
running.</P>
<P>Thanks.</P>
</BODY></HTML>
```
