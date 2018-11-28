---
id: 358
title: Embed a Symfony controller into a Prestashop controller
date: 2018-04-19T18:27:16+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=358
permalink: /2018/04/embed-a-symfony-controller-into-a-prestashop-controller/
kc_data:
  - 'a:8:{i:0;s:0:"";s:4:"mode";s:0:"";s:3:"css";s:0:"";s:9:"max_width";s:0:"";s:7:"classes";s:0:"";s:9:"thumbnail";s:0:"";s:9:"collapsed";s:0:"";s:9:"optimized";s:0:"";}'
categories:
  - prestashop
  - prestashop 1.7
---
We are migrating from 100% Symfony to Prestashop 1.7 but we would like to keep and re-use our existing codebase. Here&#8217;s a how-to.

## How Symfony works

URL > Router > Controller >  Symfony Services calls & DB calls via Doctrine > display Twig template

You go to a URL, which is mapped to a Controller via the `@Route` annotation. This Controller will fetch data from Services and directly from the database (through the Doctrine Service 😉), and then send those data to a template that will display them in a nice way.

## How Prestashop works

Pretty much the same way !

URL > Tab > Controller > Prestashop static functions & raw DB calls via PDO > display Smarty template

## Call symfony from a Prestashop Controller

In you are on a Backoffice page, the symfony <span class="lang:php decode:true crayon-inline">global $kernel</span>  is always available. If you&#8217;re on a Frontoffice page, you have to create it manually (see [this page on how to work with the symfony kernel in Prestashop](https://floriancourgey.com/2018/05/how-to-work-with-the-symfony-kernel-anywhere-in-prestashop-1-7/)):

<pre class="lang:php decode:true">// for the front
require_once _PS_ROOT_DIR_.'/app/AppKernel.php';
$kernel = new \AppKernel('prod', false); // $env, $debug
$kernel-&gt;boot();
// or if for the back
// global $kernel;
$twig = $kernel-&gt;getContainer()-&gt;get('twig');
$html = $twig-&gt;render(_PS_ROOT_DIR_.'/src/YourBundle/Resources/views/Directory1/view1.html.twig', [
 'var1' =&gt; [],
 'var2' =&gt; 'your value here',
 'var3' =&gt; 123,
]);</pre>

&nbsp;

&nbsp;

&nbsp;

&nbsp;