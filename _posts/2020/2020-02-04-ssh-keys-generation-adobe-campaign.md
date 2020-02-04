---
title: Generate SSH key pair (private & public) on Adobe Campaign
categories: [ssh,opensource,adobe campaign]
---

In order to connect to external (S)FTP, you might need a couple of private & public keys, instead of the less secure login+password alternative.
Here's how to create a new pair, without interaction 

<p class="text-center">🐍👑🌍</p>

<!--more-->

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
