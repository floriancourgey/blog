---
title: Salesforce Service Cloud synchronization to Git repository
categories: [salesforce,git,opensource]
---

<p class="text-center">🐍👑🌍</p>

<!--more-->

## Setup from Personal PC

- From browser, create an empty Git repo "myinstance-repo"
- From ~/

```console
$ sfdx force:auth:web:login -r https://test.salesforce.com # authorize Org
$ git clone git-username@myinstance-repo # pull git repo
$ sfdx force:project:create -n myinstance-repo # init sf project into repo
$ cd myinstance-repo && git status
$ mkdir manifest
$ vim manifest/package.xml # create package
TBD
$ git add . && git commit -m "sfdx project" && git push
$ sfdx force:org:display -u myinstance_username --verbose --json
{
  "status": 0,
  "result": {
    "id": "00 [...]
}
```

## Setup for automatic backups from headless VM

From ~/
```console
$ vim authFile.json
paste JSON data from Personal PC
$ sfdx force:auth:sfdxurl:store -f authFile.json
Successfully authorized myinstance_username with org ID 00xxxXXXXXxxXXXX
$ rm authFile.json
$ export SFDX_USE_GENERIC_UNIX_KEYCHAIN=true # to bypass SFDX usage of gnome-keyring (errors: X11 $DISPLAY, secret-tool org.freedesktop.Secret.Error.IsLocked)
$ git clone git-username@myinstance-repo
$ cd myinstance-repo
$ sfdx force:source:retrieve -u myinstance_username -x manifest/package.xml
$ git add . && git commit -m "package" && git push
```

## CRON job

```console
$ crontab -e
27 * * * * cd ~/myinstance-repo && sfdx force:source:retrieve -u myinstance_username -x manifest/package.xml && git add . && git commit -m "$(date +%Y-%m-%d_%H:%M:%S)" && git push
# generates a commit like "2022-12-27_16:30:07"
```
