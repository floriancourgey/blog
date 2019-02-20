---
title: Adobe Campaign Architecture and URLs
categories: [prestashop,google,opensource,adobe campaign]
---

<p class="text-center">🐍👑🌍</p>
<!--more-->

## Use h2 for each section

```bash
# cat /etc/passwd | grep neolane
neolane:x:1001:1001::/usr/local/neolane:/bin/bash
```

## Application server (Tomcat Java EE)
Taken from local Tomcat config file `/usr/local/neolane/nl6/tomcat-7/conf/server.xml`

Command | Description
--- | ---
`/nl` | `/usr/local/neolane/nl6/web`

```bash
# client exposition
"/nl" -> "../web"
# datakit images exposition
"/crm/img" -> "../datakit/crm/eng/img"
"/ncm/img" -> "../datakit/ncm/eng/img"
"/nl/img" -> "../datakit/nl/eng/img"
"/nms/img" -> "../datakit/nms/eng/img"
"/xtk/img" -> "../datakit/xtk/eng/img"
# ## tmp fix for report images (otherwise the mapping /report/* redirects these images)
"/xtk/img/report" -> "../datakit/xtk/eng/img/report"
# datakit xsl exposition
"/nms/xsl" -> "../datakit/nms/eng/xsl"
"/xtk/xsl" -> "../datakit/xtk/eng/xsl"
# JSP exposition
"/nl/jsp" -> "../datakit/nl/eng/jsp"     allowCasualMultipartParsing="true"
"/nms/jsp" -> "../datakit/nms/eng/jsp"
"/xtk/jsp" -> "../datakit/xtk/eng/jsp"
# Legacy v6.0 js/css
"/xtk" -> "../deprecated/xtk"
"/nms" -> "../deprecated/nms"
"/crm" -> "../deprecated/crm"
# The empty path is necessary for other mappings in web.xml to be taken into account
"" -> "../web"
"/cus" -> "../customers"
"/res" -> "../var/res"
"/examples" -> "../examples"
```
Application server `https://myserver-mkt-prod1.campaign.adobe.com` (HTTPS) or `http://t.my-customserver.com` (HTTP):
- `/r/test` -> test page, returns XML, @see https://docs.campaign.adobe.com/doc/AC/en/PRO_Production_procedures_Monitoring_processes.html#Automatic_monitoring
- `/view/home` -> homepage
- `/nl/` -> `/usr/local/neolane/nl6/web/`
- `/nl/webForms/defaultWebApp.css` -> `/usr/local/neolane/nl6/web/webforms/defaultWebApp.css`
- `/webApp/{webApp-internalName` -> web apps
- `/{jssp-namespace}/{jssp-name}.jssp` -> JSSP pages

## Resources
CDN Ressources server `http://res.my-customserver.com`:
- `/r/test` -> test page
- `/res/instance_name/` -> Public resource files
