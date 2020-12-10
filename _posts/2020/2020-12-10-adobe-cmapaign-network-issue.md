---
title: Adobe Campaign network issue Company VPN (Error INT-150003)
categories: [opensource,adobe campaign]
---

<p class="text-center">🐍👑🌍</p>

<!--more-->


## Resolution
- On network "A", start Adobe Campaign, connect to instance, get error: `Error INT-150003`
- Close Adobe Campaign
- Connect to network "B"
- Launch windows command  `gpupdate /force /wait:0`
- Start Adobe Campaign and connect as usual
