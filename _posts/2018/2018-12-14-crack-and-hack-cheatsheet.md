---
title: Crack & Hack cheatsheet
categories: [opensource,linux,server,network,unix,crack,hack]
---

Cheatsheet for various unix tools such as metasploit framework, enumeration, nmap, radare2 and volatility.

<!--more-->

## Introduction

<style>#introduction:before{content: "";counter-increment: h2 -1}</style>

1. [Metasploit Framework](#metasploit)
1. [Network scanning with nmap](#nmap)
1. [SQL injection with sqlmap](#sqlmap)
1. [Reverse engineering with radare2](#radare2)
1. [Memdump forensics with volatility](#volatility)
1. [Google Dork Hacking](#google)
1. [Wordlist & dictionnaries](#dictionnaries)
1. [Unix server enumeration](#enumeration)

You can also check out the [awesome list for CTFs (github.com/apsdehal/awesome-ctf)](https://github.com/apsdehal/awesome-ctf#readme) and the [awesome list for Security (github.com/sindresorhus/awesome)](https://github.com/sindresorhus/awesome#security).

## Local

```bash
$ file file1 # magic numbers
$ strings file2 | more
$ xxd file3 | more # enhanced version of hexdump
$ binwalk file4
DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
```

## Online

- [CyberChef](https://gchq.github.io/CyberChef/) for `base64` `url decode` `reverse` `string length` `parse ip`...
- [MxToolbox](https://mxtoolbox.com/) for `DNS` `CNAME` `WhoIs` `DKIM` `SPF` `MX`...

## Server enumeration
```bash
$ id # current user info
uid=1004(user-name) gid=1005(main-group-name) groups=1005(main-group-name),33(www-data),998(other-group)
$ cat /etc/issue # distrib generic name, common on all distrib
Debian GNU/Linux 8
$ cat /etc/*-release # distrib details, name may vary, hence *
VERSION_ID="8"
NAME="Debian GNU/Linux"
PRETTY_NAME="Debian GNU/Linux 8 (jessie)"
$ uname -a # Linux kernel info 32/64 bits
Linux hostname 3.16.0-4-amd64 \#1 SMP Debian 3.16.7-ckt25-1 (2016-03-06) x86_64 GNU/Linux
```

*Source: https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/*

## Stega
- [PhotoPea](https://www.photopea.com/) for `treshold` `level`

## Metasploit

Links:
- [New doc](https://docs.metasploit.com/)
- [Old github doc](https://github.com/rapid7/metasploit-framework/wiki/Nightly-Installers)
- [https://www.exploit-db.com/](https://www.exploit-db.com/)

```console
$ /opt/metasploit-framework/bin/msfconsole
$ msf6> search mysql # search MySQL exploits
Matching Modules
================
   #   Name                                                  Disclosure Date  Rank       Check  Description
   -   ----                                                  ---------------  ----       -----  -----------
   10  auxiliary/scanner/mysql/mysql_login                                    normal     No     MySQL Login Utility
$ msf6> use auxiliary/scanner/mysql/mysql_login # use exploit, alias: use 10
$ msf6 auxiliary(scanner/mysql/mysql_login)> info # get quick exploit overview
Name: MySQL Login Utility
     Module: auxiliary/scanner/mysql/mysql_login
    License: Metasploit Framework License (BSD)
       Rank: Normal
Basic options:
  Name              Current Setting  Required  Description
  ----              ---------------  --------  -----------
  BLANK_PASSWORDS   true             no        Try blank passwords for all users
$ msf6 auxiliary(scanner/mysql/mysql_login)> show options # show only options, alias: options
$ msf6 auxiliary(scanner/mysql/mysql_login)> show actions # show only actions
$ msf6 auxiliary(scanner/mysql/mysql_login)> set STOP_ON_SUCCESS true # set action only for this exploit
$ msf6 auxiliary(scanner/mysql/mysql_login)> setg USERNAME root # set action globally for all exploits
$ msf6 auxiliary(scanner/mysql/mysql_login)> setg THREADS 20 # set multiple threads to run faster
$ msf6 auxiliary(scanner/mysql/mysql_login)> run # run exploit
```

## nmap

Most common port can be found in any Unix distribution in `/etc/services`:
```bash
$ less /etc/services
tcpmux 1/tcp
echo 7/udp
discard 9/udp sink null
systat 11/tcp users
daytime 13/udp
netstat 15/tcp
```

> This is to be used by programs by calling standard C APIs

### Install
```bash
$ sudo apt-get install nmap # linux
$ # for Mac
PS> curl https://nmap.org/dist/nmap-7.70-win32.zip ; expand-archive -path .\nmap-7.70-win32.zip -destinationpath . # for Windows with PowerShell
# You should also install Npcap (https://nmap.org/npcap/#download)
```

> `nmap` will install an updated version of `/etc/services` in `/usr/share/nmap/nmap-services`.

### Usage
```bash
# {hostname} can be scanme.nmap.org, microsoft.com/24, 192.168.0.1; 10.0.0-255.1-254
$ nmap {hostname} # basic nmap shows IP, if host is up and scan 1000 most common ports
Nmap scan report for scanme.nmap.org (45.33.32.156). Host is up (0.078s latency).
Not shown: 996 closed ports
PORT      STATE SERVICE
22/tcp    open  ssh
80/tcp    open  http
9929/tcp  open  nping-echo
31337/tcp open  Elite
$ nmap {h} -O # adding OS detection
Device type: general purpose
Running: Linux 3.X|4.X
OS CPE: cpe:/o:linux:linux_kernel:3 cpe:/o:linux:linux_kernel:4
OS details: Linux 3.2 - 4.9
Network Distance: 20 hops
$ nmap {h} -p 40000-45000 # scan from ports 40000 to 45000
```

### References

- https://www.digitalocean.com/community/tutorials/how-to-use-nmap-to-scan-for-open-ports-on-your-vps

## sqlmap

### Install
Requires Python 2.*
```bash
$ git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
$ cd sqlmap-dev
$ python2 ./sqlmap.py --auth-cred="natas17:8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw" --auth-type=BASIC -u "http://natas17.natas.labs.overthewire.org/index.php?username=natas17" --level 3 --dbms="MySQL 5.5" -p username --technique T -D natas17 -T users -C username,password --dump
```

### Usage
Find an injectable GET/POST param, such as `?user=love`.
```bash
$ sqlmap -x "url.com/sitemap.xml" # sitemap
$ sqlmap -d "mysql://admin:admin@192.168.21.17:3306/testdb" # SQL connection string for direct access
$ sqlmap -u "url.com?user=love" -p user # url with param
$ sqlmap -u "url.com?user=love" --auth-type=BASIC --auth-cred="clear_user:clear_pwd" # basic auth
$ sqlmap -u "url.com?user=love" --dbms="MySQL 5.5" # set the DNMS to MySQL to test only against it
$ sqlmap -u "url.com?user=love" -p user --level 3 --dbs # find databases
available databases [2]:
[*] information_schema
[*] pentest_me
$ sqlmap -u "url.com?user=love" -p user --level 3 -D pentest_me --tables # find tables
Database: pentest_me
[1 table]
+--------+
| table1 |
+--------+
$ sqlmap -u "url.com?user=love" -p user --level 3 -D pentest_me -T table1 --columns # find columns
Database: pentest_me
Table: table1
[2 columns]
+----------+-------------+
| Column   | Type        |
+----------+-------------+
| col1     | varchar(64) |
| col2     | varchar(12) |
+----------+-------------+
$ sqlmap -u "url.com?user=love" -p user --level 3 -D pentest_me -T table1 -C "col1,col2" --dump # dump rows
Database: pentest_me
Table: table1
[3 entries]
+----------+----------------------------------+
| col1     | col2                             |
+----------+----------------------------------+
| user1    | 0xjsNNjGvHkb7pwgC6PrAyLNT0pYCqHd |
| user2    | MeYdu6MbjewqcokG0kD4LrSsUZtfxOQ2 |
| user3    | VOFWy9nHX9WUMo9Ei9WVKh8xLP1mrHKD |
+----------+----------------------------------+
```

Reference
- https://github.com/sqlmapproject/sqlmap/wiki/Usage
- https://github.com/sqlmapproject/sqlmap/wiki/Presentations

## radare2
Useful links
- Radare book [https://radare.gitbooks.io/radare2book/content/](https://radare.gitbooks.io/radare2book/content/)
- Crackme tutos [https://dustri.org/b/defeating-ioli-with-radare2.html](https://dustri.org/b/defeating-ioli-with-radare2.html)

### Basics
```bash
$ radare2 my_executable.exe # for Windows
$ r2 my_bin # for UNIX
[0x00401220]> # r2 opens a shell-like
[0x00401220]> i # file info
  file     ~\my_bin
  format   pe
  iorw     false
  mode     r-x
  size     0x3c94
  humansz  15.1K
  type     EXEC (Executable file)
  arch     x86
  binsz    15508
  bintype  pe
  bits     32
[0x00401220]> ? 0x636261 # debug string in various formats
  hex     0x636261
  octal   030661141
  int32   6513249
  string  "abc"
  binary  0b011000110110001001100001
  fvalue: 6513249.0
[0x00401220]> ls | grep 'test' # for Unix
[0x00401220]> ls ~ 'test' # built-in platform-independant grep ~ (can be used on Windows)
[0x00401220]> !uname -a && ./my_bin # execute any binary with the prefix "!"
```

### Search and display
```bash
[0x00000010]> s # print current address
0x10
[0x00000020]> s 0x20 # go to address 0x20
[0x00000020]> pd 20 # print next 20 disassembly lines
[0x00000020]> iz # print all strings
000 0x0000100b 0x0040300b  29  30 (.rdata) ascii This is the first string\n
001 0x0000102c 0x0040302c 119 120 (.rdata) ascii This is another string!!\n
```

### Analyze
`pdf` print disassemble function
```bash
[0x00001573]> pdf @ main
|           ;-- _main:
/ (fcn) main 193
|   main (int arg_8h, int arg_ch);
|           ; var int local_1ch @ ebp-0x1c
```

## volatility

### Install:
```bash
$ wget http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_mac64_standalone.zip<br/>
$ unzip volatility_2.6_mac64_standalone.zip
$ cp volatility_2.6_mac64_standalone/volatility_2.6_mac64_standalone /usr/local/bin
$ ln -s /usr/local/bin/volatility_2.6_mac64_standalone  /usr/local/bin/volatility
$ volatility -h
```


### Usage:
```bash
$ volatility -f file.raw imageinfo # Image info
$ volatility -f file.raw --profile=Win7SP1x86 pslist # Process list
$ volatility -f file.raw --profile=Win7SP1x86 pstree # Process list as a tree
$ [...] psscan # Hidden process list
$ envars # env vars
$ cmdscan # Command through console shell cmd.exe
$ filescan # File search
$ dumpfiles -D output/ -Q 0x000000003f22a930 # Dump file at memory address
$ printkey -K 'RealVNC\\vncserver' # Print Reg Key example 1
$ printkey -K 'Policy\\Secrets\\DefaultPassword' # Print Reg Key example 2
$ lsadump # LSA dump
$ screenshot -D output/ # Screenshot desktops
$ clipboard # Clipboard content
```
[Command reference on github.com/volatilityfoundation/volatility](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference)

## Google
### Google operators
Operator|Purpose|Mixes with Other Operators?|Can be used Alone?
-|-|-|-
intitle|Search page Title|yes|yes
allintitle|Search page title|no|yes
inurl|Search URL|yes|yes
allinurl|Search URL|no|yes|yes
filetype|specific files|yes|yes
intext|Search text of page only|yes|yes
allintext|Search text of page only|really|yes
site|Search specific site|yes|yes

### Any software
```bash
intitle:"index of /ftp" # directory listing
"index of" "database.sql.zip" # directory listing containing a SQL dump
filetype:log inurl password login # a log file containing words "password" and "login"
inurl:"ViewerFrame?Mode=" # publicly available camera
filetype:env intext:"password" -git -svn -supportforums # search for a .env file containing "password"
filetype:sql intext:password | pass | passwd intext:username intext:INSERT INTO `users` VALUES # Generic SQL user/pass
```

### Targeted softwares
```bash
filetype:log intext:SQLSTATE[HY000] [1045] Access denied for user intext:using password: YES intext:Stack trace # PHP PDO db password
intitle:'index of' "error_log" # Apache error_log dir
intitle:'index of' "access_log" # Apache access_log dir
intitle:"Index of /logs/" "lighttpd" # lighttpd log dir 
inurl:robots.txt intext:Disallow: /web.config # Drupal detection based on robots.txt
filetype:txt inurl:robots.txt intext:generated by PrestaShop # Prestashop detection
intext:"define('DB_PASSWORD'," ext:txt # WordPress PHP constants via txt file
filetype:env intext:"DB_PASSWORD" -github # WordPress PHP constants via .env file
inurl:/wp-content/uploads/wp-backup-plus/ # WordPress Backup plus extension
inurl:configuration.php and intext:"var $password=" # joomla config file
inurl:webman/index.cgi # Synology NAS
inurl:administrators.pwd # FrontPage admin credentials
intitle:"Swagger UI - " + "Show/Hide" # Swagger UI
inurl:"build.xml" intext:"tomcat.manager.password" # Tomcat Manager
intext:"PuTTY log" ext:log "password" -github # PuTTy log, not on Github
intitle:"index of" docker-compose.yml -git -support # Docker
```

Reference:
- https://www.exploit-db.com/google-hacking-database
- https://en.wikipedia.org/wiki/Google_hacking

## Dictionnaries
- [https://github.com/fuzzdb-project/fuzzdb/tree/master/wordlists-user-passwd](https://github.com/fuzzdb-project/fuzzdb/tree/master/wordlists-user-passwd)
- [https://www.gutenberg.org/wiki/FR_Litt%C3%A9rature_(Genre)](https://www.gutenberg.org/wiki/FR_Litt%C3%A9rature_(Genre))
