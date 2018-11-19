---
id: 908
title: Modern web development in Adobe Campaign
date: 2018-08-03T13:42:10+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=908
permalink: /2018/08/modern-web-development-in-adobe-campaign/
categories:
  - adobe campaign
  - https
  - javascript
  - neolane
  - opensource
---
Adobe Campaign documentation is great to build 2-3 web apps. But it&#8217;s absolutely not scalable in case you need to develop 25-30 web apps with a lot of assets (CSS, JS, Images). Here are some best practices for web development in AC7.

<!--more-->

## Use Bootstrap

For every web apps you&#8217;ll ever use, use the following boiler plate code:

<pre class="lang:default decode:true ">&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
  &lt;head&gt;
    &lt;meta charset="utf-8"&gt;
    &lt;meta http-equiv="X-UA-Compatible" content="IE=edge"&gt;
    &lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;
    &lt;!-- Title --&gt;
    &lt;title&gt;Subscription&lt;/title&gt;
    &lt;!-- favicon --&gt;
    &lt;link href="&lt;%= getOption('RESOURCES_URL') %&gt;favicon.ico" rel="icon"&gt;&lt;!-- see next chapter for 'RESOURCES_URL' --&gt;
    &lt;link href="&lt;%= getOption('RESOURCES_URL') %&gt;favicon.ico" rel="shortcut icon"/&gt; 
    &lt;link href="&lt;%= getOption('RESOURCES_URL') %&gt;favicon.png" rel="shortcut icon" type="image/png"/&gt;
    &lt;!-- Common CSS --&gt;
    &lt;link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"&gt;
    &lt;link rel="stylesheet" href="&lt;%= getOption('RESOURCES_URL') %&gt;base.css"&gt;&lt;!-- see next chapter for 'RESOURCES_URL' --&gt;
    &lt;!-- Custom CSS --&gt;
    &lt;link rel="stylesheet" href="&lt;%= getOption('RESOURCES_URL') %&gt;my-layout.css"&gt;
    &lt;style type="text/css" media="all"&gt;
      /* always keep an inline &lt;style&gt; for quick edit by designers */
    &lt;/style&gt;
  &lt;/head&gt;

  &lt;body class="container"&gt;&lt;!-- or .container-fluid, see https://getbootstrap.com/docs/3.3/css/#overview-container --&gt;
    &lt;!-- Common JS --&gt;
    &lt;script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" type="text/javascript"&gt;&lt;/script&gt;
    &lt;link rel="stylesheet" href="&lt;%= getOption('RESOURCES_URL') %&gt;base.js"&gt;
    &lt;link rel="stylesheet" href="&lt;%= getOption('RESOURCES_URL') %&gt;google-analytics.js"&gt;
    &lt;!-- Custom JS --&gt;
    &lt;link rel="stylesheet" href="&lt;%= getOption('RESOURCES_URL') %&gt;my-page.js"&gt;
  &lt;/body&gt;
&lt;/html&gt;</pre>

In short you have the following:

<li style="list-style-type: none;">
  <ul>
    <li>
      Use modern HTML template from <a href="https://getbootstrap.com/docs/3.3/getting-started/#template">https://getbootstrap.com/docs/3.3/getting-started/#template</a>
    </li>
    <li>
      Always separate you common assets (common to all web apps), from the custom assets (on a per case basis)
    </li>
    <li>
      Don&#8217;t include jQuery as it will be automatically added by Adobe Campaign itself. Adobe Campaign 7 will by default import: <ul>
        <li style="list-style-type: none;">
          <ul>
            <li style="list-style-type: none;">
              <ul>
                <li>
                  <span class="lang:js decode:true crayon-inline">jQuery 1.9.1</span> . Note: jQuery is available via <span class="lang:js decode:true crayon-inline ">jQuery</span>  and not with <span class="lang:js decode:true crayon-inline ">$</span>.
                </li>
                <li>
                  <span class="lang:default decode:true crayon-inline ">jQuery-migrate 1.1.1</span>
                </li>
                <li>
                  <span class="lang:default decode:true crayon-inline">spin.js 2.3.2</span>
                </li>
                <li>
                  <span class="lang:default decode:true crayon-inline ">JSON2 polyfill</span>
                </li>
              </ul>
            </li>
          </ul>
        </li>
      </ul>
    </li>
    
    <li>
      A Google analytics easy set up, to capture traffic
    </li>
    <li>
      Use a global option for the Adobe Campaign Resources CDN, see <a href="https://floriancourgey.com/2018/08/modern-web-development-in-adobe-campaign/#a-create-a-global-option-resource_url">below</a>
    </li>
  </ul>
</li>

## Organize your assets

### A) Create a global option RESOURCE_URL

Adobe Campaign gives us the ability to get the Online Resources URL in JavaScript with <span class="lang:js decode:true crayon-inline">xtk.fileRes.GetPublicFileResURL()</span>. Call it in a workflow or get it from a Resource:

<img class="aligncenter size-full wp-image-913" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/File-Resource-CDN-URL-in-Adobe-Campaign.jpg?resize=525%2C214&#038;ssl=1" alt="" width="525" height="214" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/File-Resource-CDN-URL-in-Adobe-Campaign.jpg?w=613&ssl=1 613w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/File-Resource-CDN-URL-in-Adobe-Campaign.jpg?resize=300%2C122&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

Replace <span class="lang:default decode:true crayon-inline ">http</span>  by <span class="lang:default decode:true crayon-inline ">https</span>  and use it in an Option:

<img class="aligncenter size-full wp-image-914" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/RESOURCE_URL-Option-with-HTTPs-URL.jpg?resize=525%2C152&#038;ssl=1" alt="" width="525" height="152" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/RESOURCE_URL-Option-with-HTTPs-URL.jpg?w=586&ssl=1 586w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/RESOURCE_URL-Option-with-HTTPs-URL.jpg?resize=300%2C87&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

