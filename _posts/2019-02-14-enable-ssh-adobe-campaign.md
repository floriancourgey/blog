---
title: Enable SSH access to Adobe Campaign hosted server
categories: [opensource,adobe campaign]
---

<p class="text-center">🐍👑🌍</p>


## Generate your public key and add it to `~/.ssh/authorized_keys`

Generate your SSH public key locally, it looks like this:
```bash
$ cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQA+really+long+string myUser@myMachine
```

Then create a JS activity with this code:
```js
var res = execCommand("cd && mkdir .ssh && touch .ssh/authorized_keys", true);
logInfo(res);
var key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQA+really+long+string myUser@myMachine";
var cmd = "echo '"+key+"' > .ssh/authorized_keys";
var res = execCommand("cd && "+cmd, true);
logInfo(res);
```

That's it! You can now connect by SSH to your ACC server:
```bash
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
```

