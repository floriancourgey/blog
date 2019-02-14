---
title: Analyze Adobe Campaign SOAP requests with Fiddler
categories: [opensource,adobe campaign,fiddler]
---

The Adobe Console Client communicates with the Adobe Application Server with SOAP calls only. As the SOAP protocol relies on HTTP/HTTPS,
we're able to intercept requests & responses via Fiddler.

<p class="text-center">🔍💻💡</p>

<!--more-->

## Installation
- Get Fiddler from https://www.telerik.com/download/fiddler
- Say your instance URL is `https://mkt-stage1.campaign.adobe.com`
- Create a new Connection named `Fiddler` with the instance URL set to `https://myinstance`
- ![](/assets/images/2019/02/adobe-campaign-connections-for-fiddler.jpg)
- Open Fiddler, got to Rule > Customize Rules, it will open the Fiddler Script Editor
- Look for `static function OnBeforeRequest(oSession: Session){`
- Add the following code, just after the opening curly bracket `{`:
```js
static function OnBeforeRequest(oSession: Session){
  if (oSession.HostnameIs("MYINSTANCE")) {
    oSession.host = "mkt-stage1.campaign.adobe.com:443"; // use 80 for HTTP, 443 for HTTPS or 8080 for Tomcat
  }
  // rest of the code
```
- ![](/assets/images/2019/02/adobe-campaign-fiddler-host-rule.jpg)
- Enable HTTPS in Fiddler in Tools > Fiddler Options > HTTPS > Decrypt HTTPS
- ![](https://helpx.adobe.com/content/dam/help/en/campaign/kb/soap-traffic-fiddler/_jcr_content/main-pars/image_0/DecryptHTTPSTrafficOption.png)

## Usage
Browse to different folders, workflows or schemas from your console, and check Fiddler:

- Example of a `xtk:folder` `LoadChildrenWithPath` SOAP call ([JSAPI for LoadChildrenWithPath](https://docs.campaign.adobe.com/doc/AC/en/jsapi/sm-folder-LoadChildrenWithPath.html)):
- ![](/assets/images/2019/02/adobe-campaign-fiddler-soap-LoadChildrenWithPath.jpg)
- Example of a `xtk:queryDef` `ExecuteQuery` SOAP call ([JSAPI for ExecuteQuery](https://docs.campaign.adobe.com/doc/AC/en/jsapi/sm-queryDef-ExecuteQuery.html)):
- ![](/assets/images/2019/02/adobe-campaign-fiddler-soap-ExecuteQuery.jpg)

## Reference
- https://helpx.adobe.com/uk/campaign/kb/soap-traffic-fiddler.html
