---
title: UNIX cheatsheet
author: Florian Courgey
layout: post
categories:
  - opensource
  - bash
  - shell
  - unix
---
Cheatsheet with filesystem, commands and common utilities for UNIX based systems (Linux, Mac).
<!--more-->

## UNIX filesystem
```bash
/bin # essential user binaries
  bash, cat, cp, grep, ls, nano, touch, tar, uname
/dev # devices
  null # to redirect unwanted stdout
/etc # config files (text based, so easily editable)
  crontab, hosts, init.d, passwd, timezone
/home # home folders for users
/lib # shared C libraries
/mnt # "mounted" drives
/opt # other softwares. Not binaries as there's 1 folder per software (with config, bin, lib, etc). Like Program Files on Windows.
/root # home folder for user "root"
/sbin # "system binaries"
  fdisk, fsck, init, reboot
/tmp # temp folder, gets emptied at reboot
/usr # "users",
  bin/ games/ lib/ local/ sbin/
/var # "variable", folder for files that change often
  log/ mail/ www/
```
See [wikipedia Unix_filesystem](https://en.wikipedia.org/wiki/Unix_filesystem)

## Evolution UNIX and UNIX-like systems
<div class="">
  <a href="https://upload.wikimedia.org/wikipedia/commons/7/77/Unix_history-simple.svg" target="_blank">
    <img src="https://upload.wikimedia.org/wikipedia/commons/7/77/Unix_history-simple.svg" style="max-height:150px" class="no-lightgallery"/>
  </a>
</div>

## Linux distributions timeline hierarchy (SVG)
<div class="">
  <a href="https://upload.wikimedia.org/wikipedia/commons/1/1b/Linux_Distribution_Timeline.svg" target="_blank">
    <img src="https://upload.wikimedia.org/wikipedia/commons/1/1b/Linux_Distribution_Timeline.svg" style="max-height:150px" class="no-lightgallery"/>
  </a>
</div>

## Bash basics

```bash
id # Identification, displays current user (and uid), main group (and guid) and other groups (with guid)
who -H # Who is logged in, with h=column Headers
pwd # Print Working Dir
ls -alh # list a=All (even hidden .) as a l=List in a h=Human-readable format
ls -ld /usr/{,local/}{bin,sbin,lib} # ls only dir with Shell Expansion
mkdir {2019..2021}-0{1..9} {2019..2021}-{10..12} # Shell expansion with numbers
mktemp # create a file and print its name, relative to $TMPDIR if set, else /tmp
mktemp -d # create a directory
printenv | less # print env vars
ls -l $(which python) # command substitution with $(cmd-here)
```
[man id](https://linux.die.net/man/1/id), [man who](https://linux.die.net/man/1/who), [man ls](https://linux.die.net/man/1/ls)

```bash
echo -e "hello\n$(cat file)" > file # prepend to file
echo "hello" >> file # append to file
wget https://myfile.com -O output # save a web file to disk
```
[man echo](https://linux.die.net/man/1/echo), [man wget](https://linux.die.net/man/1/wget)

```bash
ls -l > file # stdout 2 file
ls -l > file # stderr 2 file
ls -l 1>&2 # stdout 2 stderr
ls -l 2>&1 # stderr 2 stdout
ls -l &> file # both stdout and stderr 2 file
ls -l &> /dev/null # totally wipes output (i.e for silent CRON)

echo $? # last return code. 0 is success, 126 is found but not executable, 127 is not found, any non-zero integer is failure
```
[TLDP redirection](http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-3.html), [wiki exit status](https://en.wikipedia.org/wiki/Exit_status)

## UNIX man
The UNIX manual is divised into 10 sections:
- [Section 1](https://linux.die.net/man/1/): user commands
- [Section 2](https://linux.die.net/man/2/): system calls
- [Section 3](https://linux.die.net/man/3/): C library functions
- [Section 4](https://linux.die.net/man/4/): special files
- [Section 5](https://linux.die.net/man/5/): file formats
- [Section 6](https://linux.die.net/man/6/): games
- [Section 7](https://linux.die.net/man/7/): conventions and miscellany
- [Section 8](https://linux.die.net/man/8/): administration and privileged commands
- [Section L](https://linux.die.net/man/l/): math library functions
- [Section N](https://linux.die.net/man/n/): tcl functions

The online version is available on [https://linux.die.net/man/{section id}/{name}](https://linux.die.net/man/). Usually, pages can be accessed with the section number and the name of the tool/function/page. For example, the man page for `strtod(3)` is available online at [https://linux.die.net/man/3/strtod](https://linux.die.net/man/3/strtod).

## CRON

## Debian
Names coming from [Toy story chaaracters](https://www.debian.org/doc/manuals/debian-faq/ch-ftparchives#s-sourceforcodenames)
```bash
Debian 9 # stretch, 2017
Debian 8 # jessie, 2015
Debian 7 # wheezy, 2013
Debian 6.0 # squeeze, 2011
Debian 5.0 # lenny, 2009
Debian 4.0 # etch
Debian 3.1 # sarge
Debian 3.0 # woody
Debian 2.2 # potato
Debian 2.1 # slink
Debian 2.0 # hamm
```

## curl
```bash
curl site.com # protocol defaulted to http
curl site.com/basic-auth --user user1:plainPassword1 # Basic auth
curl ftp://site.com -u FTP_USERNAME:FTP_PASSWORD # list directories and files via FTP
curl ftp://site.com/file -u FTP_USERNAME:FTP_PASSWORD # download file via FTP
curl ftp://site.com/ -T file -u FTP_USERNAME:FTP_PASSWORD # upload file via FTP
curl site.com -I # dump response headers
curl site.com -v # verbose mode to show IP, port, Request and Reponse headers..
curl site.com -H "Referer:a.com" -H "Content-Type:application/json" -H "User-Agent:..." # set headers
curl site.com --raw # raw and undecoded version of the response
curl site.com -s # --silent version, no output
curl site.com -L # --location, follow redirects
curl site.com/form -d "key1=val1&var2=love%20you" # --data POST for form, automatically set the header "Content-type:application/x-www-form-urlencoded"
curl site.com/form --data-urlencode "key1=val1&var2=love you" # automatic url encode
curl google.{fr,com,de} # fetch multiple URLs at once with {syntax}
curl numericals.com/file[1-100].txt # fetch from 1 to 100 with [] syntax
curl numericals.com/file[1-100:10].txt # same with counter step set to 10 => 1, 11, 21...
curl letters.com/file[a-z:2].txt # fetch letters from a to z with step set to 2
```

## grep (find in file and files)

```bash
grep 'word' file1 file2
grep -w 'word_only' file1 file2
grep -r 'word' dir
grep -n file-with-line-numbers
grep -A 1 file # next lines, -B 1 previous lines, -C both lines
grep -e '^[A-C]' file # regex
```

[man grep](https://linux.die.net/man/1/grep)

## Encode & decode
```bash
echo 'I-love-you' | base64 # base64 encode (SS1sb3ZlLXlvdQo=)
echo 'SS1sb3ZlLXlvdQ==' | base64 -d # base64 decode (I-love-you)
```

## GCC Gnu C Compiler

```bash
gcc -v
gcc file1.c file2.c -O bin
gcc -Wall file1.c file2.c -O bin # to print all warnings
```

## PATH & softwares

`/usr/local/bin` to install any bin shared amongst users on the local machine

```bash
bash -c 'echo $PATH'
```
```terminal
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games # for Linux
/usr/local/bin /usr/bin /bin /usr/sbin /sbin # for Mac
```

## Symbolic links - symlinks

```bash
ln -s source target
ln -s ~/my_executable /usr/local/bin/my_executable # to add a binary to PATH
```

## TAR

```bash
tar cvf test.tar .# TAR current dir: c=create, v=verbose, f=file
tar tvf test.tar # list content of TAR file: t=table of content
tar xvf test.tar # unTAR all files: x=xtract
tar xvf test.tar file1 # unTAR specific file
```

## GZIP

ZIP format archives and compresses files and folders. >> Popular on Windows
GZIP format compresses 1 file. To compress multiple files with GZIP, they have to be archived into a single TAR file (called tarball). Hence .tar.gz. >> Popular on UNIX
```bash
gzip file1 # GZIP file1 to file1.gz (and delete file1)
gzip -k file1 # GZIP file1 to file1.gz and keep file1
gzip -r dir # GZIP all files in dir
gzip -d file1 # Decompress GZIP file
```

## ZIP & UNZIP

```bash
zip file.zip file1 file2
unzip file.zip # Unzip in current dir
unzip file.zip -d /target # Unzip in /target dir
unzip -l file.zip # List (display) content of zip
unzip -t file.zip # Test if valid zip
unzip -v file.zip # Display information such as Length, Method, CRC-32...
unzip -j file.zip # Unzip without directory structure (flat)
unzip -P plain_password file.zip # Unzip with plain text password
unzip -q file.zip # Unzip with quietly (no output)
```

[man zip](https://linux.die.net/man/1/zip),
[man unzip](https://linux.die.net/man/1/unzip)

## Programming

### PHP and composer
```bash
php -v # PHP version (5.6, 7.2...)
php -a # REPL interactive shell (exit with exit)
php -c php.ini # use this config file
php -n # use no config file
php -f file # parse and execute file
php -r "echo 'test';" # execute PHP code without tags <? .. ?>
php -i # displays phpinfo() for CLI
php -S localhost:8000 -t web/ app.php # start the PHP built-in web server in the folder web/ with every requests sent to web/app.php on port 8000
composer --version # 1.6
composer require guzzlehttp/guzzle # install the guzzle package, public list on https://packagist.org/
composer install # install deps from composer.lock
composer exec phpunit # execute a bin from vendor/bin/
```

### Python and pip
```bash
python --version # Python version (2.7, 3.2...)
python # REPL interactive shell (exit with exit())
python -c 'import os; print(os.urandom(16))' # execute code
pip install requests # install module requests
```

### Ruby, Gem and Jekyll
```bash
ruby -v # Ruby version (2.2, 2.5...)
gem -v # Gem version (2.7..)
gem install bundler # install the bundler gem, public list on https://rubygems.org/gems
jekyll doctor # checks modules and config
jekyll build # one time build of ./site
jekyll serve # starts local server
```

### NodeJS and npm
```bash
node -v # nodejs version (8.x, 10.x...)
node -e "var a=1" # execute JS code
node -p "var a=1" # execute JS code and print result
node # REPL interactive shell (exit with .exit)
npm -v # 5.x
npm install package-x
```

### Java
```console
java -version
javac -cp . *.java # compile to .class files
java -cp . MyClass # run the MyClass class, based on .class files
javac -classpath classes src/*.java -d classes/ && java -cp classes/ com.namespace.MyApp # one-shot build & run
jar -cf myJar.jar classes/ # create JAR
java -jar MyJar.jar # execute JAR Main-Class defined in MANIFEST.MF
java -cp MyJar.jar com.namespace.ClassWithMainMethod
```
Note: `MyClass` should contain the `main` method:
```java
package fco;
import java.io.File;
public class MyClass {
  public static void main(final String[] args) { System.out.println("Hello World"); }
}
```
