---
id: 602
title: Make HTTP calls in JS in Adobe Campaign
date: 2018-06-11T21:28:56+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=602
permalink: /2018/06/make-http-calls-in-js-in-adobe-campaign/
tinymce-comment-field_enabled:
  - "1"
categories:
  - adobe campaign
  - neolane
---
## Simple HTTP GET

<pre class="lang:js decode:true">var url = 'https://jsonplaceholder.typicode.com/users/1';
var req = new HttpClientRequest(url);
req.execute();
var resp = req.response;
var user = JSON.parse(resp.body)
logInfo(user.name) // "Leanne Graham"</pre>

## HTTP GET with params ?var1=1&var2=2

<pre class="lang:js decode:true">var base = 'https://jsonplaceholder.typicode.com/posts'

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
</pre>

## HTTP POST

## HTTP Basic Authentication

<pre class="lang:js decode:true">var http = new HttpClientRequest("http://www.somewhere.com/login")

var buffer = new MemoryBuffer()
buffer.fromString("MyLogin" + ':' + "MyPassword", "iso-8859-1")

http.header["Authorization"] = "Basic " + buffer.toBase64()
http.header["Content-Type"] = "text/xml; charset=utf-8"

http.method = "SEARCH"
http.body = "&lt;xml&gt;any content&lt;/xml&gt;"

http.execute()</pre>

## Asynchronous HTTP query

<div class="page-content">
  <div class="prototype">
    <strong><span class="prototype-name">execute</span> </strong>( [<span class="parameter">hasProxy</span> ] [, <span class="parameter">async</span> ] [, <span class="parameter">context</span> ] [, <span class="parameter">timeout</span> ])
  </div>
  
  <ul>
    <li>
      hasProxy: Boolean to true if you need to use a proxy HTTP. By default set to false.
    </li>
    <li>
      async: Boolean set to true if the query is asynchronous. Set to false by default.
    </li>
    <li>
      context: The context is any object that will be forwarded to the second argument of the complete function in case of an asynchronous query. Set to null by default.
    </li>
    <li>
      timeout: Maximum wait time in milliseconds in case of an asynchronous query. If this parameter isn&#8217;t defined, the wait time is 5 minutes.
    </li>
  </ul>
</div>

<pre class="lang:js decode:true ">var url = 'https://jsonplaceholder.typicode.com/users/1';
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
</pre>

&nbsp;

See this [tutorial to install JS library](https://floriancourgey.com/2018/10/use-javascript-libraries-in-adobe-campaign/) such as underscore or Moment JS in Adobe Campaign.