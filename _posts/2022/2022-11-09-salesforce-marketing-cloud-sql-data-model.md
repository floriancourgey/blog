---
title: Salesforce Marketing Cloud SQL data model
categories: [salesforce,marketing,sql]
---

<p class="text-center">🐍👑🌍</p>

<!--more-->

## Standard tables
```console
_Subscribers: SubscriberID, SubscriberKey, EmailAddress, Status, SubscriberType, DateJoined, DateUndeliverable, DateUnsubscribed (https://help.salesforce.com/s/articleView?id=sf.mc_as_data_view_subscribers.htm&type=5)
_bounce
_Click: SubscriberID, JobID, EventDate, URL, LinkName (https://help.salesforce.com/s/articleView?id=sf.mc_as_data_view_click.htm&type=5)
_Open
_Complaint
_Journey
```
## Salesforce JOIN help

- [Trailhead Query Data with SQL](https://trailhead.salesforce.com/fr/content/learn/modules/marketing-cloud-data-management/query-data-with-sql)
