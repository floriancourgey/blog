---
title: Make HTTP calls in JS in Adobe Campaign
categories: [adobe campaign,neolane]
---

<!-- more -->

## Simple HTTP GET

```js
var url = 'https://jsonplaceholder.typicode.com/users/1';
var req = new HttpClientRequest(url);
req.execute();
var resp = req.response;
var user = JSON.parse(resp.body)
logInfo(user.name) // "Leanne Graham"
```

## HTTP GET with params `?var1=1&var2=2`

```js
var base = 'https://jsonplaceholder.typicode.com/posts'

var params = {
  'postId': 1,
  'userId': '1'
};

// then convert them to a URL format var1=1&var2=2
var query = Object.keys(params)
    .map(function(k){ return k + '=' + params[k] })
    .join('&');

var url = base+'?'+query // https://jsonplaceholder.typicode.com/posts?userId=1&id=1

var req = new HttpClientRequest(url);
req.execute();
var resp = req.response;
var posts = JSON.parse(resp.body)
logInfo(posts[0].id) // 1
```

## HTTP POST

## HTTP Basic Authentication

```js
var http = new HttpClientRequest("http://www.somewhere.com/login")

var buffer = new MemoryBuffer()
buffer.fromString("MyLogin" + ':' + "MyPassword", "iso-8859-1")

http.header["Authorization"] = "Basic " + buffer.toBase64()
http.header["Content-Type"] = "text/xml; charset=utf-8"

http.method = "SEARCH"
http.body = "<xml>any content</xml>"

http.execute()
```

## Asynchronous HTTP query

```js
/**
 * @param hasProxy: Boolean to true if you need to use a proxy HTTP. By default set to false.
 * @param async: Boolean set to true if the query is asynchronous. Set to false by default.
 * @param context: The context is any object that will be forwarded to the second argument of the complete function in case of an asynchronous query. Set to null by default.
 * @param timeout: Maximum wait time in milliseconds in case of an asynchronous query. If this parameter isn't defined, the wait time is 5 minutes.
 */
function execute(hasProxy=false, async=false, context=null, timeout=300000)
```

```js
var url = 'https://jsonplaceholder.typicode.com/users/1';
var req = new HttpClientRequest(url);

// create callback
var callback = function(req, context, status) {
  if( status == "success" )
    logInfo("Receiving " + context + ": " +  req.url + ": code = " + req.response.code)
  else
    logWarning("Error " + context + ": " + req.url + ": " + status)
}
// assign callback
req.complete = callback;
// go
req.execute(false, true, null, 5000);
```

See [JSAPI execute](https://docs.campaign.adobe.com/doc/AC/en/jsapi/m-HttpClientRequest-execute.html) reference

See this [tutorial to install JS library](https://floriancourgey.com/2018/10/use-javascript-libraries-in-adobe-campaign/) such as underscore or Moment JS in Adobe Campaign.
