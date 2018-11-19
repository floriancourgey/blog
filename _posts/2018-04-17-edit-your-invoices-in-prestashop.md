---
id: 345
title: 'Edit your invoices in Prestashop 1.7 &#8211; How to create an Admin Controller?'
date: 2018-04-17T18:44:45+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=345
permalink: /2018/04/edit-your-invoices-in-prestashop/
kc_data:
  - 'a:8:{i:0;s:0:"";s:4:"mode";s:0:"";s:3:"css";s:0:"";s:9:"max_width";s:0:"";s:7:"classes";s:0:"";s:9:"thumbnail";s:0:"";s:9:"collapsed";s:0:"";s:9:"optimized";s:0:"";}'
categories:
  - github
  - hacking
  - opensource
  - prestashop
  - prestashop 1.7
---
Have you ever wanted to modify an order or an invoice directly in Prestashop? Tired of bypassing PS limitations via phpMyAdmin? You can create an Admin Controller in PS 1.7  to edit your invoices directly in your browser:

>>> You can also view this [tuto to completely customize an Admin Controller from scratch, with your Custom SQL Table](https://floriancourgey.com/2018/05/create-an-admin-for-a-customized-sql-table/)

<img class="aligncenter size-full wp-image-347" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Image-17.png?resize=525%2C333&#038;ssl=1" alt="" width="525" height="333" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Image-17.png?w=1072&ssl=1 1072w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Image-17.png?resize=300%2C190&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Image-17.png?resize=768%2C487&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Image-17.png?resize=1024%2C650&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

<!--more-->

## Objective

With this tutorial, you will be able to create an Admin Controller to create and edit any [Prestashop class](https://github.com/PrestaShop/PrestaShop/tree/develop/classes). We will take [Order Invoice](https://github.com/PrestaShop/PrestaShop/blob/develop/classes/order/OrderInvoice.php) as an example. This way, we can add, remove and edit any field of any invoice in Prestashop.

This extension will be available in your Backoffice through a URL that looks like this:

https://my.presta.com/admin/index.php?controller=AdminCustomInvoices

We have to:

  1. Create the module and a simple  Admin Controller
  2. Edit the Admin Controller to present all invoices in a list
  3. Edit it again to add/edit invoices

## Step 1. Create the Admin Controller (via a Module)

Admin Controllers only exist in a module. So we need to create a module first! Let&#8217;s create a dummy module with <span class="lang:default decode:true crayon-inline">modules/my_module/my_module.php</span> :

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
}</pre>

Then, activate it through the PrestShop Backoffice by looking for « my_module »:<figure id="attachment_621" class="wp-caption aligncenter"> 

<div class="lg-container">
  <img class="aligncenter size-full wp-image-621" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/search-for-my_module-in-the-backoffice-annote.jpg?resize=525%2C279&#038;ssl=1" alt="" width="525" height="279" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/search-for-my_module-in-the-backoffice-annote.jpg?w=1660&ssl=1 1660w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/search-for-my_module-in-the-backoffice-annote.jpg?resize=300%2C160&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/search-for-my_module-in-the-backoffice-annote.jpg?resize=768%2C409&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/search-for-my_module-in-the-backoffice-annote.jpg?resize=1024%2C545&ssl=1 1024w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/search-for-my_module-in-the-backoffice-annote.jpg?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />
</div></figure> 

<div>
  Finally, we can create our actual <span class="lang:default decode:true crayon-inline ">AdminCustomInvoicesController</span>  in <span class="lang:default decode:true crayon-inline">modules/my_module/controllers/admin/AdminCustomInvoicesController.php</span> :
</div>

<div>
  <pre class="lang:php decode:true" title="modules/my_module/controllers/admin/AdminCustomInvoicesController.php">&lt;?php

class AdminCustomInvoicesController extends ModuleAdminController {
  public function __construct(){
      $this-&gt;bootstrap = true; // use Bootstrap CSS
      $this-&gt;table = 'order_invoice'; // SQL table name, will be prefixed with _DB_PREFIX_
      $this-&gt;className = 'OrderInvoice'; // PHP class name
      $this-&gt;allow_export = true; // allow export in CSV, XLS..
  }

  public function access($action, $disable = false){
      return true;
  }
}
</pre>
</div>

Let&#8217;s check that everything is working well by heading to <span class="lang:default decode:true crayon-inline">https://my.presta.com/admin/index.php?controller=AdminCustomInvoices</span> :

<img class="aligncenter size-full wp-image-753" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-19.53.18.png?resize=525%2C128&#038;ssl=1" alt="" width="525" height="128" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-19.53.18.png?w=2560&ssl=1 2560w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-19.53.18.png?resize=300%2C73&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-19.53.18.png?resize=768%2C188&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-19.53.18.png?resize=1024%2C250&ssl=1 1024w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-19.53.18.png?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

Snap! It doesn&#8217;t work. We have to allow this Controller in order to use it. Prestashop uses <span class="lang:php decode:true crayon-inline ">Tab</span>  to whitelist Controllers.

Directly in the database, execute:

<pre class="lang:mysql decode:true">INSERT INTO `ps_tab` (id_parent, position, module, class_name, active)
VALUES (3, 6, 'my_module', 'AdminCustomInvoices', 1);
</pre>

Refresh your tab, and Ta-da! Our empty Controller is looking great:

<img class="aligncenter size-full wp-image-756" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.03.54.png?resize=525%2C127&#038;ssl=1" alt="" width="525" height="127" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.03.54.png?w=2560&ssl=1 2560w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.03.54.png?resize=300%2C73&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.03.54.png?resize=768%2C186&ssl=1 768w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.03.54.png?resize=1024%2C248&ssl=1 1024w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.03.54.png?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

## Step 2. Add the List feature

For example, an Admin Controller to handle your invoices (list, view, create, edit and delete)

<pre class="lang:php decode:true" title="modules/my_module/controllers/admin/AdminCustomInvoicesController.php">&lt;?php

class AdminCustomInvoicesController extends ModuleAdminController {
  public function __construct(){
    // [...]

    $this-&gt;fields_list = [
      'id_order_invoice' =&gt; ['title' =&gt; $this-&gt;trans('ID', [], 'Admin.Global'),'class' =&gt; 'fixed-width-xs'],
      'number' =&gt; ['title' =&gt; $this-&gt;trans('Number', [], 'Admin.Global'),'class' =&gt; 'fixed-width-xs'],
      'date_add' =&gt; ['title' =&gt; $this-&gt;trans('Date', [], 'Admin.Global'), 'type'=&gt;'datetime'],
      'total_products_wt' =&gt; ['title' =&gt; $this-&gt;trans('Total products', [], 'Admin.Global'),
        'align' =&gt; 'text-right',
        'type' =&gt; 'price',
      ],
      'total_shipping_tax_incl' =&gt; ['title' =&gt; $this-&gt;trans('Total shipping', [], 'Admin.Global'),
        'align' =&gt; 'text-right',
        'type' =&gt; 'price',
      ],
      'total_paid_tax_incl' =&gt; ['title' =&gt; $this-&gt;trans('Total paid', [], 'Admin.Global'),
        'align' =&gt; 'text-right',
        'type' =&gt; 'price',
      ],
    ];
  }
}
</pre>

Which gives us the following list (sortable and filterable!!):

<img class="aligncenter size-full wp-image-757" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.22.49.png?resize=525%2C200&#038;ssl=1" alt="" width="525" height="200" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.22.49.png?w=2560&ssl=1 2560w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.22.49.png?resize=300%2C114&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.22.49.png?resize=768%2C293&ssl=1 768w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.22.49.png?resize=1024%2C390&ssl=1 1024w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.22.49.png?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

## Step 3. Add the edit & add features

Add <span class="lang:php decode:true crayon-inline ">$this->fields_form</span>  and <span class="lang:php decode:true crayon-inline ">$this->addRowAction</span> :

<pre class="lang:php decode:true" title="modules/my_module/controllers/admin/AdminCustomInvoicesController.php">&lt;?php

class AdminCustomInvoicesController extends ModuleAdminController {
  public function __construct(){
    // [...]

    $this-&gt;addRowAction('edit');
    $this-&gt;addRowAction('details');

    $this-&gt;fields_form = [
      'legend' =&gt; ['title' =&gt; $this-&gt;l('Custom Invoice'),'icon' =&gt; 'icon-list-ul'],
      'input' =&gt; [
        ['name' =&gt; 'date_add','type' =&gt; 'datetime','label' =&gt; 'Date add',],
        ['name'=&gt;'number','type'=&gt;'text','required' =&gt; true,'label' =&gt; 'Number',],
        ['name'=&gt;'note','type'=&gt;'textarea','label' =&gt; 'Note',],
        ['name'=&gt;'delivery_number','type'=&gt;'text','label'=&gt;'Delivery number'],
        ['name'=&gt;'delivery_date','type'=&gt;'datetime','label'=&gt;'Delivery date'],
        ['name'=&gt;'total_discount_tax_excl','type'=&gt;'text','label'=&gt;'Total amount of discounts (no tax)'],
        ['name'=&gt;'total_discount_tax_incl','type'=&gt;'text','label'=&gt;'Total amount of discounts (with tax)'],
        ['name'=&gt;'total_shipping_tax_excl','type'=&gt;'text','label'=&gt;'Total cost of shipping (no tax)'],
        ['name'=&gt;'total_shipping_tax_incl','type'=&gt;'text','label'=&gt;'Total cost of shipping (with tax)'],
        ['name'=&gt;'total_products','type'=&gt;'text','label'=&gt;'Total cost of products (no tax)'],
        ['name'=&gt;'total_products_wt','type'=&gt;'text','label'=&gt;'Total cost of products (with tax)'],
        ['name'=&gt;'total_wrapping_tax_excl','type'=&gt;'text','label'=&gt;'Total cost of wrapping (no tax)'],
        ['name'=&gt;'total_wrapping_tax_incl','type'=&gt;'text','label'=&gt;'Total cost of wrapping (with tax)'],
        ['name'=&gt;'total_paid_tax_excl','type'=&gt;'text','label'=&gt;'Total paid (no tax)'],
        ['name'=&gt;'total_paid_tax_incl','type'=&gt;'text','label'=&gt;'Total paid (with tax)'],
        ['name'=&gt;'shop_address','type'=&gt;'textarea','label'=&gt;'Shop address'],
      ],
      'submit' =&gt; ['title' =&gt; $this-&gt;trans('Save', [], 'Admin.Actions'),]
    ];
  }
}
</pre>

This new code adds buttons in the last column:

<img class="aligncenter size-full wp-image-761" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.35.30.png?resize=525%2C229&#038;ssl=1" alt="" width="525" height="229" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.35.30.png?w=2560&ssl=1 2560w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.35.30.png?resize=300%2C131&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.35.30.png?resize=768%2C335&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.35.30.png?resize=1024%2C446&ssl=1 1024w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.35.30.png?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

&nbsp;

And hitting Edit results in a nice form, ready to be edited!

<img class="aligncenter size-full wp-image-762" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.32.55.png?resize=525%2C203&#038;ssl=1" alt="" width="525" height="203" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.32.55.png?w=2560&ssl=1 2560w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.32.55.png?resize=300%2C116&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.32.55.png?resize=768%2C296&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.32.55.png?resize=1024%2C395&ssl=1 1024w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.32.55.png?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

## Step 4. Going further

### 4. a) Add customer info in the list

<pre class="lang:php decode:true" title="modules/my_module/controllers/admin/AdminCustomInvoicesController.php">&lt;?php

class AdminCustomInvoicesController extends ModuleAdminController {
  public function __construct(){
    // [...]
    $this-&gt;_select = 'concat(upper(c.lastname), " ", c.firstname) as customer';
    $this-&gt;_join = '
      JOIN '._DB_PREFIX_.'orders o ON (o.id_order = a.id_order)
      JOIN '._DB_PREFIX_.'customer c ON (c.id_customer = o.id_customer)
    ';

    $this-&gt;fields_list = [
      // [...]
      'customer' =&gt; ['title' =&gt; $this-&gt;trans('Customer', [], 'Admin.Global')],
      // [...]
    ];
  }
}
</pre>

Displays the customer name in a column:

<img class="aligncenter size-full wp-image-766" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.43.05.png?resize=525%2C226&#038;ssl=1" alt="" width="525" height="226" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.43.05.png?w=2560&ssl=1 2560w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.43.05.png?resize=300%2C129&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.43.05.png?resize=768%2C331&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.43.05.png?resize=1024%2C442&ssl=1 1024w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.43.05.png?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

### 4. b) Add order info above the form

<pre class="lang:php decode:true" title="modules/my_module/controllers/admin/AdminCustomInvoicesController.php">&lt;?php

class AdminCustomInvoicesController extends ModuleAdminController {
  // [...]

  public function renderForm(){
    $invoice = $this-&gt;object; // get invoice
    $order = $invoice-&gt;getOrder(); // get order
    $customer = $order-&gt;getCustomer(); // get customer
    $currency = new Currency($order-&gt;id_currency); // get currency
    // add some info in an HTML string
    $info = '&lt;div class="panel"&gt;';
    $info .= '&lt;div class="panel-heading"&gt;&lt;i class="icon-list-ul"&gt;&lt;/i&gt; Order informations&lt;/div&gt;';
    $info .= "Order reference: {$order-&gt;reference}&lt;br/&gt;";
    $info .= "Customer: {$customer-&gt;firstname} {$customer-&gt;lastname}&lt;br/&gt;";
    $info .= "Total_paid : ".Tools::displayPrice($order-&gt;total_paid, $currency)."&lt;br/&gt;";
    $info .= "Get total paid : ".Tools::displayPrice($order-&gt;getTotalPaid(), $currency)."&lt;br/&gt;";
    $info .= "Payment: {$order-&gt;payment}&lt;br/&gt;";
    $info .= "Order state : {$order-&gt;getCurrentOrderState()-&gt;name[$this-&gt;context-&gt;language-&gt;id]}";
    $info .= '&lt;/div&gt;';
    // push the HTML to $this-&gt;content
    $this-&gt;content .= $info;
    return parent::renderForm();
  }
}
</pre>

And we now have a simple panel that serves as a header to render some data about the order and the customer:

<img class="aligncenter size-full wp-image-768" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.47.58.png?resize=525%2C225&#038;ssl=1" alt="" width="525" height="225" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.47.58.png?w=2560&ssl=1 2560w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.47.58.png?resize=300%2C128&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.47.58.png?resize=768%2C329&ssl=1 768w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.47.58.png?resize=1024%2C438&ssl=1 1024w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.47.58.png?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

### 4. c) Delete an invoice

USE WITH CARE, you CANNOT undo a deletion!!!

<pre class="lang:php decode:true" title="modules/my_module/controllers/admin/AdminCustomInvoicesController.php">&lt;?php

class AdminCustomInvoicesController extends ModuleAdminController {
  public function __construct(){
    // [...]

    $this-&gt;addRowAction('delete');
    $this-&gt;bulk_actions = [
      'delete' =&gt; [
        'text' =&gt; 'Delete',
        'icon' =&gt; 'icon-power-off'
      ],
    ];
  }
}</pre>

<div class="panel">
  <p>
    This new code will add buttons to delete via one-shot and bulk:
  </p>
  
  <p>
    <img class="aligncenter size-full wp-image-769" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.52.22.png?resize=525%2C254&#038;ssl=1" alt="" width="525" height="254" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.52.22.png?w=2560&ssl=1 2560w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.52.22.png?resize=300%2C145&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.52.22.png?resize=768%2C371&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.52.22.png?resize=1024%2C495&ssl=1 1024w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Capture-d’écran-2018-07-06-à-20.52.22.png?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />
  </p>
  
  <h2>
    5. Full version of the Code
  </h2>
  
  <p>
    Hosted on <a href="https://gist.github.com/floriancourgey/cb63fd5abd93e1109fcf624a68307403">https://gist.github.com/floriancourgey/cb63fd5abd93e1109fcf624a68307403</a>
  </p>
  
  <p>
  </p>
  
  <p>
    &nbsp;
  </p>
</div>

Mobile and responsive version:

<img class="aligncenter size-full wp-image-611" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/screencapture-app-bonnemine-co-Backoffice-index-php-2018-06-12-10_17_27.png?resize=480%2C2133&#038;ssl=1" alt="" width="480" height="2133" data-recalc-dims="1" />