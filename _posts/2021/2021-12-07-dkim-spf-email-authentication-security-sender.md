---
title: Email Authentication with SPF and DKIM configuration
categories: [authentication,email,salesforce]
---

<p class="text-center">🐍👑🌍</p>

<!--more-->

## DKIM & SPF Definition

DKIM & SPF keys are an Email Authentication method used between servers to approve the Sender's Identity and prevent phishing & spam. 

When server1.com sends an email from server1.com to server2.com, server2 will check if server1.com keys match based on DNS records, registered as TXT entries:
- For SPF, on server1.com
- For DKIM, on selector._domainkey.server1.com

To debug the keys configuration, use an online tool such as https://www.mail-tester.com/spf-dkim-check or from the console:

### SPF debug

```console
$ dig server1.com txt

```

### DKIM debug
```console
$ dig selector._domainkey.server1.com
```

## On Salesforce


