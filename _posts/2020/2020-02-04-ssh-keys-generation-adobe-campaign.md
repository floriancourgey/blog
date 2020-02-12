---
title: Generate and use SSH key pair (private & public) on Adobe Campaign
categories: [ssh,opensource,adobe campaign]
---

In order to connect to external SFTP, you might need a couple of private & public keys, instead of the less secure login+password alternative.
Here's how to create a new pair, without interaction 

<p class="text-center">🐍👑🌍</p>

<!--more-->

## Prerequisites
- UNIX basics (ls, cat, cd, ~)
- An SSH key is a text file, it can be read by any text editor
- There are 2 keys : a public one and a private one. So there are 2 files. It is a pair.
- A private key MUST NOT be shared by any mean. It is not meant to be shared.
- Only the public key has to be shared and can be shared via a non-encrypted way (i.e. via email)
- This method generates the key pair via the standard unix utility `ssh-keygen`, [ssh-keygen doc on wikipedia](https://en.wikipedia.org/wiki/Ssh-keygen)

## Workflow

```javascript
loadLibrary('fco:helpers');

var filename = '~/.ssh/id_rsa';

var cmd = 'ssh-keygen -t rsa -f '+filename+' -q -P ""';
//exec(cmd);
exec('ls '+filename+'*');
exec('cat '+filename+'.pub');
```

Leave l. 6 uncommented first, to check the existence of an already created key pair.

Uncomment to generate.

Log result:
```console
fco:helpers | executing | ls ~/.ssh/id_rsa*
/usr/local/neolane/.ssh/id_rsa
/usr/local/neolane/.ssh/id_rsa.old
/usr/local/neolane/.ssh/id_rsa.pub
/usr/local/neolane/.ssh/id_rsa.pub.old
fco:helpers | executing | cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFwPsIUf7FBgT0Bsh[...] root@instance-prod1
```

The public key is the last line, from "ssh-rsa" to "root@instance-prod1" (included).

## Usage with the standard File Export SFTP activity

Create an external account of type SFTP, with a server (hostname), a port (default to 22) and an account (username). The password is **empty**, because the identification method is going to use the SSH key pair.

The SFTP activity is configured to display the SFTP session logs to help troubleshooting.

![](/assets/images/2020/adobe-campaign-sftp-ssh-keys-connction.jpg)

Note: the SFTP activity uses `~/.ssh/id_dsa` instead of `~/.ssh/id_rsa`:
![](/assets/images/2020/adobe-campaign-sftp-ssh-keys-activity.jpg)

Note 2: the green area shows that the IP+port are reachable. It means that:
- The IP exists (public IP)
- The port is open and accept connections
- The firewall installed on this server has accepted us (may be via IP whitelisting)
