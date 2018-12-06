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
```powershell
select-string *.csv -pattern ",2018$"
```

Display occurences of "{a word},{some digits}" in all CSV files in a folder and its subfolders (recursive version)
```powershell
select-string -rec *.csv -pattern "\w+,\d+"
```

## Count occurences

Template to count occurences
```powershell
(get-content my_file | select-string -pattern "my string").length
```

Count the number of functions in a PHP Class file
```powershell
(get-content MyClass.php | select-string -pattern " function ").length
```

Count the number of function is all Java files in the actual folder
```powershell
(get-content *.php | select-string -pattern " function ").length
```
