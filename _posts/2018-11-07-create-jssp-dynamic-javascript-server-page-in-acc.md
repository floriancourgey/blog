---
title: Create jssp Dynamic JavaScript Server Page in ACC
date: 2018-11-07T16:21:31+00:00
permalink: /2018/11/create-jssp-dynamic-javascript-server-page-in-acc/
categories: [adobe campaign, neolane]
---
We can create server-generated pages in ACC. Here are some info about it. It will result in pages with  the .jssp extension.

<!--more-->

## Doc
JSSP come from a custom implementation of the Java JSSP project, [description and docs here](http://jssp.sourceforge.net/jssp_description.html), based on multiple Java EE objects such as the [HttpServletRequest class](https://docs.oracle.com/javaee/1.4/api/javax/servlet/http/HttpServletRequest.html). Note: as it's a custom implementation, many documented methods are not available.

## Create a simple test page

Create a JSSP in any JSSP folder. The JSSP name will define the URL:

The name `my_nms:my-page.jssp` will give us the URL `https://xxx.campaign.adobe.com/my_nms/my-page.jssp`.


![todo](/assets/images/2018/11/JSSP-code-with-name-and-namespace.jpg)

No need to publish, no cache, the page is instantly available:

![todo](/assets/images/2018/11/html-render-for-jssp.jpg)

Note: Some clients may give you an error as the Header Content-Type is not defined. I.e. in [Restlet Client](https://restlet.com/modules/client/):

![todo](/assets/images/2018/11/html-render-in-restlet-client.jpg)

To fix it, add the content type in Javascript with `response.setContentType('text/html;charset=utf-8'); %>`:

```html
<%
response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Title here</title>
  </head>
  <body>
    Body Here
  </body>
</html>
```

![todo](/assets/images/2018/11/html-render-in-restlet-client-with-content-type.jpg)

## Develop a JSON API

```js
<%
response.setContentType('application/json');
var x = {'a':'b'};
document.write(JSON.stringify(x));
%>
```

![todo](/assets/images/2018/11/javascript-server-page-json-api.jpg)

But try to `var delivery = NLWS.nmsDelivery.load('12435');`  and you'll get an Access Denied:

```
XTK-170019 Access denied.
```

&nbsp;

This is because the current operator is Anonymous:

```js
<% for(var i in application.operator){
  document.write(i+': '+application.operator[i]+'\n');
} %>
```

Displays

```
login:
id: 0
computeString: Anonymous account
groups:
rights:
timezone: America/Los_Angeles
locale: en-US
home:
```

&nbsp;

So we have to change the logon information with the <span class="lang:js decode:true crayon-inline ">logon</span>  function:

```js
<% var oldContext = logon('john-doe', 'password'); // login as john-doe
for(var i in application.operator){
  document.write(i+': '+application.operator[i]+'\n');
}
logon(oldContext); // log back in as previous user
logon(sessionToken); // log in with token %>
```

Displays

```js
login: john-doe
id: 16448341684316
computeString: John Doe (john-doe)
groups: 558
rights: right1
timezone: America/Los_Angeles
locale: en-US
home:
```

Database is now accessible 😉

<div class="alert alert-warning">
  logon is deprecated. Use `logonEscalation('webapp')`, `logonWithUser(login, password)`, <span class="lang:js decode:true crayon-inline ">logonWithToken(token)</span> , <span class="lang:js decode:true crayon-inline ">logonWithContext(context)</span>  instead.


  Original Adobe Campaign message (in Monitoring logs > web@default):

  The 'logon' JavaScript method is deprecated. Please use 'logonEscalation', 'logonWithUser', 'logonWithToken' or 'logonWithContext' instead.
</div>

## Example of HttpServletRequest and HttpServletRequest

```html
<%
// disable cache
response.addHeader("Pragma", "no-cache");
response.addHeader("Cache-Control", "no-cache");
response.addHeader("Expires", new Date().toGMTString());
// content type
response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Title here</title>
  </head>
  <body>
    <b>URL param1:</b> <%= request.getParameter("param1") %><br>
    <b>HTTP Body: getBodyAsString():</b> <%= request.getBodyAsString() %><br>--<br>
    <% for(var key in request){
        document.write("<b>"+key+":</b> "+request[key]+"<br>")
      } %>
    <br>--<br>
    <b>User-Agent:</b> <%= request.getHeader('User-Agent') %><br>
    <b>X-Forwarded-For:</b> <%= request.getHeader('X-Forwarded-For') %><br> <!-- IP address -->
    <b>getRemoteAddr():</b> <%= request.getRemoteAddr() %><br> <!-- IP address and proxy -->
  </body>
</html>
```

Output:

```
URL param1: value1
HTTP Body: getBodyAsString(): paramPost1=val1&paramPost2=val2
--
parameters : [object RequestParameters]
cookies : [object Cookies]
requestURI : /my_nms/my-page.jssp
requestURL : http://campaign.adobe.com/my_nms/my-page.jssp
queryString : param1=value1
servletPath : /my_nms/my-page.jssp
contextPath :
pathInfo : null
serverName : campaign.adobe.com
serverPort : 80
serverURL : https://campaign.adobe.com
attributes : [object RequestParameters]
method : POST
--
User-Agent: Mozilla...
X-Forwarded-For: A.B.C.D, E.F.G.H
getRemoteAddr(): E.F.G.H
```

See <a href="https://en.wikipedia.org/wiki/List_of_HTTP_header_fields">https://en.wikipedia.org/wiki/List_of_HTTP_header_fields</a> for list of header names.


## Explore HttpServletResponse API

Noticed that we used `<% response.[...] %>`, what properties and methods are available? Response is of type `HttpServletResponse`.


JS doc for HttpServletRequest
```js
// Methods/** Changes the document type of the response. */
setContentType(string type)
/** Returns a temporary redirection to another URL. */
sendRedirect(string url)
/** Adds a cookie to the response. */
addCookie(string cookie)
/** Adds an additional HTTP header to the response. */
addHeader(string key, string value)
/** Returns an error response using the error code passed as a parameter. */
sendError(int httpErrorCode)
```

## Explore HttpServletRequest API

```js
// Methods
/** Returns an attribute defined in the query header. */
getHeader(string key)
/** Returns the value of a query parameter. */
getParameter(string key)
/** Returns the IP address of the client or the last proxy to have sent a request. */
getRemoteAddr()
/** Returns the value (coded in UTF-8) of a parameter of the query. */
getUTF8Parameter(string key)
/** Returns the body of the query in the form of a string of characters using query coding. */
getBodyAsString()
/** Redirects the query towards another page without going via the client. */
forward(string url)

// properties
/** Returns the query parameters. */
parameters
/** Returns the cookies of the query. */
cookies
/** Returns the URL of the query. */
requestURI
/** Returns the part of the query's URL which matches the parameters. */
queryString
/** Returns the name of the protocol used (HTTP, HTTPS, etc.) to access this page. */
scheme
/** Returns the name of the query server. */
serverName
/** Returns the port number used to contact the server. */
serverPort
/** Returns the URL for accessing the server. */
serverURL
/** Returns the section of the query's URL which matches the servlet. */
servletPath
/** Returns the section of the query's URL which matches the context. */
contextPath
/** Returns the additional information of the query's URL. */
pathInfo
/** Returns a string of characters containing the HTTP method used to call up this query (GET, HEAD, POST, etc.). */
method
```

## Encode and decode URL

```js
/** Convert string to URL safe equivalent */
encodeURI(string)
encodeURI("Hello world?!'=-") // "Hello%20world?!'=-"
// encodeURI can be used on a full URL, without messing with : / ? or &
encodeURI("https://example.com?var1=val1&var2=val2") // "https://example.com?var1=val1&var2=val2"

/** Convert string from URL safe */
decodeURI(string)
decodeURI("Hello%20world?!'=-") // "Hello world?!'=-"
```


*Source: [docs.campaign.adobe.com/doc/AC/en/jsapi/p-32.html](http://docs.campaign.adobe.com/doc/AC/en/jsapi/p-32.html)*