### B) Use filename instead of md5

By default, every File Resource will be given a Public URL based on it&#8217;s md5 content:

<img class="aligncenter size-full wp-image-915" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/File-Resource-URL-in-as-md5-hash.jpg?resize=525%2C131&#038;ssl=1" alt="" width="525" height="131" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/File-Resource-URL-in-as-md5-hash.jpg?w=761&ssl=1 761w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/File-Resource-URL-in-as-md5-hash.jpg?resize=300%2C75&ssl=1 300w" sizes="(max-width: 706px) 89vw, (max-width: 767px) 82vw, 740px" data-recalc-dims="1" />

This is absolutely not what we want. If you change the image, the md5 will change as well, so you&#8217;ll have to change it in **all** your webapps&#8230; Which means for every CSS change, you&#8217;d have to edit the Public URL 😵.

Instead, we can ask Adobe Campaign to use the Filename in place of the md5 hash. Uncheck the checkbox in the advanced parameters of the resource:

<img class="aligncenter size-full wp-image-938" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/File-Resource-URL-as-filename-instead-of-md5-hash.jpg?resize=525%2C202&#038;ssl=1" alt="" width="525" height="202" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/File-Resource-URL-as-filename-instead-of-md5-hash.jpg?w=1078&ssl=1 1078w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/File-Resource-URL-as-filename-instead-of-md5-hash.jpg?resize=300%2C115&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/File-Resource-URL-as-filename-instead-of-md5-hash.jpg?resize=768%2C296&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/08/File-Resource-URL-as-filename-instead-of-md5-hash.jpg?resize=1024%2C394&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

### C) Enjoy

This way, we just made Web development in AC great again!

<pre class="lang:default decode:true ">&lt;!-- CSS --&gt;
&lt;link rel="stylesheet" href="&lt;%= getOption('RESOURCES_URL') %&gt;style.css"&gt;
&lt;!-- JS --&gt;
&lt;script src="&lt;%= getOption('RESOURCES_URL') %&gt;script.js" type="text/javascript"&gt;&lt;/script&gt;
&lt;!-- Image --&gt;
&lt;img src="&lt;%= getOption('RESOURCES_URL') %&gt;loader.svg"/&gt;</pre>

And with this new markup, you are able to <span style="text-decoration: underline;">migrate very easily</span> from your <span style="text-decoration: underline;">Staging/Dev Environment to your Production Environment</span>. We&#8217;re now [#DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) compliant. Sweeeeet 🍡🍭🍬

&nbsp;

## Sharing meta data (Facebook opengraph og, Twitter card, Google result)

Ever tried to share a web app in Facebook?

Update your workflow by adding a JavaScript activity right before the first page:

<img class="aligncenter size-full wp-image-918" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/08/Set-sharing-meta-data-for-modern-development.jpg?resize=275%2C117&#038;ssl=1" alt="" width="275" height="117" data-recalc-dims="1" />

Use this JS code:

<pre class="lang:js decode:true">ctx.sharing.title = "Title for Social Media"
ctx.sharing.author = "Author"
ctx.sharing.description = "Social description"
ctx.sharing.image = "https://Public image URL used for sharing"</pre>

and in your HTML:

<pre class="lang:default decode:true ">&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
  &lt;head&gt;
    [...]
    &lt;!-- Title --&gt;
    &lt;title&gt;Subscription&lt;/title&gt;
    &lt;!-- meta For Google --&gt;
    &lt;meta name="description" content="&lt;%= ctx.sharing.description %&gt;" /&gt;
    &lt;meta name="keywords" content="" /&gt;
    &lt;meta name="author" content="&lt;%= ctx.sharing.author %&gt;" /&gt;
    &lt;meta name="copyright" content="" /&gt;
    &lt;meta name="application-name" content="" /&gt;
    &lt;!-- meta For Facebook --&gt;
    &lt;meta property="og:title" content="&lt;%= ctx.sharing.title %&gt;" /&gt;
    &lt;meta property="og:type" content="article" /&gt;
    &lt;meta property="og:image" content="&lt;%= ctx.sharing.image %&gt;" /&gt;
    &lt;meta property="og:url" content="" /&gt;
    &lt;meta property="og:description" content="&lt;%= ctx.sharing.description %&gt;" /&gt;
    &lt;!-- meta For Twitter --&gt;
    &lt;meta name="twitter:card" content="summary" /&gt;
    &lt;meta name="twitter:title" content="&lt;%= ctx.sharing.title %&gt;" /&gt;
    &lt;meta name="twitter:description" content="&lt;%= ctx.sharing.description %&gt;" /&gt;
    &lt;meta name="twitter:image" content="&lt;%= ctx.sharing.image %&gt;" /&gt;
    &lt;!-- Common CSS --&gt;
    [...]
  &lt;/head&gt;

  &lt;body class="container"&gt;&lt;!-- or .container-fluid --&gt;
    [...]
  &lt;/body&gt;
&lt;/html&gt;</pre>

&nbsp;

You can test your markup for Facebook on <https://developers.facebook.com/tools/debug/sharing/>:

<img class="aligncenter size-full wp-image-923" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/08/Test-your-Facebook-markup.jpg?resize=525%2C356&#038;ssl=1" alt="" width="525" height="356" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/08/Test-your-Facebook-markup.jpg?w=657&ssl=1 657w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/08/Test-your-Facebook-markup.jpg?resize=300%2C203&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

_Source <https://stackoverflow.com/questions/11616697/how-to-use-the-og-open-graph-meta-tag-for-facebook-share#answer-16822848> and  <https://developers.facebook.com/docs/sharing/webmasters#images>_