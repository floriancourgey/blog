---
id: 427
title: Understanding the cache of Prestashop 1.7 (and Symfony)
date: 2018-04-25T17:53:54+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=427
permalink: /2018/04/understanding-the-cache-of-prestashop-1-7-and-symfony/
categories:
  - prestashop
  - prestashop 1.7
  - symfony
---
Cache allows your customers to enhance their shopping experience by greatly improving page load. For example, each time a customer searches for &#8220;iphone 8&#8221; in your store, Prestashop reads the cache and displays results already computed for previous customers. So let&#8217;s say <span style="text-decoration: underline;">customer A</span> looks for &#8220;iphone charger&#8221;, Prestashop will create a list of products that matches this criteria, directly from the database, and store them as a file, e.g. <span class="lang:default decode:true crayon-inline ">/cache/search/iphone-charger.xml</span> . Then, all the following customers looking for an iphone charger will be prompted with the list coming from the XML and not from the database. This choice is made by a lot of websites because File access is most of the time faster than Database access.

In our case, <span style="text-decoration: underline;">customer A</span> warmed up our cache because the cache was inexistant for the query &#8220;iphone charger&#8221;. We call this a &#8220;cache miss&#8221;. Them, when some customers search the same terms, the cache already exists, so it &#8220;hits&#8221; the cache: it&#8217;s a &#8220;cache hit&#8221;.

That being said, Prestashop uses multiple caches:

  * Smarty cache: every <span class="lang:default decode:true crayon-inline ">.tpl</span>  file is compiled into a PHP file
  * Symfony cache: since 1.7, Prestashop uses Symfony as its underlying framework. By default, Symfony comes with cache at different levels: 
      * Configuration: config, services (via YML, XML..)
      * Controllers (Annotations, YML..)
      * Doctrine cache: 
          * Entity mapping: fields-columns, table.. (via YML, Annotation..)
  * XML cache: delete all XMLs in <span class="lang:php decode:true crayon-inline ">_PS_ROOT_DIR_.&#8217;/config/xml&#8217;</span>
  * Media cache: remove theme cache files in <span class="lang:php decode:true crayon-inline ">_PS_THEME_DIR_.&#8217;assets/cache/*&#8217;</span> <span class="pl-s"> and in <span class="lang:php decode:true crayon-inline">_PS_THEME_DIR_.&#8217;cache/*&#8217;</span>  and increment constants <span class="lang:default decode:true crayon-inline ">PS_CCCJS_VERSION</span>  and <span class="lang:default decode:true crayon-inline ">PS_CCCCSS_VERSION</span> </span>
  * Classes index cache: the file class_index.php contains the path to any class you&#8217;d overwritten