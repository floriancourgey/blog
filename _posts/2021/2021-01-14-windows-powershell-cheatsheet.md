---
title: Windows & PowerShell Cheatsheet
categories: [microsoft,powershell,opensource,cmd,windows]
---

<p class="text-center">🐍👑🌍</p>

<!--more-->

## Windows filesystem
```bash
C: # home drive, shortcut %HomeDrive%
  \PerfLogs
  \Program Data
  \Program Files # x64 (64 bits) softwares
  \Program Files (x86) # x84 (32 bits) softwares
  \Recovery
  \Temp
  \Users
    \Administrator
    \MyUser # user home, shortcut %UserProfile%
      AppData # user data and settings
        Local # user data, shortcut %LocalAppData%
          Temp # user tmp folder, shortcut %TEMP%
        LocalLow
        Roaming # user data network, shortcut %AppData%
    \Public # shared among users of this computer, shortcut %Public%
  \Windows # shortcut %SystemRoot%
    \System
    \System32
    \SysWOW64
```

Source https://en.wikipedia.org/wiki/Directory_structure and https://superuser.com/questions/217504/is-there-a-list-of-windows-special-directories-shortcuts-like-temp

## Windows keyboard shortcut

- `Win+R`: run a command. Folder shortcuts may be used
- `Win+E`: run Explorer
- `Win+D`: go to Desktop
- `Win+L`: Lock session
- `Win+left/up/right/down`: Snap window to left/enlarge/right/minimize
- `Win+<tab>`: Enhanced Alt-tab

## Powershell basics

```powershell
> Get-Location # alias: pwd. Display current location
> Set-Location xxx # alias: cd. Go to location
> Get-ChildItem # alias: ls. List folders and files in current location
> Get-ChildItem $env:USERPROFILE\Desktop | Sort-Object -Property LastWriteTime # list Desktop files, order by last modification time
> Get-ChildItem -Filter "*my_search*" -Recurse -File # find files matching query
> Copy-Item './from_folder' './to_folder' -Recurse # alias: cp. Copy files from source to destination
> Remove-Item -Recurse './folder' # alias: rm. Remove all files and folder from folder
> Remove-Item -Recurse -Force # equivalent: rm -rf.
> New-Item -ItemType Directory -Name 'folder1' # alias: mkdir. Creates directory, with parent if needed
> New-Item -ItemType File -Name "file1" # no alias
> Get-Content .\file1 # alias: cat. Display content of file
> Get-Content -Head 10 .\file1 # equivalent: head file1 -n 10
> Get-Content -Tail 10 .\file1 # equivalent: tail file1 -n 10
```

## Powershell enumeration
```powershell
> query user # equivalent: id
 USERNAME              SESSIONNAME        ID  STATE   IDLE TIME  LOGON TIME
>myUser                console            11  Active      22:19  1/14/2021 9:31 AM

> $Properties = 'Caption', 'CSName', 'Version', 'BuildType', 'OSArchitecture'
> Get-CimInstance Win32_OperatingSystem | Select-Object $Properties
Caption        : Microsoft Windows XX Enterprise
CSName         : AAAAT0XXXXX
Version        : XX.XX.XXX
BuildType      : Multiprocessor Free
OSArchitecture : 64-bit

```
Source https://mathieubuisson.github.io/powershell-linux-bash/, https://stackoverflow.com/questions/39212183/easier-way-to-parse-query-user-in-powershell
