---
id: 469
title: Execute a WHERE on a linked table in a Backoffice List of Prestashop 1.7
date: 2018-05-03T18:03:16+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=469
permalink: /2018/05/execute-a-where-on-a-linked-table-in-a-backoffice-list-of-prestashop-1-7/
kc_data:
  - 'a:7:{s:4:"mode";s:0:"";s:3:"css";s:0:"";s:9:"max_width";s:0:"";s:7:"classes";s:0:"";s:9:"thumbnail";s:0:"";s:9:"collapsed";s:0:"";s:9:"optimized";s:0:"";}'
categories:
  - prestashop
  - prestashop 1.7
---
You have a list with a linked table? For example in the AdminController you display Customer, right? What if you want to separate first names and last names ; and then perform a simple search?

It will trigger an error! You have to use the <span class="lang:default decode:true crayon-inline ">filter_key </span> parameter. Here&#8217;s how.

<!--more-->

Let&#8217;s say you have

<pre class="lang:mysql decode:true">LEFT JOIN category_lang as cl [...]
LEFT JOIN customers as c [...]</pre>

You can then use

<pre class="lang:php decode:true ">$this-&gt;fields_list = [
  'category' =&gt; ['title' =&gt; 'Category', 'filter_key' =&gt; 'cl!name'], // mind the ! as a separator
  'customer' =&gt; ['title' =&gt; 'Customer', 'filter_key' =&gt; 'c!firstname'],
]
</pre>

&nbsp;