---
title: Sync Adobe Campaign to Git every hour and track Schemas, Forms & more!
categories: [git,backup,sync,opensource,adobe campaign]
---
Set up a small software in a VM (or your own PC) to backup your Adobe instances (dev & prod) to your Git repos!
<p class="text-center">📂🔄⚛️</p>
<!--more-->

## Track your instance via a Git Repo


### Explore Files and Folders via a web UI
![](https://raw.githubusercontent.com/floriancourgey/adobe-campaign-sync/master/doc/Instance%20git%20repo%20-%20schemas.jpg)

### Track the smallest change via Git Diff
![](https://raw.githubusercontent.com/floriancourgey/adobe-campaign-sync/master/doc/Instance%20git%20repo%20-%20difference.jpg)

## Architecture
![](https://raw.githubusercontent.com/floriancourgey/adobe-campaign-sync/master/doc/Presentation.jpg)

## Instructions

### Prerequisites
- ACC instance publicly available & admin account
- Environment with NodeJS installed (local computer, VM..)

### Setup

Example from Linux VM environment:

```bash
$ pwd # /home/user
$ git clone https://github.com/floriancourgey/adobe-campaign-sync adobe-campaign-sync-instance1 # 1 folder for 1 instance
$ cd adobe-campaign-sync-instance1
# if behind a corporate firewall, set HTTP proxy
$ npm config set proxy http://x.x.x.x:port
$ npm config set https-proxy http://x.x.x.x:port
# install dependencies
$ npm install
```

### Launch

```bash
# note: clone with a GIT url, not an HTPPS, otherwise SSH autologin with the SSH public key won't work
$ git clone git@github.com/user/instance1.git instance
# copy env file, and edit it
$ cp .env.dist .env
$ vim .env
$ node src/download.js # download data schemas
$ cd instance && git status && cd .. # check
$ node src/git.js # git commit & push
```

That's it! Set up a CRON every 15 min:

```bash
$ crontab -e
*/15 * * * * cd /home/user/adobe-campaign-sync-instance1 && node src/download.js && node src/git.js
```

Source code on [github.com/floriancourgey/adobe-campaign-sync](https://github.com/floriancourgey/adobe-campaign-sync)
