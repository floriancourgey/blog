---
title: macOS General Setup & Recommendations
categories: [macOS,setup]
---
Excerpt here...
<p class="text-center">🐍👑🌍</p>
<!--more-->

## Enable root
```console
$ csrutil status
System Integrity Protection status: enabled.
$ csrutil disable
Reboot
```

## dev tools
```console
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Old files cleanup
```console
$ sudo rm -rf /Library/Updates/* # macOS old updates files
$ sudo rm -rf "/System/Library/Desktop Pictures/*.heic" # macOS default wallpapers
```
