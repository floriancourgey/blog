---
title: Install Adobe Campaign locally on Windows
categories: [opensource,adobe campaign]
---

# Summary

- Install `Java JDK 11`
- Install `PostgreSQL 14`
- Install `Adobe Campaign Classic Server v7`
- Install `Adobe Campaign Classic Console v7`
- Start the server `localhost`
- Configure the instance `instance1`

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

Powershell, as administrator:

```powershell
PS C:\Users\fco> javac -version
javac 11.0.21

PS C:\Users\fco> pg_config --version
PostgreSQL 14.10

PS C:\Users\fco> nlserver pdump
15:16:55 >   Application server for Adobe Campaign Classic (7.3.4 build 9364@8f3ef8e of 09/04/2023)
```

# Start the server from the command line

Powershell, as administrator:

```powershell
PS C:\Users\fco> nlserver web # create the default files serverConf & config-default
16:19:10 >   Application server for Adobe Campaign Classic (7.3.4 build 9364@8f3ef8e of 09/04/2023)
16:19:10 >   Starting Web server module (pid=7636, tid=3156)...
16:19:10 >   Creation of the server configuration file 'C:\Program Files\Adobe\Adobe Campaign Classic v7\conf\serverConf.xml' from 'C:\Program Files\Adobe\Adobe Campaign Classic v7\conf\eng\serverConf.xml.sample'
16:19:10 >   Creation of the server configuration file 'C:\Program Files\Adobe\Adobe Campaign Classic v7\conf\config-default.xml' from 'C:\Program Files\Adobe\Adobe Campaign Classic v7\conf\models\config-default.xml'
16:19:10 >   Server started
Ctrl-C
16:19:13 >   Stop requested (pid=7636)
16:19:13 >   Stopping Web server (pid=7636, tid=3156)...

PS C:\Users\fco> nlserver start web # start tomcat
16:19:50 >   Application server for Adobe Campaign Classic (7.3.4 build 9364@8f3ef8e of 09/04/2023)
16:19:50 >   Launching task 'web@default' ('nlserver web -tracefile:web@default -instance:default -detach -tomcat -autorepair') in a new process
16:19:50 >   Application server for Adobe Campaign Classic (7.3.4 build 9364@8f3ef8e of 09/04/2023)
16:19:50 >   Starting Web server module (pid=9984, tid=3520)...
16:19:51 >   Tomcat started
16:19:51 >   Server started

PS C:\Users\fco> net start nlserver6 # run at startup
The Adobe Campaign - Application Server 7.0 service is starting.
The Adobe Campaign - Application Server 7.0 service was started successfully.

PS C:\Users\fco> nlserver config -internalpassword # change password
16:24:18 >   Application server for Adobe Campaign Classic (7.3.4 build 9364@8f3ef8e of 09/04/2023)
Enter the current password.
Password: <EMPTY>
Enter the new password.
Password: <internal>
Confirmation: <internal>
16:24:24 >   Password successfully changed for account 'internal' (authentication mode 'nl').

PS C:\Users\fco> nlserver config -verbose -addinstance:instance1/*/eng
16:28:23 >   Application server for Adobe Campaign Classic (7.3.4 build 9364@8f3ef8e of 09/04/2023)
16:28:23 >   Generating configuration diff file 'C:\Program Files\Adobe\Adobe Campaign Classic v7\conf\serverConf.xml.diff' between 'C:\Program Files\Adobe\Adobe Campaign Classic v7\conf\serverConf.xml' and 'C:\Program Files\Adobe\Adobe Campaign Classic v7\conf\eng\serverConf.xml.sample'.
16:28:24 >   PInstanceSlot not found for Vault token rotate: overwriting iRc to 0
16:28:24 >   Skiping call to vault for refreshing the token
16:28:24 >   Creation of the server configuration file 'C:\Program Files\Adobe\Adobe Campaign Classic v7\conf\config-instance1.xml' from 'C:\Program Files\Adobe\Adobe Campaign Classic v7\conf\models\config-multi.xml'
```

# Configure the instance from the Console

Start the console from `C:\Users\fco.PC\Neolane\Adobe Campaign Classic v7 Client\bin\nlclient.exe`.

Proceed to the Database creation with:
- Database Creation
  - Database: `PostgreSQL`
  - Host: `localhost`
- Server access
  - Account: `postgres`
  - Password
- Database
  - Database name: `neolane`
  - `Create a new user account for this database`
  - Account: `neolane`
  - Password: `neolane`
- Packages to install
  - Delivery
- Creation steps
  - Adobe Campaign administrator password: Set or change the password
  - Password: `admin`

# Connect as admin
admin/admin
