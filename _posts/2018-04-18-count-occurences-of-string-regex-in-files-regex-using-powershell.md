---
title: "Powershell grep: Count occurences of string in files using PowerShell (grep on Windows)"
categories: [grep,opensource,powershell,windows]
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
(Get-Content my_file | select-string -pattern "my string").length
(gc my_file | select-string -pattern "my string").length # gc is a Get-Content alias
```

Count the number of functions in a PHP Class file
```powershell
(gc MyClass.php | select-string -pattern " function ").length
```

Count the number of function is all Java files in the actual folder
```powershell
(gc *.php | select-string -pattern " function ").length
```

## Count Lines, Characters & Words
```powershell
gc file.xml | Measure-Object –Line # Count Lines
gc file.xml | Measure-Object –Character # Count Characters
gc file.xml | Measure-Object –Word # Count Words
```

## head & tail
```powershell
gc file.xml -head 10 # first 10 lines (head -n 10)
gc file.xml -tail 10 # last 10 lines (tail -n 10)
gc file.xml -tail 10 -wait # last 10 lines and keep open (tail -f)
[char[]](gc file.xml -Encoding byte -TotalCount 200) # first 200 char (head -c 200)
```
