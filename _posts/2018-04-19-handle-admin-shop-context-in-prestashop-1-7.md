---
id: 368
title: Handle Admin Shop Context in Prestashop 1.7
date: 2018-04-19T19:50:40+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=368
permalink: /2018/04/handle-admin-shop-context-in-prestashop-1-7/
categories:
  - opensource
  - prestashop
  - prestashop 1.7
---
Get the shop id

<pre class="lang:php decode:true">$this-&gt;context-&gt;shop-&gt;id;
Shop::getContextShopID();</pre>

Get context (a shop, a group or all shops)

<pre class="lang:php decode:true ">if(Shop::getContext() == Shop::CONTEXT_SHOP){}
if(Shop::getContext() == Shop::CONTEXT_GROUP){}
if(Shop::getContext() == Shop::CONTEXT_ALL)</pre>

Get actual shop ids (if you&#8217;re in a group or a shop)

<pre class="lang:default decode:true ">Shop::getContextListShopID(); // [1,2,3]
$sql = 'object.id_shop IN ('.join(Shop::getContextListShopID(),',').')';</pre>

&nbsp;

&nbsp;

&nbsp;