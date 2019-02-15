---
title: Report of deliveries filterable by date in Adobe Campaign
categories: [opensource, adobe campaign, report]
---
## Objective

We will be achieving the following:

![](/assets/images/2018/07/Preview-of-Deliveries-by-date-Report.jpg)

Via the workflow below:

![](/assets/images/2018/07/Deliveries-by-date-Workflow.jpg)

<!-- more -->

## Create workflow variables

  * startDate (Datetime)
  * endDate (Datetime)

## Filter your deliveries via jQuery

In the query, remove proofs via <span class="lang:default decode:true crayon-inline ">lower(label )does not contain &#8220;[proof&#8221;</span>  and ensure you have a <span class="lang:default decode:true crayon-inline ">contact date is not null</span> . Internally, we use another filter to target only campaign deliveries with <span class="lang:default decode:true crayon-inline ">utm_source = newsletter</span> .

![](/assets/images/2018/07/Query-filter-for-deliveries.jpg)

Contact date should be:

  *  `on or after`  `ToDate($([vars/startDate]))`  if `length($([vars/startDate]) ) > 0`  AND
  *  `on or before` `ToDate($([vars/endDate]))`    if `length($([vars/endDate]) ) > 0`

## Add the JavaScript code

Add `vendor:moment`  as a Javascript code. Copy source from <https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js> to `Administration > Configuration > Javascript code`:

![](/assets/images/2018/07/moment.min_.js-as-a-Javascript-code.jpg)

It can then be used in a JS script, via `loadLibrary('vendor:moment')`:

```js
loadLibrary('vendor:moment')
// set default start/end date to first/last day of today's month
// we have to set 10AM to be sure for the timezone
ctx.vars.startDate = moment().startOf('month').hour(10).format('YYYY-MM-DD HH:mm:ss');
ctx.vars.endDate = moment().endOf('month').hour(10).format('YYYY-MM-DD HH:mm:ss');
```

## Configure the Page

