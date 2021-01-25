---
title: "Linux training with overthewire [Part X: Vortex 1-]"
date: 2018-11-30T18:00:00
categories:
  - opensource
  - linux
  - bash
  - shell
  - hack
  - server
---
Excerpt here...
<!--more-->

This post is part of a series:
- [Linux training with overthewire Part 1: Bandit 1-10]({% post_url 2018/2018-11-30-linux-training-overthewire-bandit-1 %})
- [Linux training with overthewire Part 2: Bandit 11-20]({% post_url 2018/2018-11-30-linux-training-overthewire-bandit-2 %})
- [Linux training with overthewire Part 3: Bandit 21-30]({% post_url 2018/2018-11-30-linux-training-overthewire-bandit-3 %})
- [Linux training with overthewire Part 4: Natas 1-10]({% post_url 2018/2018-11-30-linux-training-overthewire-natas-1 %})
- [Linux training with overthewire Part 5: Natas 11-20]({% post_url 2018/2018-11-30-linux-training-overthewire-natas-2 %})
- [Linux training with overthewire Part 6: Leviathan]({% post_url 2018/2018-11-30-linux-training-overthewire-leviathan %})
- [Linux training with overthewire Part 7: Krypton]({% post_url 2018/2018-11-30-linux-training-overthewire-krypton %})
- Linux training part X: Vortex

## Level 0 - Raw socket receive/send
```python
import socket
import struct

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('vortex.labs.overthewire.org', 5842))
res = 0 # final result to send
for i in range(0, 4): # we expect 4 numbers
    data = s.recv(4) # each number is an unsigned int, which takes 4 bytes
    print('raw', data)
    iData = struct.unpack('I', data)[0] # convert from byte to int (I)
    res += iData # add to final result

s.sendall(struct.pack("I", res)) # send result as bytes, converted from an int (I)
print(s.recv(1024))
```

```
('raw', '\x076\xc6*')
('raw', '(BJ%')
('raw', '\xe2\x83\xbbt')
('raw', '\x0b\x1a9\r')
Username: vortex1 Password: Gq#qu3bF3
```
