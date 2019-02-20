---
title: Filter Recipient by Email ISP in Adobe Campaign
redirect_from: /2018/07/filter-recipient-by-email-isp-in-adobe-campaign/
categories: [adobe campaign, opensource]
---

Adobe Campaign automatically creates @emailDomain, but it isn't enough if you need to target multiple recipients based on their ISPs: Microsoft gathers Live, Hotmail and Outlook, while Google uses gmail and google*.

<!--more-->

## Objective

Have a filter in your lists and workflows:

![](/assets/images/2018/07/Filter-on-email-ISP.jpg)

And get insights such as Distribution of values!

## Step 1: Create the enumeration

In Administration > Platform > Enumeration > New

![](/assets/images/2018/07/Enumeration-EmailISP.jpg)

## Step 2: Extend the Data schema

Use an extended Recipient data schema (see [https://docs.campaign.adobe.com/doc/AC/en/CFG\_Editing\_schemas\_Extending\_a_schema.html](https://docs.campaign.adobe.com/doc/AC/en/CFG_Editing_schemas_Extending_a_schema.html)) in Administration > Configuration > Data schemas.

```xml
<srcSchema extendedSchema="nms:recipient" name="recipient" namespace="cus">
  <element name="recipient">
    <attribute dbEnum="EmailISP" label="Email ISP" name="emailISP" type="string"
      expr="Case(
              When(MemoContains(@domain, 'yahoo'), 'Yahoo'),
              When(MemoContains(@domain, 'ymail'), 'Yahoo'),
              When(MemoContains(@domain, 'rocketmail'), 'Yahoo'),
              When(MemoContains(@domain, 'outlook'), 'Microsoft'),
              When(MemoContains(@domain, 'live'), 'Microsoft'),
              When(MemoContains(@domain, 'hotmail'), 'Microsoft'),
              When(MemoContains(@domain, 'google'), 'Google'),
              When(MemoContains(@domain, 'gmail'), 'Google'),
              When(MemoContains(@domain, 'facebook'), 'Facebook'),
              When(MemoContains(@domain, 'aol'), 'AOL'),
              When(MemoContains(@domain, 'netscape'), 'AOL'),
              When(MemoContains(@domain, 'aim'), 'AOL'),
              When(MemoContains(@domain, 'orange'), 'Orange'),
              When(MemoContains(@domain, 'wandoo'), 'Orange'),
              When(MemoContains(@domain, 'yandex'), 'Yandex'),
              When(MemoContains(@domain, 'icloud'), 'Apple'),
              When(MemoContains(@domain, 'apple'), 'Apple'),
              Else('Other')
          )"
      />
  </element>
</srcSchema>
```

This will map the following domains to their main email providers:



Email provider | Regex | Example
--- | --- | ---
Yahoo | `yahoo.*`<br>`ymail.*`<br>`rocketmail.*` | yahoo.ca, yahoo.cn, yahoo.co.id, yahoo.co.in, yahoo.com, yahoo.com.ar, yahoo.com.au, yahoo.com.br, yahoo.com.cn, yahoo.com.hk, yahoo.com.mx, yahoo.com.my, yahoo.com.ph, yahoo.com.sg, yahoo.com.tw, yahoo.com.vn, yahoo.co.nz, yahoo.co.uk, yahoo.de, yahoo.dk, yahoo.es, yahoo.fr, yahoo.gr, yahoo.ie, yahoo.in, yahoo.it, yahoo.no, yahoo.se, ymail.com, rocketmail.com
Microsoft | `hotmail.*`<br>`live.*`<br>`outlook.*`<br>`msn.*` | hotmail.be, hotmail.ca, hotmail.ch, hotmail.cl, hotmail.co.jp, hotmail.com, hotmail.com.ar, hotmail.com.au, hotmail.com.br, hotmail.co.nz, hotmail.co.th, hotmail.co.uk, hotmail.de, hotmail.es, hotmail.fr, hotmail.gr, hotmail.it, hotmail.nl, hotmail.no, hotmail.se, live.be, live.ca, live.cl, live.com, live.com.ar, live.com.au, live.com.mx, live.com.pt, live.com.sg, live.co.uk, live.co.za, live.de, live.dk, live.fr, live.ie, live.it, live.nl, live.no, live.se, msn.com, netcabo.pt, outlook.com, outlook.es, outlook.fr, outlook.it
Google | `google*`<br>`gmail.*` | gmail.com, google.com, googlemail.com
                    
## Step 4: Enjoy!                  
Save, disconnect, reconnect and&#8230; Enjoy 🍾

![](/assets/images/2018/07/Get-distribution-of-values-for-email-ISP.jpg)


Source: Based on domains and services providers listed on
- [https://email-verify.my-addr.com/top-email-service-providers.php](https://email-verify.my-addr.com/top-email-service-providers.php)
- [https://en.wikipedia.org/wiki/Comparison_of_webmail_providers](https://en.wikipedia.org/wiki/Comparison_of_webmail_providers)
