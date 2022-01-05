---
title: Salesforce Service Cloud synchronization to Git repository
categories: [salesforce,git,opensource]
---

<p class="text-center">🐍👑🌍</p>

<!--more-->

## Notes
- Create empty Git repo "myinstance"
- from VM, git clone "salesforce-service-sync" "myinstance-sync"
- cd "myinstance-sync" && git clone git-username@myinstance "instance"
- sfdx force:project:create -n instance
- cd instance && git status
- git add .
- git commit -m "sfdx project"
- git push
- sfdx force:config:set defaultusername=alias
- sfdx force:source:retrieve -n manifest/package.xml
- git add .
- git commit -m "package"
- git push
