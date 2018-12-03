---
title: HTTP Post for Adobe Campaign SOAP calls
author: Florian Courgey
layout: post
categories:
  - opensource
  - adobe campaign
---
SOAP calls are not really handy when it comes to deploy to external vendors. Luckily, we can use a classic HTTP Post as we would do for a REST API.

<!--more-->

## Example in RESTClient

Use the following settings:
- The soap router as the endpoint `https://your-instance.campaign.adobe.com/nl/jsp/soaprouter.jsp` 
- HTTP Headers:
  - Set `SOAPAction` to the method you're calling, e.g. `xtk:queryDef#ExecuteQuery`.
  - Set `Content-Type` to `application/xml`

```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:xtk:queryDef">
  <soapenv:Header/>
    <soapenv:Body>
      <urn:ExecuteQuery>
      	<urn:sessiontoken>login/password</urn:sessiontoken>
        <urn:entity>
          <queryDef operation="select" schema="nms:recipient">
            <select>
              <node expr="@email"/>
              <node expr="@lastName"/>
              <node expr="@firstName"/>
            </select>
            <where>
              <condition expr="@email = 'someone@example.com'"/>
            </where>
          </queryDef>
        </urn:entity>
      </urn:ExecuteQuery>
  </soapenv:Body>
</soapenv:Envelope>
```

![todo](/assets/images/2018/12/adobe-campaign-soap-calls-with-http-post.jpg)

Gives the following response with `<recipient-collection>`:

```xml
<?xml version='1.0' ?>
<SOAP-ENV:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns="urn:xtk:queryDef" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
  <SOAP-ENV:Body>
    <ExecuteQueryResponse xmlns="urn:xtk:queryDef" SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
      <pdomOutput xsi:type="ns:Element" SOAP-ENV:encodingStyle="http://xml.apache.org/xml-soap/literalxml">
        <recipient-collection>
          <recipientemail="someone@example.com" firstName="..." lastName="..."/>
          <recipientemail="someone@example.com" firstName="..." lastName="..."/>
          <recipientemail="someone@example.com" firstName="..." lastName="..."/>
        </recipient-collection>
      </pdomOutput>
    </ExecuteQueryResponse>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

![todo](/assets/images/2018/12/adobe-campaign-soap-calls-with-http-post-in-rest-client.jpg)
