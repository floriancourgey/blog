---
id: 1023
title: Use Javascript libraries in Adobe Campaign
date: 2018-10-15T14:46:25+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=1023
permalink: /2018/10/use-javascript-libraries-in-adobe-campaign/
categories:
  - opensource
---
Ever wanted to use MomentJS or Lodash in your JS scripts? It's easy to include them via a CDN for client-side web apps, but it can get tricky to get them for server-side processing. This tutorial walks you through the installation of Javascript libraries for Server Side use.

<!--more-->

Copy the source code of your library, such as Moment here [https://cdn.jsdelivr.net/npm/moment@2.22.2/min/moment.min.js](https://cdn.jsdelivr.net/npm/moment@2.22.2/min/moment.min.js)

Go to your Javascript Codes and create a new one labelled 'vendor:moment'. Paste the code you just copied:

![todo](/assets/images/2018/10/Adobe-Campaign-create-external-library.jpg)

Save it.

Now in a workflow you can use it as any other standard library:

![todo](/assets/images/2018/10/Adobe-Campaign-use-external-library.jpg)
