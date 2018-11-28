---
id: 562
title: 'Create an Admin Controller for a customized SQL table (Part 1/2) [Prestashop 1.7]'
date: 2018-05-28T15:56:21+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=562
permalink: /2018/05/create-an-admin-for-a-customized-sql-table/
categories:
  - opensource
  - prestashop
  - prestashop 1.7
---
Prestashop has developed great admin interface : data table, filters, edit/create form, etc. But you know what? You can re-use this UI for your own SQL table. This tutorial will walk through it.

<img class="aligncenter wp-image-641 size-full" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Admin-Controller-Cover.jpg?resize=525%2C295&#038;ssl=1" alt="Use PrestaShop to manage any SQL table" width="525" height="295" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Admin-Controller-Cover.jpg?w=1280&ssl=1 1280w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Admin-Controller-Cover.jpg?resize=300%2C169&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Admin-Controller-Cover.jpg?resize=768%2C432&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Admin-Controller-Cover.jpg?resize=1024%2C576&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

If you want to [edit an already existing Object such as your invoices, head over to this tutorial](https://floriancourgey.com/2018/04/admin-controller-in-module-prestashop-1-7/).

This is the part 1 of a Series to customize Prestashop in depth. [Follow this link for the tutorial 2 about creating the Front Controller (Part 2/2)](https://floriancourgey.com/2018/04/how-to-create-a-new-front-controller-for-prestashop-1-7/).

<!--more-->

## Objective

We are going to be able to create, read, update and delete a customized SQL table. Let&#8217;s take some pastas as an example.

We will be using this SQL Dataset [setup.sql](https://floriancourgey.com/wp-content/uploads/2018/05/setup.sql_.txt) (taken from the CSV [dh\_product\_lookup.csv](https://floriancourgey.com/wp-content/uploads/2018/05/dh_product_lookup.csv), from the website <https://www.dunnhumby.com/sourcefiles>).

Let&#8217;s use the pasta database:

<pre class="lang:mysql decode:true ">CREATE TABLE pasta (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `sku` VARCHAR(255) NOT NULL ,
  `name` VARCHAR(255) NOT NULL ,
  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

insert into pasta (sku,name) values ('601011292', 'BARILLA MARINARA PSTA SCE');
insert into pasta (sku,name) values ('601011293', 'BARILLA SWT PEPPER/GARLIC');
insert into pasta (sku,name) values ('601011294', 'BARILLA ARRABBIATA SPCY P');
-- [...]
-- find all the SQL setup in https://floriancourgey.com/wp-content/uploads/2018/05/dh_product_lookup.csv</pre>

## Step 1: Create your PHP class

Folder does not matter, all properties as <span class="lang:php decode:true crayon-inline ">public</span> , <span class="lang:php decode:true crayon-inline ">extends ObjectModel</span> , use <span class="lang:php decode:true crayon-inline ">public static $definition</span>  to define your SQL fields.

For example I like to use use <span class="lang:default decode:true crayon-inline">/override/classes/my_dir</span> . This way, it will stay even if Prestashop is updated, and can be included in a git repository.

<pre class="lang:php decode:true " title="/override/classes/my_dir/Pasta.php">&lt;?php
class Pasta extends ObjectModel {
  public $id;
  public $sku;
  public $name;
  public $created;
  public static $definition = [
    'table' =&gt; 'pasta',
    'primary' =&gt; 'id',
    'fields' =&gt; [
      'sku' =&gt;  ['type' =&gt; self::TYPE_STRING, 'validate' =&gt; 'isAnything', 'required'=&gt;true],
      'name' =&gt;  ['type' =&gt; self::TYPE_STRING, 'validate' =&gt; 'isAnything', 'required'=&gt;true],
      'created' =&gt;  ['type' =&gt; self::TYPE_DATE, 'validate' =&gt; 'isDateFormat'],
    ],
  ];
}
</pre>

&nbsp;

## Step 2: Create your Admin Controller

AdminController can only be created inside a Module. Let&#8217;s create a dummy module first in <span class="lang:default decode:true crayon-inline ">modules/my_module/my_module.php</span> :

<pre class="lang:php decode:true" title="modules/my_module/my_module.php">&lt;?php
if (!defined('_PS_VERSION_')) {exit;}
class My_Module extends Module {
  public function __construct() {
      $this-&gt;name = 'my_module';
      $this-&gt;tab = 'administration';
      $this-&gt;version = '1.0.0';
      $this-&gt;author = 'Florian Courgey';
      $this-&gt;bootstrap = true;
      parent::__construct();
      $this-&gt;displayName = $this-&gt;l('PrestaShop Module by FC');
      $this-&gt;description = $this-&gt;l('Improve your store by [...]');
      $this-&gt;ps_versions_compliancy = ['min' =&gt; '1.7', 'max' =&gt; _PS_VERSION_];
  }
}
</pre>

Activate it through the PrestShop Backoffice by looking for &#8220;my_module&#8221;:<figure id="attachment_621" style="width: 1660px" class="wp-caption aligncenter">

<img class="wp-image-621 size-full" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/search-for-my_module-in-the-backoffice-annote.jpg?resize=525%2C279&#038;ssl=1" alt="3 easy steps to install the module locally" width="525" height="279" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/search-for-my_module-in-the-backoffice-annote.jpg?w=1660&ssl=1 1660w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/search-for-my_module-in-the-backoffice-annote.jpg?resize=300%2C160&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/search-for-my_module-in-the-backoffice-annote.jpg?resize=768%2C409&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/search-for-my_module-in-the-backoffice-annote.jpg?resize=1024%2C545&ssl=1 1024w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/search-for-my_module-in-the-backoffice-annote.jpg?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" /><figcaption class="wp-caption-text">Install the module locally</figcaption></figure> 

and then create the bare minimum in an Admincontroller in <span class="lang:default decode:true crayon-inline">modules/my_module/controllers/admin/AdminPastaController.php</span> , which <span class="lang:php decode:true crayon-inline">extends ModuleAdminController</span>

<pre class="lang:php decode:true" title="modules/my_module/controllers/admin/AdminPastaController.php">&lt;?php
require_once _PS_ROOT_DIR_.'/override/classes/my_dir/Pasta.php';

class AdminPastaController extends ModuleAdminController {
  public function __construct(){
      parent::__construct();
      $this-&gt;bootstrap = true; // use Bootstrap CSS
      $this-&gt;table = 'pasta'; // SQL table name, will be prefixed with _DB_PREFIX_
      $this-&gt;identifier = 'id'; // SQL column to be used as primary key
      $this-&gt;className = 'Pasta'; // PHP class name
      $this-&gt;allow_export = true; // allow export in CSV, XLS..
  }
}</pre>

Head to <http://localhost/admin-dev/index.php?controller=AdminPasta> and you should now have an empty AdminController:

<img class="aligncenter size-full wp-image-623" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/empty-AdminController-PastaController.jpg?resize=525%2C217&#038;ssl=1" alt="" width="525" height="217" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/empty-AdminController-PastaController.jpg?w=1305&ssl=1 1305w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/empty-AdminController-PastaController.jpg?resize=300%2C124&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/empty-AdminController-PastaController.jpg?resize=768%2C318&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/empty-AdminController-PastaController.jpg?resize=1024%2C424&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

## Step 3: Configure your Admin Controller

Now all the customization will be executed in the AdminController only. Let&#8217;s start by adding the list with <span class="lang:php decode:true crayon-inline ">$this->fields_list</span> :

<pre class="lang:php mark:13-20,23-26 decode:true" title="modules/my_module/controllers/admin/AdminPastaController.php">&lt;?php
require_once _PS_ROOT_DIR_.'/override/classes/my_dir/Pasta.php';

class AdminPastaController extends ModuleAdminController {
  public function __construct(){
    parent::__construct();
    $this-&gt;bootstrap = true; // use Bootstrap CSS
    $this-&gt;table = 'pasta'; // SQL table name, will be prefixed with _DB_PREFIX_
    $this-&gt;identifier = 'id'; // SQL column to be used as primary key
    $this-&gt;className = 'Pasta'; // PHP class name
    $this-&gt;allow_export = true; // allow export in CSV, XLS..

    $this-&gt;_defaultOrderBy = 'a.created'; // the table alias is always `a`
    $this-&gt;_defaultOrderWay = 'DESC';
    $this-&gt;fields_list = [
        'id' =&gt; ['title' =&gt; 'ID','class' =&gt; 'fixed-width-xs'],
        'sku' =&gt; ['title' =&gt; 'SKU'],
        'name' =&gt; ['title' =&gt; 'Name'],
        'created' =&gt; ['title' =&gt; 'Created','type'=&gt;'datetime'],
    ];
  }

  // As our SQL table doesn't use the _DB_PREFIX_, we have to remove it from the WHERE clause
  protected function getFromClause() {
      return str_replace(_DB_PREFIX_, '', parent::getFromClause());
  }
}
</pre>

This gives us a wonderful table with export, filters, orders and pagination:

<img class="aligncenter size-full wp-image-634" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-with-list-only-2.jpg?resize=525%2C221&#038;ssl=1" alt="" width="525" height="221" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-with-list-only-2.jpg?w=1916&ssl=1 1916w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-with-list-only-2.jpg?resize=300%2C127&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-with-list-only-2.jpg?resize=768%2C324&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-with-list-only-2.jpg?resize=1024%2C432&ssl=1 1024w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-with-list-only-2.jpg?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

## 4. Create, edit and delete your Custom Object

But we still cannot create or edit our object. We have to add a new part in our controller with <span class="lang:php decode:true crayon-inline ">$this->fileds_form</span> :

<pre class="lang:default mark:22-37 decode:true">&lt;?php
require_once _PS_ROOT_DIR_.'/override/classes/my_dir/Pasta.php';

class AdminPastaController extends ModuleAdminController {
  public function __construct(){
    parent::__construct();
    $this-&gt;bootstrap = true; // use Bootstrap CSS
    $this-&gt;table = 'pasta'; // SQL table name, will be prefixed with _DB_PREFIX_
    $this-&gt;identifier = 'id'; // SQL column to be used as primary key
    $this-&gt;className = 'Pasta'; // PHP class name
    $this-&gt;allow_export = true; // allow export in CSV, XLS..

    $this-&gt;_defaultOrderBy = 'a.created'; // the table alias is always `a`
    $this-&gt;_defaultOrderWay = 'DESC';
    $this-&gt;fields_list = [
        'id' =&gt; ['title' =&gt; 'ID','class' =&gt; 'fixed-width-xs'],
        'sku' =&gt; ['title' =&gt; 'SKU'],
        'name' =&gt; ['title' =&gt; 'Name'],
        'created' =&gt; ['title' =&gt; 'Created','type'=&gt;'datetime'],
    ];

    $this-&gt;addRowAction('edit');
    $this-&gt;addRowAction('details');
    $this-&gt;fields_form = [
      'legend' =&gt; [
        'title' =&gt; 'Pasta',
        'icon' =&gt; 'icon-list-ul'
      ],
      'input' =&gt; [
        ['name'=&gt;'sku','type'=&gt;'text','label'=&gt;'SKU','required'=&gt;true,],
        ['name'=&gt;'name','type'=&gt;'text','label'=&gt;'Name','required'=&gt;true],
        ['name'=&gt;'created','type'=&gt;'text','label'=&gt;'Created','suffix'=&gt;'YYYY-MM-DD HH:mm',],
      ],
      'submit' =&gt; [
        'title' =&gt; $this-&gt;trans('Save', [], 'Admin.Actions'),
      ]
    ];

  }

  // As our database doesn't use the _DB_PREFIX_, we have to remove it
  protected function getFromClause() {
      return str_replace(_DB_PREFIX_, '', parent::getFromClause());
  }
}
</pre>

So we now have a nice form when we click on Create:

<img class="aligncenter size-full wp-image-637" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-with-Add-New.jpg?resize=525%2C176&#038;ssl=1" alt="" width="525" height="176" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-with-Add-New.jpg?w=1916&ssl=1 1916w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-with-Add-New.jpg?resize=300%2C101&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-with-Add-New.jpg?resize=768%2C258&ssl=1 768w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-with-Add-New.jpg?resize=1024%2C344&ssl=1 1024w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-with-Add-New.jpg?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

> > But it doesn&#8217;t work! You can also try to click on edit or on details, you&#8217;ll have an error:

<http://localhost/admin-dev/index.php?controller=AdminPasta&id=768&updatepasta>

<img class="aligncenter size-full wp-image-638" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-Object-cannot-be-loaded.jpg?resize=525%2C118&#038;ssl=1" alt="" width="525" height="118" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-Object-cannot-be-loaded.jpg?w=1917&ssl=1 1917w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-Object-cannot-be-loaded.jpg?resize=300%2C67&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-Object-cannot-be-loaded.jpg?resize=768%2C172&ssl=1 768w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-Object-cannot-be-loaded.jpg?resize=1024%2C230&ssl=1 1024w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-Object-cannot-be-loaded.jpg?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

This is the error thrown here <https://github.com/PrestaShop/PrestaShop/blob/1.7.3.x/classes/controller/AdminController.php#L1655>

This is a limitation of PrestaShop: if you want to edit/create/delete an object, its SQL table <span style="text-decoration: underline;">MUST</span> use the \_DB\_PREFIX_.

So you have to rename your pasta table:

<pre class="lang:mysql decode:true ">RENAME TABLE prestashop_pasta.pasta TO prestashop_pasta.ps_pasta; # adjust with your own _DB_PREFIX_</pre>

And remove the whole <span class="lang:php decode:true crayon-inline ">function getFromClause</span> :

<pre class="lang:php decode:true ">// protected function getFromClause() {
//     return str_replace(_DB_PREFIX_, '', parent::getFromClause());
// }</pre>

Refresh your page and you now have a fully working Form with a Custom Object:

<img class="aligncenter size-full wp-image-639" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-Edit-is-now-working.jpg?resize=525%2C190&#038;ssl=1" alt="" width="525" height="190" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-Edit-is-now-working.jpg?w=1498&ssl=1 1498w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-Edit-is-now-working.jpg?resize=300%2C109&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-Edit-is-now-working.jpg?resize=768%2C278&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/AdminController-Edit-is-now-working.jpg?resize=1024%2C371&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

Here we are!! There&#8217;s still much to do, as adding new fields in the Edit Form (tuto coming soon) and display those pastas in a nice Front Controller for the customers to be able to see them, you can head over here [for the tutorial 2 about creating the Front Controller](https://floriancourgey.com/2018/05/create-an-admin-for-a-customized-sql-table/).

&nbsp;

<img class="aligncenter" src="https://i0.wp.com/uploads.disquscdn.com/images/3681964a5dbe8e4d3ca23796cfdeb66e137b3f46f16d82453437872e417e410f.jpg?w=525&#038;ssl=1" alt="Hooray!" data-recalc-dims="1" />