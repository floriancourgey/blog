---
title: Install Adobe Campaign locally on Windows
categories: [opensource,adobe campaign]
---

# Soft
- JDK "jdk-8u391-windows-x64.exe" (https://experience.adobe.com/#/downloads/content/software-distribution/en/general.html Oracle JDK 8u391 - Windows x64 Installer
)
- ACC "7.0.9364.zip" (https://experience.adobe.com/#/downloads/content/software-distribution/en/campaign.html 7.3.4 - build 9364 - Windows - GENERAL AVAILABILITY)
- PostgreSQL "postgresql-14.10-1-windows-x64.exe" (https://www.enterprisedb.com/downloads/postgres-postgresql-downloads "Windows x86-64")
 
# cmd
PS as admin
- start web
- internal
- /nlserver.exe config -verbose -addinstance:instance1/*/eng

# console as internal
internal/internal

# console as admin
admin/admin
