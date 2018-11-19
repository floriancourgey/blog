---
id: 356
title: Count occurences of string in files using PowerShell (grep on Windows)
date: 2018-04-18T20:17:42+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=356
permalink: /2018/04/count-occurences-of-string-regex-in-files-regex-using-powershell/
categories:
  - grep
  - opensource
  - powershell
  - windows
---
## Display occurences

Display occurences of lines ending with &#8220;,2018&#8221; in all CSV of a folder

<pre class="lang:ps decode:true ">select-string *.csv -pattern ",2018$"</pre>

&nbsp;

Display occurences of &#8220;{a word},{some digits}&#8221; in all CSV files in a folder and its subfolders (recursive version)

<pre class="lang:ps decode:true">select-string -rec *.csv -pattern "\w+,\d+"</pre>

## Count occurences

Template to count occurences

<pre class="lang:ps decode:true">(get-content my_file | select-string -pattern "my string").length</pre>

&nbsp;

Count the number of functions in a PHP Class file

<pre class="lang:ps decode:true">(get-content MyClass.php | select-string -pattern " function ").length</pre>

&nbsp;

Count the number of function is all Java files in the actual folder

<pre class="lang:ps decode:true ">(get-content *.php | select-string -pattern " function ").length</pre>

&nbsp;

&nbsp;

&nbsp;