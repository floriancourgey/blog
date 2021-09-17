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

## HTTP POST to SOAP Adobe Campaign

Recipients broadlogs update

```java
Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://xxx.neolane.net/nl/jsp/soaprouter.jsp');
request.setMethod('POST');
request.setHeader('Content-Type', 'application/xml');
request.setHeader('SOAPAction', 'xtk:persist#WriteCollection');
String body = 
'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:xtk:session">'+
   '<soapenv:Header/>'+
   '<soapenv:Body>'+
      '<urn:WriteCollection>'+
         '<urn:sessiontoken>user_name/pass_word</urn:sessiontoken>'+
         '<urn:domDoc>'+
            '<broadLogRcp-collection xtkschema="nms:broadLogRcp">'+
              '<broadLogRcp id="129106000" status="5" _operation="update" _key="@id" eventDate="2018-12-25 11:05:59"/>'+
              '<broadLogRcp id="129117000" status="4" _operation="update" _key="@id" eventDate="2018-12-25 11:05:59"/>'+
            '</broadLogRcp-collection>'+
         '</urn:domDoc>'+
      '</urn:WriteCollection>'+
   '</soapenv:Body>'+
'</soapenv:Envelope>';
request.setBody(body);
HttpResponse response = http.send(request);
System.debug(response.getBody());
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
