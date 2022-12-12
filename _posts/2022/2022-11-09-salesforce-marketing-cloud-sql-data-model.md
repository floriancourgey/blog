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

## Salesforce Service data model with connector

In Salesforce Service Cloud, the connector creates the following data model:

```console
et4ae5__abTest__c
et4ae5__AggregateLink__c
et4ae5__Automated_Send__c
et4ae5__Business_Unit__c
et4ae5__Campaign_Member_Configuration__c
et4ae5__Configuration__c
et4ae5__Email_Linkage__c
et4ae5__IndividualEmailResult__c: et4ae5__Contact__c, et4ae5__SendDefinition__c, et4ae5__TriggeredSendDefinition__c, et4ae5__DateSent__c, et4ae5__DateOpened__c, et4ae5__Opened__c, et4ae5__NumberOfUniqueClicks__c, et4ae5__Clicked__c, et4ae5__DateBounced__c, et4ae5__DateUnsubscribed__c
et4ae5__IndividualLink__c
et4ae5__Journey__c
et4ae5__MC_CDC_Journey__c
et4ae5__SendDefinition__c
et4ae5__SendJunction__c
et4ae5__SMSDefinition__c
et4ae5__SMSJunction__c
et4ae5__SupportRequest__c
et4ae5__Triggered_Send_Execution__c
et4ae5__UEBU__c
```
