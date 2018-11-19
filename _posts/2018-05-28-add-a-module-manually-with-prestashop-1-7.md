---
id: 559
title: Add a module manually with Prestashop 1.7
date: 2018-05-28T00:55:37+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=559
permalink: /2018/05/add-a-module-manually-with-prestashop-1-7/
tinymce-comment-field_enabled:
  - "1"
categories:
  - opensource
---
Your UI is not working? Your Backoffice doesn&#8217;t allow you to install a module anymore because you tweaked it? You can install a module by hand in SQL directly by following this tutorial.

<!--more-->

  1. Make sure your module is avalaible locally under <span class="lang:default decode:true  crayon-inline ">/modules/my_module/my_module.php</span>
  2. Go to your database and run

<pre class="lang:mysql decode:true ">insert into _module (name, version, active) values ('my_module', '1.0.0', 1); # keep the id
insert into _module_shop (id_module, id_shop) values (use_the_id, 1);</pre>

&nbsp;