---
title: Salesforce Apex Cheatsheet
categories: [salesforce,apex]
---
Excerpt here...
<p class="text-center">🐍👑🌍</p>
<!--more-->

## Apex Trigger

```java
trigger FcoCaseTrigger on Case (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    if(Trigger.Isupdate){
        FcoCaseHelper.process(Trigger.new);
    }
}

@isTest
public with sharing class FcoCaseTriggerTest {
    @isTest private static void test() {
    	Case c = new Case(Name='TestCase');
	insert c;
	List<Case> createdCases = [Select Id from Case where Name != ''];
        System.assertEquals(true, createdCases.size() >= size);
    }
}
```

## HTTP GET Callout

Make sure to whitelist the external URL in Setup>Security>`Remote Site Settings`.

```java
Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://jsonplaceholder.typicode.com/users');
request.setMethod('GET');
HttpResponse response = http.send(request);
List<Object> records = (List<Object>) JSON.deserializeUntyped(response.getBody());
for (Object record: records) {
  Map<String, Object> mapped = (Map<String, Object>)record;
  String sku = (String)mapped.get('id');
}

@isTest
global class FcoCalloutMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('[{"id": 1}]');
        response.setStatusCode(200);
        return response; 
    }
}
```

## Schedule Apex Job

Find jobs in Setup>Environments>Jobs>`Scheduled Jobs`.

```java
global class FcoSchedule implements Schedulable {
	global void execute(SchedulableContext ctx) {
        // process
    }
}

// Then in anonymous window:
FcoSchedule x = new FcoSchedule();
// Seconds Minutes Hours Day_of_month Month Day_of_week Year
String CRON_EXP = '0 0 1 * * ? *'; // https://www.freeformatter.com/cron-expression-generator-quartz.html
String jobId = System.schedule('JobName', CRON_EXP, x);
System.debug(jobId);
```

Stop job from `Scheduled Jobs`>Delete or:
```java
System.abortJob(jobId);
```
