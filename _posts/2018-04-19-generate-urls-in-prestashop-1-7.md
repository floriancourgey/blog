---
id: 362
title: Generate URLs and links in Prestashop 1.7
date: 2018-04-19T17:29:24+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=362
permalink: /2018/04/generate-urls-in-prestashop-1-7/
kc_data:
  - 'a:7:{s:4:"mode";s:0:"";s:3:"css";s:0:"";s:9:"max_width";s:0:"";s:7:"classes";s:0:"";s:9:"thumbnail";s:0:"";s:9:"collapsed";s:0:"";s:9:"optimized";s:0:"";}'
categories:
  - prestashop
  - prestashop 1.7
---
You always need to generate your links and URLs. Hardcoded ones are a really bad habit. Coming from a Symfony environment, I&#8217;m familiar with <span class="lang:php decode:true crayon-inline ">$router->generate(&#8216;my-route&#8217;)</span>  but how does it work in PrestaShop? It turns out there&#8217;s 2 ways depending on either you&#8217;re generating a frontend or a backend link.

<!--more-->

## Generate a Frontend URL

## Generate a Backend URL

<pre class="lang:php decode:true ">// Generic
$this-&gt;context-&gt;link-&gt;getAdminLink('AdminControllerHere')
$this-&gt;context-&gt;link-&gt;getAdminLink($this-&gt;controller_name) // from an AdminController

// Objects
// link to view a Customer
$this-&gt;context-&gt;link-&gt;getAdminLink('AdminCustomers')."&viewcustomer&id_customer=$id_customer";
// link to update a Category
$this-&gt;context-&gt;link-&gt;getAdminLink('AdminCategories')."&updatecategory&id_category=$id_category";
// link to update an Employee
$this-&gt;context-&gt;link-&gt;getAdminLink('AdminEmployees')."&updateemployee&id_employee=$id_employee";

// Modules
// go to a module config page
$this-&gt;context-&gt;link-&gt;getAdminLink('AdminModules')."&configure=module_name&module_name=module_name"
// go to a module config page, from the module itself
$this-&gt;context-&gt;link-&gt;getAdminLink('AdminModules')."&configure={$this-&gt;name}&module_name={$this-&gt;name}"</pre>

## How to redirect

See [this article on how to redirect in Prestashop](https://floriancourgey.com/2018/04/redirects-in-prestashop-1-7/)

&nbsp;