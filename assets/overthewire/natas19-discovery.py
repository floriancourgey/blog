#! /usr/bin/env python3
import requests

username = ''
for i in range(0, 5):
    username = username + 'a'
    baseUrl = 'http://natas19.natas.labs.overthewire.org/index.php?username='+username+'&password='
    r = requests.get(baseUrl, auth=('natas19', '4IwIrekcuZlA9OsjOkoUtwU6lhokCPYs'), cookies={})
    cookie_val = r.headers['Set-Cookie'].replace('PHPSESSID=', '').replace('; path=/; HttpOnly', '')
    print(username+'\t\t'+cookie_val)
