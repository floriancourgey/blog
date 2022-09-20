---
title: Adobe Campaign Architecture and URLs
categories: [opensource,adobe campaign]
---

<p class="text-center">☕🖥️🌐</p>

<!--more-->

## Check `neolane` user home

```console
$ cat /etc/passwd | grep neolane
neolane:x:1001:1001::/usr/local/neolane:/bin/bash
```

Here, and through this tutorial, we'll assume that Adobe Campaign is installed in `/usr/local/neolane/nl6/` (referrred to as `/`).

## Application server on port 8080 (Tomcat Java EE) or HTTP Server on port 80/443 (Apache)
By default AC7 runs uses Tomcat on port 8080. However, for security reasons, it might be coupled to Apache (See [INS_Installing_Campaign_in_Linux__Integration_into_a_Web_server](https://docs.campaign.adobe.com/doc/AC/en/INS_Installing_Campaign_in_Linux__Integration_into_a_Web_server.html))
- Tomcat config file `/tomcat-7/conf/server.xml`
- Apache confing file `/tomcat-7/conf/apache_neolane.conf`

```console
/usr/local/neolane/nl6/
  /bin,conf,customers,datakit,deprecated,examples,java,lang,migration,rsetup,tomcat-7,web,zoneinfo
  /logs
    catalina.YYYY-MM-DD.log
  /var # default directory for workflow activities
    /res
      /<instanceName>
        
    /<instanceName>
      /billing
      /export
      /incoming
      /log
        inMail.log
        mta.log
        runwf.log
        stat.log
        wfserver.log
      /mta
      /postupgrade
      /redir
      /upload
      /workflow
        wf-<internalName>
          httpTransfer
            xxx.xml
      logins.log
```

Both files use the same config:

Desc | URL | Local path
--- | --- | ---
Client exposition | `/nl` | `/web`
Datakit images | `/crm/img` | `/datakit/crm/eng/img`
. | `/ncm/img` | `/datakit/ncm/eng/img`
. | `/nl/img` | `/datakit/nl/eng/img`
. | `/nms/img` | `/datakit/nms/eng/img`
. | `/xtk/img` | `/datakit/xtk/eng/img`
Datakit XSL | `/nms/xsl` | `/datakit/nms/eng/xsl`
. | `/xtk/xsl` | `/datakit/xtk/eng/xsl`
JSP exposition | `/nl/jsp` | `/datakit/nl/eng/jsp`
. | `/nms/jsp` | `/datakit/nms/eng/jsp`
. | `/xtk/jsp` | `/datakit/xtk/eng/jsp`
Legacy v6.0 js/css | `/xtk` | `/deprecated/xtk`
. | `/nms` | `/deprecated/nms`
. | `/crm` | `/deprecated/crm`
Empty path for `web.xml` | ` ` | `/web`
Other | `/cus` | `../customers`
. | `/res` | `/var/res`
. | `/examples` | `/examples`

Application server `https://myserver-mkt-prod1.campaign.adobe.com` (HTTPS) or `http://t.my-customserver.com` (HTTP):
- `/r/test` -> test page, returns XML, @see https://docs.campaign.adobe.com/doc/AC/en/PRO_Production_procedures_Monitoring_processes.html#Automatic_monitoring
- `/view/home` -> homepage
- `/nl/` -> `/usr/local/neolane/nl6/web/`
- `/nl/webForms/defaultWebApp.css` -> `/usr/local/neolane/nl6/web/webforms/defaultWebApp.css`
- `/webApp/{webApp-internalName` -> web apps
- `/{jssp-namespace}/{jssp-name}.jssp` -> JSSP pages
- `/nl/jsp/logon.jsp` -> Logon page, redirects to Client install/download page
- `/nl/jsp/install.jsp` -> Client install/download page

## Resources
CDN Ressources server `http://res.my-customserver.com`:
- `/r/test` -> test page
- `/res/instance_name/` -> Public resource files
