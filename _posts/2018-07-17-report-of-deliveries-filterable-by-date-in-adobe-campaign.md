---
id: 813
title: Report of deliveries filterable by date in Adobe Campaign
date: 2018-07-17T18:42:06+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=813
permalink: /2018/07/report-of-deliveries-filterable-by-date-in-adobe-campaign/
categories:
  - opensource
---
## Objective

We will be achieving the following:

<img class="aligncenter size-full wp-image-815" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Preview-of-Deliveries-by-date-Report.jpg?resize=525%2C230&#038;ssl=1" alt="" width="525" height="230" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Preview-of-Deliveries-by-date-Report.jpg?w=1367&ssl=1 1367w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Preview-of-Deliveries-by-date-Report.jpg?resize=300%2C131&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Preview-of-Deliveries-by-date-Report.jpg?resize=768%2C336&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Preview-of-Deliveries-by-date-Report.jpg?resize=1024%2C448&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

Via the workflow below:

<img class="aligncenter size-full wp-image-814" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Deliveries-by-date-Workflow.jpg?resize=525%2C247&#038;ssl=1" alt="" width="525" height="247" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Deliveries-by-date-Workflow.jpg?w=700&ssl=1 700w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Deliveries-by-date-Workflow.jpg?resize=300%2C141&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

## 0. Create workflow variables

  * startDate (Datetime)
  * endDate (Datetime)

## 1. Filter your deliveries via the Query

In the query, remove proofs via <span class="lang:default decode:true crayon-inline ">lower(label )does not contain &#8220;[proof&#8221;</span>  and ensure you have a <span class="lang:default decode:true crayon-inline ">contact date is not null</span> . Internally, we use another filter to target only campaign deliveries with <span class="lang:default decode:true crayon-inline ">utm_source = newsletter</span> .

<img class="aligncenter size-full wp-image-822" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Query-filter-for-deliveries.jpg?resize=525%2C154&#038;ssl=1" alt="" width="525" height="154" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Query-filter-for-deliveries.jpg?w=1061&ssl=1 1061w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Query-filter-for-deliveries.jpg?resize=300%2C88&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Query-filter-for-deliveries.jpg?resize=768%2C225&ssl=1 768w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/07/Query-filter-for-deliveries.jpg?resize=1024%2C300&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

Contact date should be:

  *  <span class="lang:default decode:true crayon-inline">on or after</span>  <span class="lang:default decode:true crayon-inline ">ToDate($([vars/startDate]))</span>  if <span class="lang:default decode:true crayon-inline">length($([vars/startDate]) ) > 0</span>  AND
  *  <span class="lang:default decode:true crayon-inline">on or before</span> <span class="lang:default decode:true crayon-inline ">ToDate($([vars/endDate]))</span>  if <span class="lang:default decode:true crayon-inline">length($([vars/endDate]) ) > 0</span>

## 2. Add the JavaScript code

Add <span class="lang:default decode:true crayon-inline ">vendor:moment</span>  as a Javascript code. Copy source from <https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js> to <span class="lang:default decode:true crayon-inline">Administration > Configuration > Javascript code</span>:<img class="aligncenter size-full wp-image-818" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/moment.min_.js-as-a-Javascript-code.jpg?resize=477%2C278&#038;ssl=1" alt="" width="477" height="278" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/moment.min_.js-as-a-Javascript-code.jpg?w=477&ssl=1 477w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/07/moment.min_.js-as-a-Javascript-code.jpg?resize=300%2C175&ssl=1 300w" sizes="(max-width: 477px) 100vw, 477px" data-recalc-dims="1" />

It can then be used in a JS script, via <span class="lang:default decode:true crayon-inline">loadLibrary(&#8216;vendor:moment&#8217;)</span>

<pre class="lang:js decode:true" title="Set default date">loadLibrary('vendor:moment')
// set default start/end date to first/last day of today's month
// we have to set 10AM to be sure for the timezone
ctx.vars.startDate = moment().startOf('month').hour(10).format('YYYY-MM-DD HH:mm:ss');
ctx.vars.endDate = moment().endOf('month').hour(10).format('YYYY-MM-DD HH:mm:ss');</pre>

## 3. Configure the Page

&nbsp;