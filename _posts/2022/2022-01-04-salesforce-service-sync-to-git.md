---
title: Salesforce Service Cloud synchronization to Git repository
categories: [salesforce,git,opensource]
---

<p class="text-center">🐍👑🌍</p>

<!--more-->

## First setup
- Create empty Git repo "myinstance-repo"
- git clone git-username@myinstance-repo
- sfdx force:project:create -n myinstance-repo
- cd myinstance-repo && git status
- git add .
- git commit -m "sfdx project"
- git push
- sfdx force:config:set defaultusername=myalias

## Recurring
- sfdx force:source:retrieve -u myalias -x manifest/package.xml
- git add .
- git commit -m "package"
- git push
