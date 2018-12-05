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
Excerpt here.
<!--more-->

## Bash basics

```bash
echo -e "hello\n$(cat file)" > file # prepend to file
echo "hello" >> file # append to file
wget https://myfile.com -O output # save a web file to disk
```

## grep (find in file and files)

```bash
grep 'word' file1 file2
grep -w 'word_only' file1 file2
grep -r 'word' dir
```

## GCC Gnu C Compiler

```bash
gcc -v
gcc file1.c file2.c -O bin
gcc -Wall file1.c file2.c -O bin # to print all warnings
```

## PATH

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
tar cvf test.tar .# TAR current dir: <kbd class="none">c</kbd>=create, <kbd class="none">v</kbd>=verbose <kbd class="none">f</kbd>=file
tar tvf test.tar # list content of TAR file: <kbd class="none">t</kbd>=table of content
tar xvf test.tar # unTAR all files: <kbd class="none">x</kbd>=xtract
tar xvf test.tar file1 # unTAR specific file
```

## GZIP

```bash
ZIP format archives and compresses files and folders. >> Popular on Windows
GZIP format compresses 1 file. To compress multiple files with GZIP, they have to be archived into a single TAR file (called tarball). Hence .tar.gz. >> Popular on UNIX
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
