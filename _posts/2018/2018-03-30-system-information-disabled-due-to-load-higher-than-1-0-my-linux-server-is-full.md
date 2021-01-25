---
title: System information disabled due to load higher than 1.0 (My linux server is full!)
permalink: /2018/03/system-information-disabled-due-to-load-higher-than-1-0-my-linux-server-is-full/
categories: [linux, server]
---
When logging in through SSH:

![](/assets/images/2018/03/Image-166.png)
> System information disabled due to load higher than 1.0

<!-- more -->

## GUI version : [Space Radar](https://github.com/zz85/space-radar)

![](https://cloud.githubusercontent.com/assets/314997/11022585/5c847364-869d-11e5-8079-0a16e7d747e4.gif)

Install [Space Radar](https://github.com/zz85/space-radar) on a client machine. On the server, generate a txt sizes file with `du -ak`
```console
$ du -ak /var/log /usr | gzip -c > /tmp/sizes.txt.gz
```

*See [Space Radar repo](https://github.com/zz85/space-radar#reading-from-a-file-)*

## CLI version

### Which partition is full?

```console
$ df
Filesystem 1K-blocks Used Available Use% Mounted on
udev 991316 0 991316 0% /dev
tmpfs 199908 20936 178972 11% /run
/dev/vda1 10287416 9833040 4196 100% /
tmpfs 999528 0 999528 0% /dev/shm
tmpfs 5120 24 5096 1% /run/lock
tmpfs 999528 0 999528 0% /sys/fs/cgroup
cgmfs 100 0 100 0% /run/cgmanager/fs
tmpfs 199908 0 199908 0% /run/user/1000</pre>
```

## Which directory is full?

```console
$ du -h --max-depth=1 / | sort -hr
9,4G /
5,2G /var
2,1G /usr
1,4G /opt
560M /root
158M /lib
57M /boot
49M /home
21M /run
13M /etc
13M /bin
9,9M /sbin
3,9M /lib32
3,1M /tmp
$ du -h --max-depth=2 /home | sort -hr
```

If you still have some Mb left, [ncdu (ncurse disk usage)](https://dev.yorhel.nl/ncdu/scr) might help:

```console
$ ncdu
$ ncdu ~
$ sudo ncdu /
# inside ncdu, quit with q
# and go up folder with <backspace>
```

![](https://i1.wp.com/dev.yorhel.nl/img/ncduinfo-2.png)

## Common temporary files safe to remove

### Delete rotated logs

```bash
$ ll /var/log/*.{gz,bz2} # check
$ rm /var/log/*.{gz,bz2} # remove
```
