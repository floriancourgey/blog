---
title: Execute arbitrary Javascript via SOAP call using EvaluateJavaScript on ACC 
categories: [adobe campaign]
---

<p class="text-center">🐍👑🌍</p>

<!--more-->

## Request

- `URL`: `https://instance.neolane.net/nl/jsp/soaprouter.jsp`
- `Content-Type`: `application/xml`
- `SOAPAction`: `xtk:builder#EvaluateJavaScript`
- `HTTP body`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tns="urn:xtk:specFile" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
   <soap:Body>
      <EvaluateJavaScript xmlns="urn:xtk:specFile">
         <sessiontoken>login/password</sessiontoken>
         <name/>
         <script>
           loadLibrary("/nl/core/shared/nl.js"); // load lib test
           ctx.@result = 1+2; // add XML attribute
           ctx.hello = "world"; // add XML node
        </script>
         <context>
           <ctx>
           </ctx>
        </context>
      </EvaluateJavaScript>
   </soap:Body>
</soap:Envelope>
```

## Response
```xml
<?xml version='1.0' ?>
<SOAP-ENV:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns="urn:xtk:builder" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
  <SOAP-ENV:Body>
    <EvaluateJavaScriptResponse xmlns="urn:xtk:builder" SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
      <pdomContext xsi:type="ns:Element" SOAP-ENV:encodingStyle="http://xml.apache.org/xml-soap/literalxml">
        <ctxresult="3">
          <hello>world</hello>
        </ctx>
      </pdomContext>
    </EvaluateJavaScriptResponse>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```
