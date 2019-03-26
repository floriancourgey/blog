---
title: Enable SSH access to Adobe Campaign hosted server
categories: [opensource,adobe campaign]
---

From your windows computer (client), connect to your Adobe Campaign server via SSH to execute maintenance operations and get debugging information.

<p class="text-center">🆔🏜️♨️</p>

<!-- more -->

## Download Putty
From [the Putty archives](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html), download `putty.exe` and `puttygen.exe` to a given folder:

![](/assets/images/2019/03/putty-download.jpg)

## Generate the key pair and copy the public key
Start `puttygen.exe`, keep the default settings to `RSA 2048`, hit `Generate` and move the mouse cursor. Save the public key (filename `id_rsa.pub`) and the private key (filename `id_rsa.ppk`) to the same folder:

![](/assets/images/2019/03/putty-generate-private-public-keys.jpg)

Open the public key `id_rsa.pub` and copy it:
![](/assets/images/2019/03/putty-copy-public-key.jpg)

## Add the public key to Adobe Campaign server
Create a workflow with just one Javascript activity with the following code:
```js
var res = execCommand("cd && mkdir -p .ssh && touch .ssh/authorized_keys", true);
logInfo(res);
var key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQA+really+long+string myUser@myMachine";
var cmd = "echo '"+key+"' >> .ssh/authorized_keys";
var res = execCommand("cd && "+cmd, true);
logInfo(res);
```

![](/assets/images/2019/03/putty-public-key-to-adobe-campaign.jpg)

## Connect via SFTP
That's it! You can now connect by SFTP to your ACC server:

- Host: `mkt-stage1.campaign.adobe.com`
- Protocol: `SFTP SSH`
- Logon Type: `Key File`
- User: `neolane`
- Key File: `~/.ssh/id_rsa`

![](/assets/images/2019/02/adobe-campaign-sftp-ssh-filezilla.jpg)

## Appendixes: Connect via SSH

```console
$ ssh neolane@mkt-stage1.campaign.adobe.com
NOTICE TO USERS
This system is the property of Adobe. It is for AUTHORIZED Adobe business use only.
LOG OFF IMMEDIATELY if you do not agree to the conditions stated in this warning.
The programs included with the Debian GNU/Linux system are free software;
Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
No mail.
Ignoring ulimit -c 1000000 - forcing unlimited
[neolane@mkt-stage1-1:~]$ id
uid=1004(neolane) gid=1005(neolane) groups=1005(neolane),33(www-data)
[neolane@mkt-stage1-1:~]$ ls
nl6  NLProxy  packages  witness  zerocrash
[neolane@mkt-stage1-1:~]$ nlserver pdump
13:31:32 >   Application server for Adobe Campaign v7 (7.0 build XXXX) of XX/XX/20XX
syslogd@default (530) - 20.9 MB
trackinglogd@default (3004) - 51.4 MB
wfserver@instance1_mkt_stage1 (3005) - 49.5 MB
stat@instance1_mkt_stage1 (3006) - 49.1 MB
inMail@instance1_mkt_stage1 (3007) - 50.8 MB
web@default (3432) - 682.6 MB
mta@instance1_mkt_stage1 (20500) - 57.3 MB
watchdog (25708) - 8.0 MB
```
