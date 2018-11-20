---
id: 1036
title: Create jssp Dynamic JavaScript Server Page in ACC
date: 2018-11-07T16:21:31+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=1036
permalink: /2018/11/create-jssp-dynamic-javascript-server-page-in-acc/
tinymce-comment-field_enabled:
  - "1"
categories:
  - adobe campaign
  - neolane
---
We can create server-generated pages in ACC. Here are some info about it. It will result in pages with  the .jssp extension.

<!--more-->

## Create a simple test page

Create a JSSP in any JSSP folder. The JSSP name will define the URL:

The name <span class="lang:default decode:true crayon-inline">my_nms:my-page.jssp</span>  will give us the URL <span class="lang:default decode:true crayon-inline">https://xxx.campaign.adobe.com/my_nms/my-page.jssp</span>

<img class="aligncenter size-full wp-image-1040" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/JSSP-code-with-name-and-namespace.jpg?resize=328%2C258&#038;ssl=1" alt="" width="328" height="258" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/JSSP-code-with-name-and-namespace.jpg?w=328&ssl=1 328w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/JSSP-code-with-name-and-namespace.jpg?resize=300%2C236&ssl=1 300w" sizes="(max-width: 328px) 100vw, 328px" data-recalc-dims="1" />

No need to publish, no cache, the page is instantly available:

<img class="aligncenter size-full wp-image-1041" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/html-render-for-jssp.jpg?resize=501%2C166&#038;ssl=1" alt="" width="501" height="166" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/html-render-for-jssp.jpg?w=501&ssl=1 501w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/html-render-for-jssp.jpg?resize=300%2C99&ssl=1 300w" sizes="(max-width: 501px) 100vw, 501px" data-recalc-dims="1" />

