---
title: Understanding the cache of Prestashop 1.7 (and Symfony)
guid: https://floriancourgey.com/?p=427
permalink: /2018/04/understanding-the-cache-of-prestashop-1-7-and-symfony/
categories: [prestashop,prestashop 1.7,symfony]
---

Cache allows your customers to enhance their shopping experience by greatly improving page load. For example, each time a customer searches for `iphone 8` in your store, Prestashop reads the cache and displays results already computed for previous customers. So let's say _customer A_ looks for `iphone charger`, Prestashop will create a list of products that matches this criteria, directly from the database, and store them as a file, e.g. `/cache/search/iphone-charger.xml`. Then, all the following customers looking for an iphone charger will be prompted with the list coming from the XML and not from the database. This choice is made by a lot of websites because "File access" is most of the time faster than "Database access".

In our case, _customer A_ warmed up the cache because the cache was inexistant for the query `iphone charger`. We call this a `cache miss`. Them, when some customers search the same terms, the cache already exists, so it `hits` the cache: it's a `cache hit`.

That being said, Prestashop uses multiple caches:

* Smarty cache: every `.tpl`  file is compiled into a PHP file
* Symfony cache: since 1.7, Prestashop uses Symfony as its underlying framework. By default, Symfony comes with cache at different levels: 
    * Configuration: config, services (via YML, XML..)
    * Controllers (Annotations, YML..)
    * Doctrine cache: 
        * Entity mapping: fields-columns, table.. (via YML, Annotation..)
* XML cache: delete all XMLs in `_PS_ROOT_DIR_.'/config/xml'`
* Media cache: remove theme cache files in `_PS_THEME_DIR_.'assets/cache/'` and in `_PS_THEME_DIR_.'cache/*'` and increment constants `PS_CCCJS_VERSION` and `PS_CCCCSS_VERSION`
* Classes index cache: the file class_index.php contains the path to any overwritten class
