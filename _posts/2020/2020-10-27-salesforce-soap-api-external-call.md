---
title: Salesforce SOAP API for external calls (SOAP UI, Postman..)
categories: [salesforce,opensource]
---

<p class="text-center">🐍👑🌍</p>

<!--more-->

## Login to retrieve `sessionId`

1. Check that API is enabled in Setup > API
1. Download the WSDL with "Generate Enterprise WSDL" > "Generate"
1. Get you login URL in `<soap:address location="https://login.salesforce.com/services/Soap/c/XX/XX"/>`
1. Get you  security token from Profile > Settings > Reset My Security Token. It will be sent via Email.
1. Create a request with the endpoint from Step #3, the headers `Content-Type=text/xml`, `SOAPAction=""` and the following request:

```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:enterprise.soap.sforce.com">
  <soapenv:Header>
  </soapenv:Header>
  <soapenv:Body>
    <urn:login>
      <urn:username>[Your Salesforce Username]</urn:username>
      <urn:password>[Concatenate Salesforce Password and Security Token]</urn:password>
    </urn:login>
  </soapenv:Body>
</soapenv:Envelope>
```

Response:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns="urn:enterprise.soap.sforce.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <soapenv:Body>
        <loginResponse>
            <result>
                <serverUrl>XXX</serverUrl>
                <sessionId>XXX</sessionId>
                <userId>XXX</userId>
                <userInfo>[...]</userInfo>
            </result>
        </loginResponse>
    </soapenv:Body>
</soapenv:Envelope>
```

## SOQL Query

1. Create another request with the endpoint set as the previous `serverUrl`
1. Use below request:

```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:enterprise.soap.sforce.com" xmlns:urn1="urn:sobject.enterprise.soap.sforce.com">
  <soapenv:Header>
    <urn:SessionHeader>
        <urn:sessionId>00D58000000JdSp!AR4AQLojAlVoXccKoNsd9NkpQ_lIjamHTk7b2HM6ZA1Vxmte2E8DcANrPwQt3UQWYhh7PMXUWNRvcX1cg_jR5jJvrI.kTON_</urn:sessionId>
    </urn:SessionHeader>
  </soapenv:Header>
  <soapenv:Body>
    <urn:query>
	    <urn:queryString>
        SELECT Id FROM Contact WHERE Email = 'x@x.x'
      </urn:queryString>
	   </urn:query>
   </soapenv:Body>
</soapenv:Envelope>
```

Response:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns="urn:enterprise.soap.sforce.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sf="urn:sobject.enterprise.soap.sforce.com">
    <soapenv:Header>
        <LimitInfoHeader>
            <limitInfo>
                <current>2643</current>
                <limit>XXXXX</limit>
                <type>API REQUESTS</type>
            </limitInfo>
        </LimitInfoHeader>
    </soapenv:Header>
    <soapenv:Body>
        <queryResponse>
            <result>
                <done>true</done>
                <queryLocator xsi:nil="true"/>
                <records xsi:type="sf:Contact">
                    <sf:Id>XXXXX</sf:Id>
                </records>
                <size>1</size>
            </result>
        </queryResponse>
    </soapenv:Body>
</soapenv:Envelope>
```
