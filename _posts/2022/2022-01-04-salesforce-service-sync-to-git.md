---
title: Salesforce Service Cloud synchronization to Git repository
categories: [salesforce,git,opensource]
---

<p class="text-center">🐍👑🌍</p>

<!--more-->

## Setup from Personal PC

- Create empty Git repo "myinstance-repo"

```console
$ git clone git-username@myinstance-repo
$ sfdx force:project:create -n myinstance-repo
$ cd myinstance-repo && git status
$ vim manifest/package.xml
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

```console
$ export SFDX_USE_GENERIC_UNIX_KEYCHAIN=true # to bypass usage of gnome-keyring
$ git clone git-username@myinstance-repo
$ cd myinstance-repo
$ sfdx force:source:retrieve -u myinstance_username -x manifest/package.xml
$ git add . && git commit -m "package" && git push
```
