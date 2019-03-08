---
title: Enable SSH access to Adobe Campaign hosted server
categories: [opensource,adobe campaign]
---

<p class="text-center">🐍👑🌍</p>


## Generate your public key and add it to `~/.ssh/authorized_keys`

Generate your SSH public key locally, it looks like this:
```console
$ cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQA+really+long+string myUser@myMachine
```

Then create a JS activity with this code:
```js
var res = execCommand("cd && mkdir .ssh && touch .ssh/authorized_keys", true);
logInfo(res);
var key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQA+really+long+string myUser@myMachine";
var cmd = "echo '"+key+"' >> .ssh/authorized_keys";
var res = execCommand("cd && "+cmd, true);
logInfo(res);
```

That's it! You can now connect by SSH to your ACC server:
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
wfserver@freshin_mkt_stage1 (3005) - 49.5 MB
stat@freshin_mkt_stage1 (3006) - 49.1 MB
inMail@freshin_mkt_stage1 (3007) - 50.8 MB
web@default (3432) - 682.6 MB
mta@freshin_mkt_stage1 (20500) - 57.3 MB
watchdog (25708) - 8.0 MB
```

## Appendixes: Connect via SFTP with FileZilla


- Host: `mkt-stage1.campaign.adobe.com`
- Protocol: `SFTP SSH`
- Logon Type: `Key File`
- User: `neolane`
- Key File: `~/.ssh/id_rsa`

![](/assets/images/2019/02/adobe-campaign-sftp-ssh-filezilla.jpg)