Note: Some clients may give you an error as the Header Content-Type is not defined. I.e. in [Restlet Client](https://restlet.com/modules/client/):

<img class="aligncenter size-full wp-image-1042" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/html-render-in-restlet-client.jpg?resize=525%2C251&#038;ssl=1" alt="" width="525" height="251" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/html-render-in-restlet-client.jpg?w=1122&ssl=1 1122w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/html-render-in-restlet-client.jpg?resize=300%2C144&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/html-render-in-restlet-client.jpg?resize=768%2C368&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/html-render-in-restlet-client.jpg?resize=1024%2C490&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

To fix it, add the content type in Javascript with <span class="lang:js decode:true crayon-inline"><% response.setContentType(&#8220;text/html;charset=utf-8&#8221;); %></span> :

<pre class="lang:js decode:true ">&lt;%
response.setContentType("text/html;charset=utf-8");
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="en" dir="ltr"&gt;
  &lt;head&gt;
    &lt;meta charset="utf-8"&gt;
    &lt;title&gt;Title here&lt;/title&gt;
  &lt;/head&gt;
  &lt;body&gt;
    Body Here
  &lt;/body&gt;
&lt;/html&gt;</pre>

<img class="aligncenter size-full wp-image-1043" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/html-render-in-restlet-client-with-content-type.jpg?resize=525%2C222&#038;ssl=1" alt="" width="525" height="222" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/html-render-in-restlet-client-with-content-type.jpg?w=1085&ssl=1 1085w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/html-render-in-restlet-client-with-content-type.jpg?resize=300%2C127&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/html-render-in-restlet-client-with-content-type.jpg?resize=768%2C325&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/html-render-in-restlet-client-with-content-type.jpg?resize=1024%2C433&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

## Develop a JSON API

<pre class="lang:js decode:true ">&lt;%
response.setContentType('application/json');
var x = {'a':'b'};
document.write(JSON.stringify(x));
%&gt;</pre>

<img class="aligncenter size-full wp-image-1081" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/javascript-server-page-json-api.jpg?resize=525%2C110&#038;ssl=1" alt="" width="525" height="110" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/javascript-server-page-json-api.jpg?w=968&ssl=1 968w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/javascript-server-page-json-api.jpg?resize=300%2C63&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/javascript-server-page-json-api.jpg?resize=768%2C160&ssl=1 768w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

But try to <span class="lang:js decode:true crayon-inline ">var delivery = NLWS.nmsDelivery.load(&#8220;12435&#8221;);</span>  and you&#8217;ll get an Access Denied:

<pre class="lang:default decode:true ">XTK-170019 Access denied.</pre>

&nbsp;

This is because the current operator is Anonymous:

<pre class="lang:js decode:true">&lt;% for(var i in application.operator){ %&gt;
  &lt;%= i %&gt;: &lt;%= application.operator[i] %&gt;
&lt;% } %&gt;</pre>

Displays

<pre class="lang:default decode:true ">login:
id: 0
computeString: Anonymous account
groups:
rights:
timezone: America/Los_Angeles
locale: en-US
home:</pre>

&nbsp;

So we have to change the logon information with the <span class="lang:js decode:true crayon-inline ">logon</span>  function:

<pre class="lang:js decode:true">&lt;% var oldContext = logon('john-doe', 'password'); // login as john-doe
for(var i in application.operator){ %&gt;
  &lt;%= i %&gt;: &lt;%= application.operator[i] %&gt;
&lt;% }
logon(oldContext); // log back in as previous user
logon(sessionToken); // log in with token %&gt;
</pre>

Displays

<pre class="lang:js decode:true ">login: john-doe
id: 16448341684316
computeString: John Doe (john-doe)
groups: 558
rights: right1
timezone: America/Los_Angeles
locale: en-US
home:</pre>

&nbsp;

Database is now accessible 😉

<div class="alert alert-warning">
  logon is deprecated. Use <span class="lang:js decode:true crayon-inline">logonEscalation(&#8216;webapp&#8217;)</span> , <span class="lang:js decode:true crayon-inline ">logonWithUser(login, password)</span> , <span class="lang:js decode:true crayon-inline ">logonWithToken(token)</span> , <span class="lang:js decode:true crayon-inline ">logonWithContext(context)</span>  instead.</p>

  <p>
    Original Adobe Campaign message (in Monitoring logs > web@default): The &#8216;logon&#8217; JavaScript method is deprecated. Please use &#8216;logonEscalation&#8217;, &#8216;logonWithUser&#8217;, &#8216;logonWithToken&#8217; or &#8216;logonWithContext&#8217; instead.
  </p>
</div>

    <h2>
      Example of HttpServletRequest and HttpServletRequest
    </h2>

    <pre class="lang:default decode:true ">&lt;%
// disable cache
response.addHeader("Pragma", "no-cache");
response.addHeader("Cache-Control", "no-cache");
response.addHeader("Expires", new Date().toGMTString());
// content type
response.setContentType("text/html;charset=utf-8");
%&gt;
&lt;!DOCTYPE html&gt;
&lt;html lang="en" dir="ltr"&gt;
  &lt;head&gt;
    &lt;meta charset="utf-8"&gt;
    &lt;title&gt;Body here&lt;/title&gt;
  &lt;/head&gt;
  &lt;body&gt;
    URL param1: &lt;%= request.getParameter("param1") %&gt;&lt;br&gt;
    HTTP Body: getBodyAsString(): &lt;%= request.getBodyAsString() %&gt;&lt;br&gt;--&lt;br&gt;
    &lt;% for(var key in request){
        document.write(key+ " : " + request[key] + "&lt;br&gt;")
      } %&gt;
    &lt;br&gt;--&lt;br&gt;
    User-Agent: &lt;%= request.getHeader('User-Agent') %&gt;&lt;br&gt;
    X-Forwarded-For: &lt;%= request.getHeader('X-Forwarded-For') %&gt;&lt;br&gt;
    getRemoteAddr(): &lt;%= request.getRemoteAddr() %&gt;&lt;br&gt;
  &lt;/body&gt;
&lt;/html&gt;</pre>

    <p>
      Gives us
    </p>

    <pre class="lang:default decode:true ">URL param1: value1
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
getRemoteAddr(): E.F.G.H</pre>

    <p>
      See <a href="https://en.wikipedia.org/wiki/List_of_HTTP_header_fields">https://en.wikipedia.org/wiki/List_of_HTTP_header_fields</a> for list of header names.
    </p>

    <h2>
      Explore HttpServletResponse API
    </h2>

    <p>
      Noticed that we used <span class="lang:js decode:true crayon-inline "><% response.[&#8230;] %></span> , what properties and methods are available? Response is of type <span class="lang:default decode:true crayon-inline ">HttpServletResponse</span> .
    </p>

    <pre class="lang:js decode:true" title="JS doc for HttpServletRequest">// Methods
/** Changes the document type of the response. */
setContentType(string type)
/** Returns a temporary redirection to another URL. */
sendRedirect(string url)
/** Adds a cookie to the response. */
addCookie(string cookie)
/** Adds an additional HTTP header to the response. */
addHeader(string key, string value)
/** Returns an error response using the error code passed as a parameter. */
sendError(int httpErrorCode)
</pre>

    <h2>
      Explore HttpServletRequest API
    </h2>

    <pre class="lang:default decode:true ">// Methods
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
</pre>

    <h2>
      Encode and decode URL
    </h2>

    <pre class="lang:js decode:true ">/** Convert string to URL safe equivalent */
encodeURI(string)
encodeURI("Hello world?!'=-") // "Hello%20world?!'=-"
// encodeURI can be used on a full URL, without messing with : / ? or &
encodeURI("https://example.com?var1=val1&var2=val2") // "https://example.com?var1=val1&var2=val2"

/** Convert string from URL safe */
decodeURI(string)
decodeURI("Hello%20world?!'=-") // "Hello world?!'=-"
</pre>

    <p>
      &nbsp;
    </p>

    <p>
      &nbsp;
    </p>

    <p>
      <em>Source: <a href="http://docs.campaign.adobe.com/doc/AC/en/jsapi/p-32.html">http://docs.campaign.adobe.com/doc/AC/en/jsapi/p-32.html</a></em>
    </p>
