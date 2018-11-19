---
id: 434
title: 'Constants and variables for Prestashop 1.7 [PHP, Smarty, Javascript, Twig]'
date: 2018-04-25T21:27:05+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=434
permalink: /2018/04/constants-and-variables-for-prestashop/
kc_data:
  - 'a:8:{i:0;s:0:"";s:4:"mode";s:0:"";s:3:"css";s:0:"";s:9:"max_width";s:0:"";s:7:"classes";s:0:"";s:9:"thumbnail";s:0:"";s:9:"collapsed";s:0:"";s:9:"optimized";s:0:"";}'
categories:
  - prestashop
  - prestashop 1.7
---
Ever wondered what constant to use in your controllers? Is it <span class="lang:php decode:true crayon-inline ">_PS_ROOT_DIR_</span>  or <span class="lang:default decode:true crayon-inline ">__PS_BASE_URI__</span>? In smarty templates, would you go for <span class="lang:php decode:true crayon-inline ">{$urls.img_dir}</span> or <span class="lang:default decode:true crayon-inline">{$img_dir}</span>? Which constant to use? What variable are available? This article walks you through the different PHP, Smarty Javascript and Twig constants & variables at your disposal and present them with examples and contexts.
  
<!--more-->

This guide assumes you have:

  * a shop at <span class="lang:default decode:true crayon-inline">https://myshop.com/prefix/</span>
  * hosted on your server on <span class="lang:default decode:true crayon-inline">/var/www/html/prestashop/</span>.
  * Theme: <span class="lang:default decode:true crayon-inline ">my_theme</span>
  * Admin dir: <span class="lang:default decode:true crayon-inline ">admin-dev</span>

