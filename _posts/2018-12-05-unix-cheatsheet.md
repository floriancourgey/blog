---
title: UNIX cheatsheet
author: Florian Courgey
layout: post
categories:
  - prestashop
  - google
  - opensource
  - adobe campaign
---
Excerpt here.
<!--more-->
## 
## Bash basics

<kbd>echo -e "hello\n$(cat file)" > file</kbd> prepend to file

`echo -e "hello\n$(cat file)" > file` prepend to file

<kbd>echo "hello" >> file</kbd> append to file

<kbd>wget https://myfile.com -O output</kbd> save a web file to disk

## grep (find in file and files)

<kbd>grep 'word' file1 file2</kbd>

<kbd>grep -w 'word_only' file1 file2</kbd>

<kbd>grep -r 'word' dir</kbd>

## GCC Gnu C Compiler

<kbd>gcc -v</kbd>

<kbd>gcc file1.c file2.c -O bin</kbd>

<kbd>gcc -Wall file1.c file2.c -O bin</kbd> to print all warnings

## PATH

<kbd>bash -c 'echo $PATH'</kbd>

<samp>/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games</samp> for Linux

<samp>/usr/local/bin /usr/bin /bin /usr/sbin /sbin</samp> for Mac

## Symbolic links - symlinks

<kbd>ln -s source target</kbd>

<kbd>ln -s ~/my_executable /usr/local/bin/my_executable</kbd> to add the binary (in user home) to PATH:

## TAR
<kbd>tar cvf test.tar .</kbd> TAR current dir: <kbd class="none">c</kbd>=create, <kbd class="none">v</kbd>=verbose <kbd class="none">f</kbd>=file

<kbd>tar tvf test.tar</kbd> list content of TAR file: <kbd class="none">t</kbd>=table of content

<kbd>tar xvf test.tar</kbd> unTAR all files: <kbd class="none">x</kbd>=xtract

<kbd>tar xvf test.tar file1</kbd> unTAR specific file
## GZIP
ZIP format archives and compresses files and folders. >> Popular on Windows

GZIP format compresses 1 file. To compress multiple files with GZIP, they have to be archived into a single TAR file (called tarball). Hence .tar.gz. >> Popular on UNIX

<kbd>gzip file1</kbd> GZIP file1 to file1.gz (and delete file1)

<kbd>gzip -k file1</kbd> GZIP file1 to file1.gz and keep file1

<kbd>gzip -r dir</kbd> GZIP all files in dir

<kbd>gzip -d file1</kbd> Decompress GZIP file
## ZIP & UNZIP
<kbd>zip file.zip file1 file2</kbd>

<kbd>unzip file.zip</kbd> Unzip in current dir

<kbd>unzip file.zip -d /target</kbd> Unzip in /target dir

<kbd>unzip -l file.zip</kbd> List (display) content of zip

<kbd>unzip -t file.zip</kbd> Test if valid zip

<kbd>unzip -v file.zip</kbd> Display information such as Length, Method, CRC-32...

<kbd>unzip -j file.zip</kbd> Unzip without directory structure (flat)

<kbd>unzip -P plain_password file.zip</kbd> Unzip with plain text password

<kbd>unzip -q file.zip</kbd> Unzip with quietly (no output)

<a href="https://linux.die.net/man/1/zip">man zip</a>

<a href="https://linux.die.net/man/1/unzip">man unzip</a>
