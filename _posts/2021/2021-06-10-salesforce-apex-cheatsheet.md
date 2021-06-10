---
title: Salesforce Apex Cheatsheet
categories: [salesforce,apex]
---
Excerpt here...
<p class="text-center">🐍👑🌍</p>
<!--more-->

## Apex Trigger

```java
trigger FcoCaseTrigger on Case (after update) {
    if(Trigger.Isupdate){
        FcoCaseHelper.process(Trigger.new);
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
