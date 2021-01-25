---
id: 515
title: How to send an email from Javascript?
date: 2018-05-09T17:49:15+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=515
permalink: /2018/05/how-to-send-an-email-from-javascript/
kc_data:
  - 'a:8:{i:0;s:0:"";s:4:"mode";s:0:"";s:3:"css";s:0:"";s:9:"max_width";s:0:"";s:7:"classes";s:0:"";s:9:"thumbnail";s:0:"";s:9:"collapsed";s:0:"";s:9:"optimized";s:0:"";}'
categories:
  - automation
  - javascript
  - opensource
  - zapier
---
Have you ever wanted to send an email from client-side? You only have javascript at your disposal but you don&#8217;t want your customers to be able to see your credentials? Don&#8217;t make a PHP app just fot his, use Zapier! You don&#8217;t need any private credentials and you can monitor logs and errors from a cloud-based environment.

<!--more-->

Create your Zap with &#8220;Catch Hook &#8211; Send Outbound email&#8221;: https://zapier.com/app/editor/template/62

<img class="aligncenter size-full wp-image-518" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Image-9.png?resize=397%2C216&#038;ssl=1" alt="" width="397" height="216" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Image-9.png?w=397&ssl=1 397w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Image-9.png?resize=300%2C163&ssl=1 300w" sizes="(max-width: 397px) 100vw, 397px" data-recalc-dims="1" />

Zapier will give you an URL to send your data, such as https://hooks.zapier.com/hooks/catch/123456/abcdef/

You can then call from you Javascript:

<pre class="lang:js decode:true">var data = {
      "email": "your-customer@email.com",
      "data1": "123",
      "data2": "456"
    }
    try {
      var xhr = new XMLHttpRequest();
      xhr.open("POST", 'https://hooks.zapier.com/hooks/catch/123456/abcdef/');
      xhr.send(JSON.stringify(data));
      console.log("Pushed to Zapier successfully!");
      alert('Success');
    } catch(e) {
      console.error(e);
      alert('Error')
    }
</pre>

Here you go! You can then monitor all your calls from a single place:

<img class="aligncenter size-full wp-image-520" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Image-11.png?resize=525%2C241&#038;ssl=1" alt="" width="525" height="241" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Image-11.png?w=1114&ssl=1 1114w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Image-11.png?resize=300%2C138&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Image-11.png?resize=768%2C352&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Image-11.png?resize=1024%2C470&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />