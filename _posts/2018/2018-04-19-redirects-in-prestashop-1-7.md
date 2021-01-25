---
id: 363
title: Redirects in Prestashop 1.7
date: 2018-04-19T17:29:22+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=363
permalink: /2018/04/redirects-in-prestashop-1-7/
kc_data:
  - 'a:7:{s:4:"mode";s:0:"";s:3:"css";s:0:"";s:9:"max_width";s:0:"";s:7:"classes";s:0:"";s:9:"thumbnail";s:0:"";s:9:"collapsed";s:0:"";s:9:"optimized";s:0:"";}'
categories:
  - prestashop
  - prestashop 1.7
---
## Redirects to Frontend

<pre class="lang:php decode:true ">Tools::redirect('index.php')

Tools::redirectLink('index.php')

$this-&gt;canonicalRedirection('??')</pre>

## Redirects to Backend

<pre class="lang:default decode:true ">Tools::redirectAdmin('urlHere')
Tools::redirectAdmin($this-&gt;context-&gt;link-&gt;getAdminLink('AdminControllerHere'))
Tools::redirectAdmin(Context::getContext()-&gt;link-&gt;getAdminLink(AdminDashboard::class))
</pre>

## How to generate an URL

See [this article on how to generate an URL in Prestashop](https://floriancourgey.com/2018/04/generate-urls-in-prestashop-1-7/)