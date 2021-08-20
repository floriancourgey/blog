---
title: "Business case: Clean Adobe Campaign email addresses via a DQM third-party (NPM libraries, REST API, javascript for queries and updates)"
categories: [opensource,adobe campaign,api,javascript,workflow]
---

Excerpt here...

<p class="text-center">🐍👑🌍</p>

<!--more-->

**bold** *italic*  ~~strikethrough~~

## Summary
-
-
-

## Get and install an NPM library

Get any email validator lib, such as [https://github.com/manishsaraan/email-validator](https://github.com/manishsaraan/email-validator/blob/master/index.js).
Copy and paste it to a new javascript code `vendor:email-validator`.
As it is an NodeJS lib, wrap it into a class:
```js
[...]
var validator = new function(){
  this.validate = function(email){
    [...]
  }
}
```