&nbsp;

  * Langages: PHP, Smarty, Javascript
  * Type: 
      * Full path: Full path on your server (e.g. /var/www/html/prestashop/README.md)
      * Relative path: Relative path from prestashop install directory (e.g. /classes)
      * Full URL: Full URL including protocol (http/https) (e.g. http://myshop.com/prefix/)
      * Relative URL: Relative URL from prestashop install directory (e.g. /img/c)
  * Available in frontoffice
  * Available in backoffice

Use the filter below to select your categories:

&nbsp;

&nbsp;

<table id="datatable-constants" class="datatable-init display" style="width: 1060px;">
  <tr style="height: 77px;">
    <th style="width: 267px; height: 77px;">
      Name
    </th>
    
    <th style="width: 98px; height: 77px;">
      Langage
    </th>
    
    <th style="width: 443px; height: 77px;">
      Example
    </th>
    
    <th style="width: 197px; height: 77px;">
      Type
    </th>
    
    <th style="width: 193px; height: 77px;">
      Front, back ?
    </th>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_ROOT_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop
    </td>
    
    <td style="width: 197px; height: 77px;">
      full path
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_CORE_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop
    </td>
    
    <td style="width: 197px; height: 77px;">
      full path
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 51px;">
    <td style="width: 267px; height: 51px;">
      _PS_ADMIN_DIR_
    </td>
    
    <td style="width: 98px; height: 51px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 51px;">
      /var/www/html/prestashop/admin-dev
    </td>
    
    <td style="width: 197px; height: 51px;">
      full path
    </td>
    
    <td style="width: 193px; height: 51px;">
      back
    </td>
  </tr>
  
  <tr style="height: 51px;">
    <td style="width: 267px; height: 51px;">
      basename(_PS_ADMIN_DIR_)
    </td>
    
    <td style="width: 98px; height: 51px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 51px;">
      admin-dev
    </td>
    
    <td style="width: 197px; height: 51px;">
      folder name
    </td>
    
    <td style="width: 193px; height: 51px;">
      back
    </td>
  </tr>
  
  <tr style="height: 51px;">
    <td style="width: 267px; height: 51px;">
      __PS_BASE_URI__
    </td>
    
    <td style="width: 98px; height: 51px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 51px;">
      /prefix/
    </td>
    
    <td style="width: 197px; height: 51px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 51px;">
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_MODE_DEV_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      true|false
    </td>
    
    <td style="width: 197px; height: 77px;">
      bool
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_DEBUG_SQL_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      true|false
    </td>
    
    <td style="width: 197px; height: 77px;">
      bool
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      _PS_THEME_URI_
    </td>
    
    <td style="width: 98px; height: 25px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_MODE_DEV_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      true|false
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_DEBUG_SQL_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      true|false
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_DEBUG_PROFILING_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      true|null
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_MODE_DEMO_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      true|null
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_ALL_THEMES_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/themes/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_BO_ALL_THEMES_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/Backoffice/themes/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_CACHE_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/app/cache/dev/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_CONFIG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/config/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_CUSTOM_CONFIG_FILE_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/config/settings_custom.inc.php
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_CLASS_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/classes/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_DOWNLOAD_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/download/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_MAIL_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/mails/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_MODULE_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/modules/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_OVERRIDE_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/override/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_PDF_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/pdf/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_TRANSLATIONS_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/translations/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_UPLOAD_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/upload/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_CONTROLLER_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/controllers/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_ADMIN_CONTROLLER_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/controllers/admin/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_FRONT_CONTROLLER_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/controllers/front/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_TOOL_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/tools/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_GEOIP_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/app/Resources/geoip/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_GEOIP_CITY_FILE_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      GeoLite2-City.mmdb
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_VENDOR_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/vendor/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_PEAR_XML_PARSER_PATH_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/tools/pear_xml_parser/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_SWIFT_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/tools/swift/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_TAASC_PATH_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/tools/taasc/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_TCPDF_PATH_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/tools/tcpdf/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_IMG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/img/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_CORE_IMG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/img/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_CAT_IMG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/img/c/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_COL_IMG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/img/co/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_EMPLOYEE_IMG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/img/e/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_GENDERS_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/img/genders/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_LANG_IMG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/img/l/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_MANU_IMG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/img/m/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_ORDER_STATE_IMG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/img/os/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_PROD_IMG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/img/p/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_SHIP_IMG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/img/s/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_STORE_IMG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/img/st/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_SUPP_IMG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/img/su/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_TMP_IMG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/img/tmp/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_CACHEFS_DIRECTORY_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/cache/cachefs/
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_JQUERY_VERSION_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      1.11.0
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_CACHE_CA_CERT_FILE_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/app/cache/dev/cacert.pem
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_DEFAULT_THEME_NAME_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      classic
    </td>
    
    <td style="width: 197px; height: 77px;">
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_THEME_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/themes/my_theme/
    </td>
    
    <td style="width: 197px; height: 77px;">
      full path
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_THEME_URI_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/themes/my_theme/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_PARENT_THEME_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /var/www/html/prestashop/themes/classic/
    </td>
    
    <td style="width: 197px; height: 77px;">
      full path
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_PARENT_THEME_URI_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/themes/classic/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEMES_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/themes/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEME_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/themes/my_theme/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEME_IMG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/themes/my_theme/assets/img/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEME_CSS_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/themes/my_theme/assets/css/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEME_JS_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/themes/my_theme/assets/js/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_IMG_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/img/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_ADMIN_IMG_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/img/admin/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_TMP_IMG_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/img/tmp/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEME_CAT_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/img/c/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEME_PROD_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/img/p/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEME_MANU_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/img/m/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEME_SUP_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/img/su/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEME_SHIP_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/img/s/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEME_STORE_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/img/st/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEME_LANG_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/img/l/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEME_COL_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/img/co/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEME_GENDERS_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/img/genders/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_PROD_IMG_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/img/p/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_JS_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/js/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _PS_CSS_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/css/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _THEME_PROD_PIC_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/upload/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _MAIL_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/mails/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      _MODULE_DIR_
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      /prefix/modules/
    </td>
    
    <td style="width: 197px; height: 77px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 77px;">
    <td style="width: 267px; height: 77px;">
      <span class="lang:php decode:true crayon-inline ">\Context::getContext()</span>
    </td>
    
    <td style="width: 98px; height: 77px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 77px;">
      Object of class <a href="https://github.com/PrestaShop/PrestaShop/blob/1.7.2.x/classes/Context.php">Context</a>
    </td>
    
    <td style="width: 197px; height: 77px;">
      Object
    </td>
    
    <td style="width: 193px; height: 77px;">
      front + back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      _DB_PREFIX_
    </td>
    
    <td style="width: 98px; height: 25px;">
      PHP
    </td>
    
    <td style="width: 443px; height: 25px;">
      Your SQL table prefix
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$baseAdminUrl}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      /prefix/admin-dev/
    </td>
    
    <td style="width: 197px; height: 25px;">
      relative url
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr>
    <td style="width: 267px;">
      {$base_url}
    </td>
    
    <td style="width: 98px;">
      Smarty
    </td>
    
    <td style="width: 443px;">
      https://myshop.com/prefix/
    </td>
    
    <td style="width: 197px;">
      full url
    </td>
    
    <td style="width: 193px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$context_mode}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$logged_on_addons}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$can_import}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$table}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      customers
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$current}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      index.php?controller=AdminCustomer
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$token}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      Token used in the current URL
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$host_mode}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$stock_management}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$no_order_tip}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$no_customer_tip}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$no_customer_message_tip}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$GA_ACCOUNT_ID}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$displayBackOfficeHeader}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$displayBackOfficeTop}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$submit_form_ajax}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$breadcrumbs2}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$quick_access_current_link_name}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$quick_access_current_link_icon}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$navigationPipe}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$img_base_path}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      /admin-dev/
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$check_url_fopen}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$check_openssl}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$add_permission}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$addons_register_link}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$addons_forgot_password_link}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$help_link}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$maintenance_mode}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$debug_mode}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$lite_display}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$url_post}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      index.php?controller=AdminCustomer&token={token}
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$show_page_header_toolbar}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$page_header_toolbar_title}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$title}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$toolbar_btn}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$page_header_toolbar_btn}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$show_new_orders}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$show_new_customers}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$show_new_messages}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$help_box}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$round_mode}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$brightness}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$bo_width}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$bo_color}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$employee}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      Object of class <a href="https://github.com/PrestaShop/PrestaShop/blob/1.7.2.x/classes/Employee.php">Employee</a>
    </td>
    
    <td style="width: 197px; height: 25px;">
      Object
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$search_type}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$bo_query}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$quick_access}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$multi_shop}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$shop_list}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$current_shop_name}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      &#8220;My Shop&#8221;
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$shop}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      Object of class <a href="https://github.com/PrestaShop/PrestaShop/blob/1.7.2.x/classes/shop/ShopGroup.php">Shop</a>
    </td>
    
    <td style="width: 197px; height: 25px;">
      Object
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$shop_group}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      Object of class <a href="https://github.com/PrestaShop/PrestaShop/blob/1.7.2.x/classes/shop/ShopGroup.php">ShopGroup</a>
    </td>
    
    <td style="width: 197px; height: 25px;">
      Object
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$is_multishop}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$multishop_context}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$default_tab_link}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$login_link}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$collapse_menu}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$img_dir}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      /prefix/img/
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$iso}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      fr
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$class_name}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      AdminCustomerController
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$iso_user}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      fr
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$country_iso_code}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      FR
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$version}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      1.7.2.4
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$lang_iso}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      fr
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$full_language_code}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      fr
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$full_cldr_language_code}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      fr-FR
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$link}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      Object of class <a href="https://github.com/PrestaShop/PrestaShop/blob/1.7.2.x/classes/Link.php">Link</a>
    </td>
    
    <td style="width: 197px; height: 25px;">
      Object
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$shop_name}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$base_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$current_parent_id}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$tabs}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$current_tab_level}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$install_dir_exists}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$pic_dir}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$controller_name}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      AdminCustomer
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr>
    <td style="width: 267px;">
      {$current}
    </td>
    
    <td style="width: 98px;">
      Smarty
    </td>
    
    <td style="width: 443px;">
      index.php?controller=AdminCustomer
    </td>
    
    <td style="width: 197px;">
    </td>
    
    <td style="width: 193px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$currentIndex}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      index.php?controller=AdminCustomer
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$bootstrap}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$default_language}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$display_addons_connection}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.base_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.current_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/v2-manager?show-old=1
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.shop_domain_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.img_ps_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/img/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.img_cat_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/img/c/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.img_lang_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/img/l/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.img_prod_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/img/p/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.img_manu_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/img/m/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.img_sup_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/img/su/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.img_ship_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/img/s/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.img_store_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/img/st/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.img_col_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/img/co/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.img_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/themes/my_theme/assets/img/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.css_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/themes/my_theme/assets/css/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.js_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/themes/my_theme/assets/js/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pic_url}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/upload/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.address}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/adresse
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.addresses}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/adresses
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.authentication}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/connexion
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.cart}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/panier
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.category}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/index.php?controller=category
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.cms}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/index.php?controller=cms
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.contact}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/nous-contacter
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.discount}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/reduction
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.guest_tracking}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/suivi-commande-invite
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.history}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/historique-commandes
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.identity}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/identite
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.index}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.my_account}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/mon-compte
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.order_confirmation}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/confirmation-commande
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.order_detail}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/index.php?controller=order-detail
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.order_follow}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/suivi-commande
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.order}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/commande
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.order_return}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/index.php?controller=order-return
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.order_slip}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/avoirs
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.pagenotfound}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/page-introuvable
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.password}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/recuperation-mot-de-passe
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.pdf_invoice}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/index.php?controller=pdf-invoice
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.pdf_order_return}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/index.php?controller=pdf-order-return
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.pdf_order_slip}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/index.php?controller=pdf-order-slip
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.prices_drop}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/promotions
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.product}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/index.php?controller=product
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.search}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/recherche
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.sitemap}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/Sitemap
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.stores}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/magasins
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.supplier}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/fournisseur
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.register}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/connexion?create_account=1
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      {$urls.pages.order_login}
    </td>
    
    <td style="width: 98px; height: 25px;">
      Smarty
    </td>
    
    <td style="width: 443px; height: 25px;">
      https://myshop.com/prefix/commande?login=1
    </td>
    
    <td style="width: 197px; height: 25px;">
      full url
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      prestashop.cart
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
      products: [], totals:[], subtotal:[], products_count, summary_string
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      prestashop.configuration
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      prestashop.currency
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
      name:&#8221;euro&#8221;, iso_code:&#8221;EUR&#8221;, iso_code_num:&#8221;978&#8243;, sign:&#8221;€&#8221;
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      currency
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
      name:&#8221;euro&#8221;, iso_code:&#8221;EUR&#8221;, format:&#8221;&#8221;, sign:&#8221;€&#8221;
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      prestashop.customer
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
      <span class="name">lastname</span>:<span class="object-value-string">&#8220;AAA&#8221;</span>, <span class="name">firstname</span>:<span class="object-value-string">&#8220;bbb&#8221;</span>, <span class="name">email</span>:&#8221;aaa@bbb.com&#8221;, &#8230;
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 51px;">
    <td style="width: 267px; height: 51px;">
      prestashop.language
    </td>
    
    <td style="width: 98px; height: 51px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 51px;">
      <span class="name">name</span>: <span class="object-value-string">&#8220;Français (French)&#8221;</span>, <span class="name">iso_code</span>: <span class="object-value-string">&#8220;fr&#8221;</span>, <span class="name">locale</span>: <span class="object-value-string">&#8220;fr-FR&#8221;</span>, <span class="name">language_code</span>: <span class="object-value-string">&#8220;fr&#8221;</span>, <span class="name">is_rtl</span>: <span class="object-value-string">&#8220;0&#8221;</span>,&#8230;
    </td>
    
    <td style="width: 197px; height: 51px;">
    </td>
    
    <td style="width: 193px; height: 51px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      prestashop.page
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
      <span class="name">title</span>:<span class="object-value-string">&#8220;&#8221;</span>, <span class="name">canonical</span>: <span class="object-value-null">null</span>, <span class="name">meta</span>: <span class="object-value-object">{}</span>, <span class="name">page_name</span>: <span class="object-value-string">&#8220;index&#8221;</span>, <span class="name">body_classes, &#8230;</span>
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      prestashop.shop
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
      <span class="name">name: <span class="object-value-string">&#8220;&#8221;</span>, email: <span class="object-value-string">&#8220;&#8221;</span>, registration_number: <span class="object-value-boolean">false</span>, long: <span class="object-value-boolean">false</span>, lat: <span class="object-value-boolean">false</span></span>
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      front
    </td>
  </tr>
  
  <tr style="height: 51px;">
    <td style="width: 267px; height: 51px;">
      prestashop.urls
    </td>
    
    <td style="width: 98px; height: 51px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 51px;">
      <span class="name">base_url</span>:<span class="object-value-string">&#8220;&#8221;</span>, <span class="name">current_url</span>:<span class="object-value-string">&#8220;&#8221;</span>, <span class="name">shop_domain_url</span>:<span class="object-value-string">&#8220;&#8221;</span>, <span class="name">img_ps_url</span>:<span class="object-value-string">&#8220;&#8221;</span>, <span class="name">img_cat_url:&#8221;&#8221;, &#8230;</span>
    </td>
    
    <td style="width: 197px; height: 51px;">
    </td>
    
    <td style="width: 193px; height: 51px;">
      front
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      baseAdminDir
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
      /prefix/admin-dev/
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      baseDir
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
      /prefix/
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      token
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
      token used in current URL &token={token}
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      token_admin_orders
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
      ???
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      token_admin_customers
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
      ???
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      token_admin_customer_threads
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
      ???
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      _PS_VERSION_
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
      &#8220;1.7.2.4&#8221;
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      help_class_name
    </td>
    
    <td style="width: 98px; height: 25px;">
      Javascript
    </td>
    
    <td style="width: 443px; height: 25px;">
      &#8220;AdminDashboard&#8221;
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
      back
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      default_currency
    </td>
    
    <td style="width: 98px; height: 25px;">
      Twig
    </td>
    
    <td style="width: 443px; height: 25px;">
      $
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      root_url
    </td>
    
    <td style="width: 98px; height: 25px;">
      Twig
    </td>
    
    <td style="width: 443px; height: 25px;">
      /prefix/
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
  
  <tr style="height: 25px;">
    <td style="width: 267px; height: 25px;">
      app
    </td>
    
    <td style="width: 98px; height: 25px;">
      Twig
    </td>
    
    <td style="width: 443px; height: 25px;">
      object of class <a href="http://api.symfony.com/master/Symfony/Bridge/Twig/AppVariable.html">AppVariable</a>
    </td>
    
    <td style="width: 197px; height: 25px;">
    </td>
    
    <td style="width: 193px; height: 25px;">
    </td>
  </tr>
</table>

_Source: mainly based on <https://github.com/PrestaShop/PrestaShop/blob/1.7.2.x/config/defines.inc.php>_

* * *