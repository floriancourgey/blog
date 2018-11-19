---
id: 1023
title: Use Javascript libraries in Adobe Campaign
date: 2018-10-15T14:46:25+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=1023
permalink: /2018/10/use-javascript-libraries-in-adobe-campaign/
tinymce-comment-field_enabled:
  - "1"
categories:
  - opensource
---
Ever wanted to use MomentJS or Lodash in your JS scripts? It&#8217;s easy to include them via a CDN for client-side web apps, but it can get tricky to get them for server-side processing. This tutorial walks you through the installation of Javascript libraries for Server Side use.

<!--more-->

Copy the source code of your library, such as Moment here https://cdn.jsdelivr.net/npm/moment@2.22.2/min/moment.min.js

Go to your Javascript Codes and create a new one labelled &#8220;vendor:moment&#8221;. Paste the code you just copied:

<img class="aligncenter size-full wp-image-1011" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/10/Adobe-Campaign-create-external-library.jpg?resize=498%2C266&#038;ssl=1" alt="" width="498" height="266" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/10/Adobe-Campaign-create-external-library.jpg?w=498&ssl=1 498w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/10/Adobe-Campaign-create-external-library.jpg?resize=300%2C160&ssl=1 300w" sizes="(max-width: 498px) 100vw, 498px" data-recalc-dims="1" />

Save it.

Now in a workflow you can use it as any other standard library:

<img class="aligncenter size-full wp-image-1012" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/10/Adobe-Campaign-use-external-library.jpg?resize=525%2C325&#038;ssl=1" alt="" width="525" height="325" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/10/Adobe-Campaign-use-external-library.jpg?w=527&ssl=1 527w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/10/Adobe-Campaign-use-external-library.jpg?resize=300%2C186&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />