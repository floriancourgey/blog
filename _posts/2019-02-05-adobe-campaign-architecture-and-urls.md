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

## Application server
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
