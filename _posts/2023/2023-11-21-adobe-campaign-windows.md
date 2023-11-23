---
title: Install Adobe Campaign locally on Windows
categories: [opensource,adobe campaign]
---

# Summary

- Install `Java JDK 11`
- Install `PostgreSQL 14`
- Install `Adobe Campaign Classic Server v7`
- Install `Adobe Campaign Classic Console v7`
- Run the server `localhost`
- Create the instance `instance1`

From the [Adobe Campaign compatibility matrix](https://experienceleague.adobe.com/docs/campaign-classic/using/release-notes/compatibility-matrix.html?lang=en#Tools)

# Prerequisites

- Administrator rights (for Java JDK, PostgreSQL and Adobe Campaign Classic server)

# Installations

### Install Java JDK 11

- [https://experience.adobe.com/#/downloads/content/software-distribution/en/general.html](https://experience.adobe.com/#/downloads/content/software-distribution/en/general.html)
  - Oracle JDK 11.0.21 - Windows-x64 Installer
    - `jdk-11.0.21_windows-x64_bin.exe` (141 MB)

Install, then add to user `PATH` "Edit environment variables for your account":

`C:\Program Files\Java\jdk-11\bin`

### Install PostgreSQL 14

- [https://www.enterprisedb.com/downloads/postgres-postgresql-downloads](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)
  - Windows x86-64
    - `postgresql-14.10-1-windows-x64.exe` (347 MB)

Install, then add to user `PATH` "Edit environment variables for your account":

`C:\Program Files\PostgreSQL\14\bin`

### Install Adobe Campaign Classic Server v7

- https://experience.adobe.com/#/downloads/content/software-distribution/en/campaign.html
  - 7.3.4 - build 9364 - Windows - GENERAL AVAILABILITY
    - `7.0.9364.zip` (91 MB)

Unzip, then run `7.0.9364\setup.exe`.

Add to user `PATH` "Edit environment variables for your account":

`C:\Program Files\Adobe\Adobe Campaign Classic v7\bin`

### Install Adobe Campaign Classic Console

Run `7.0.9364\setup-client-7.0.9364.exe`

### Check installation

```powershell
PS C:\Users\fco> javac -version
javac 11.0.21
PS C:\Users\fco> pg_config --version
PostgreSQL 14.10
PS C:\Users\fco> nlserver pdump
15:16:55 >   Application server for Adobe Campaign Classic (7.3.4 build 9364@8f3ef8e of 09/04/2023)
```

# Run the server
PS as admin
- start web
- internal
- /nlserver.exe config -verbose -addinstance:instance1/*/eng

# Create the instance
internal/internal

# console as admin
admin/admin
