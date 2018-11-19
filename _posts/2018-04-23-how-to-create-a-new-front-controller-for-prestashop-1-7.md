---
id: 390
title: 'Create a new front controller from scratch (Part 2/2) [Prestashop 1.7]'
date: 2018-04-23T16:01:18+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=390
permalink: /2018/04/how-to-create-a-new-front-controller-for-prestashop-1-7/
kc_data:
  - 'a:8:{i:0;s:0:"";s:4:"mode";s:0:"";s:3:"css";s:0:"";s:9:"max_width";s:0:"";s:7:"classes";s:0:"";s:9:"thumbnail";s:0:"";s:9:"collapsed";s:0:"";s:9:"optimized";s:0:"";}'
categories:
  - opensource
  - prestashop
  - prestashop 1.7
---
Prestashop can be used to display any page that you want. Either it&#8217;s pure HTML or templated data with Smarty, or even Twig since Prestashop 1.7! In this tutorial, we will create front controller to get a new URL to display organized data from the database.

<!--more-->

## Objective

As we&#8217;ve already created [a nice backoffice for our pasta here](https://floriancourgey.com/2018/05/create-an-admin-for-a-customized-sql-table/), we would now like to display them on the Front office as a catalog. We will link a URL to a Front Controller which will be responsible to do a few database calls and then display the data through a Smarty Template.

The new URL will be <span class="lang:default decode:true crayon-inline">http://localhost/prestashop/my-pasta</span> .

## 1. Override the Dispatcher

You have to add your route in the overriden dispatcher (<span class="lang:default decode:true crayon-inline ">/override/classes/Dispatcher.php</span> ). Here, we are going to use <span class="lang:default decode:true crayon-inline ">/my-pasta</span>  as our endpoint URL.

<pre class="lang:php decode:true " title="/override/classes/Dispatcher.php">class Dispatcher extends DispatcherCore { 
  public function __construct(){ 
    $this-&gt;default_routes['use-a-unique-id-here'] = [
      'controller' =&gt; 'pasta', // will be linked to PastaController (see next section)
      'rule' =&gt; 'my-pasta', //  the actual URL without trailing slash
      'keywords' =&gt; [],
    ];
    parent::__construct();
  }
}
</pre>

Don&#8217;t forget to clear your Class Cache by removing <span class="lang:default decode:true crayon-inline">app/cache/prod/class_index.php</span>.

## 2. Create your Front Controller

It has to be in <span class="lang:default decode:true crayon-inline">/override/controller/front</span>:

<pre class="lang:php decode:true " title="/override/controllers/front/PastaController.php">class PastaController extends FrontController {
  public function initContent(){
    die('This is working!!');
  }
}</pre>

Don&#8217;t forget to clear your Class Cache by removing <span class="lang:default decode:true crayon-inline">app/cache/prod/class_index.php</span>.

Go to http://localhost/prestashop/my-pasta and you should hit the constructor of PastaController:

<img class="aligncenter size-full wp-image-655" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-the-Front-PastaController.jpg?resize=347%2C123&#038;ssl=1" alt="" width="347" height="123" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-the-Front-PastaController.jpg?w=347&ssl=1 347w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-the-Front-PastaController.jpg?resize=300%2C106&ssl=1 300w" sizes="(max-width: 347px) 100vw, 347px" data-recalc-dims="1" />

But&#8230; This is ugly. Let&#8217;s create a template 😎

## 3. Create your Template

The template file has to be in your theme, for example: <span class="lang:default decode:true crayon-inline">/themes/your_theme/templates/pasta-index.tpl</span>

<pre class="lang:default decode:true" title="/themes/your_theme/templates/pasta-index.tpl">{extends file='page.tpl'}

{block name='titre'}My tasty bits{/block}

{block name="breadcrumb"}{/block} &lt;!-- will remove the breadcrumb --&gt;

&lt;span class="pl-pse"&gt;{&lt;/span&gt;&lt;span class="pl-c1"&gt;block&lt;/span&gt; &lt;span class="pl-v"&gt;name=&lt;/span&gt;&lt;span class="pl-s"&gt;&lt;span class="pl-pds"&gt;'&lt;/span&gt;page_content&lt;span class="pl-pds"&gt;'&lt;/span&gt;&lt;/span&gt;&lt;span class="pl-pse"&gt;}&lt;/span&gt;
  &lt;h1&gt;This is the pasta-index.tpl served by PastaController.php!&lt;/h1&gt;
{/block}
</pre>

And update the controller accordingly:

<pre class="lang:php mark:3-4 decode:true" title="override/controllers/front/PastaController.php">class PastaController extends FrontController {
  public function initContent(){
    parent::initContent();
    $this-&gt;setTemplate('pasta-index');
  }
}
</pre>

Looks definitely better:

<img class="aligncenter size-full wp-image-658" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-pasta-index.tpl-served-by-Pasta-Controller.jpg?resize=525%2C221&#038;ssl=1" alt="" width="525" height="221" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-pasta-index.tpl-served-by-Pasta-Controller.jpg?w=1472&ssl=1 1472w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-pasta-index.tpl-served-by-Pasta-Controller.jpg?resize=300%2C127&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-pasta-index.tpl-served-by-Pasta-Controller.jpg?resize=768%2C324&ssl=1 768w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-pasta-index.tpl-served-by-Pasta-Controller.jpg?resize=1024%2C432&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

(Don&#8217;t forget to Set the Twig Cache to &#8220;Recompile templates if the files have been updated&#8221; in the Backoffice > Advanced Parameters > Performance)

That&#8217;s it!! You can use whatever content you fancy ⛱

## 4. Appendices

### 4.1 Fetch some content from the Database

Edit you Controller:

<pre class="lang:php mark:6-19 decode:true" title="override/controllers/front/PastaController.php">&lt;?php
class PastaController extends FrontController {
  public function initContent(){
    parent::initContent();
    $this-&gt;setTemplate('pasta-index');
    $pasta = (Db::getInstance())-&gt;executeS((new DbQuery())
      -&gt;from('pasta', 'p')-&gt;limit(15)
      -&gt;orderBy('p.created DESC')
    );
    $categories = (Db::getInstance())-&gt;executeS((new DbQuery())
      -&gt;from('category', 'c')
      -&gt;where('c.level_depth &gt; 1')
      -&gt;innerJoin('category_lang', 'cl', 'cl.id_category=c.id_category')
      -&gt;groupBy('c.id_category')
    );
    $this-&gt;context-&gt;smarty-&gt;assign([
      'pasta' =&gt; $pasta,
      'categories' =&gt; $categories,
    ]);
  }
}</pre>

and your template

<pre class="lang:default range:7-34 decode:true " title="/themes/your_theme/templates/pasta-index.tpl">{extends file='page.tpl'}

{block name='titre'}My tasty bits{/block}

{block name="breadcrumb"}{/block} &lt;!-- will remove the breadcrumb --&gt;

{block name='page_content'}
  &lt;h4&gt;This is the pasta-index.tpl served by PastaController.php!&lt;/h4&gt;
  &lt;h5&gt;1. Categories&lt;/h5&gt;
  &lt;ol&gt;
    {foreach $categories as $category}
      &lt;li&gt;{$category.name}&lt;/li&gt;
    {/foreach}
  &lt;/ol&gt;
  &lt;h5&gt;2. Pasta&lt;/h5&gt;
  &lt;table class="table table-bordered table-sm table-striped"&gt;
    &lt;thead&gt;
      &lt;tr&gt;
        &lt;th&gt;ID&lt;/th&gt;
        &lt;th&gt;SKU&lt;/th&gt;
        &lt;th&gt;Name&lt;/th&gt;
      &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
      {foreach $pasta as $p}
        &lt;tr&gt;
          &lt;td&gt;{$p.id}&lt;/td&gt;
          &lt;td&gt;{$p.sku}&lt;/td&gt;
          &lt;td&gt;{$p.name}&lt;/td&gt;
        &lt;/tr&gt;
      {/foreach}
    &lt;/tbody&gt;
  &lt;/table&gt;
{/block}
</pre>

You now have some templated data in your completely new Front Page:

<img class="aligncenter size-full wp-image-661" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Pasta-displayed-with-templated-data-from-new-Front-Controller.jpg?resize=525%2C303&#038;ssl=1" alt="" width="525" height="303" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Pasta-displayed-with-templated-data-from-new-Front-Controller.jpg?w=1527&ssl=1 1527w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Pasta-displayed-with-templated-data-from-new-Front-Controller.jpg?resize=300%2C173&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Pasta-displayed-with-templated-data-from-new-Front-Controller.jpg?resize=768%2C443&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Pasta-displayed-with-templated-data-from-new-Front-Controller.jpg?resize=1024%2C590&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

More info on the Db/DbQuery classes in this [tutorial about avoiding raw SQL with Prestashop](https://floriancourgey.com/2018/04/use-db-the-database-class-in-prestashop-1-7/).

### 4.2 Redirect the customer if not logged (non-guest area)

You can update your controller to only allow registered customers to view this page with a few checks on <span class="lang:php decode:true crayon-inline">$this->context->customer</span>

<pre class="lang:default mark:5-8 decode:true ">class PastaController extends FrontController {
  public function initContent(){
    parent::initContent();
    $this-&gt;setTemplate('pasta-index');
    $customer = $this-&gt;context-&gt;customer;
    if(!$customer || !$customer-&gt;isLogged()){
      return Tools::redirect('index.php?controller=authentication&back=pasta');
    }
  }
}
</pre>

Refresh your page, and you are being redirected to the login! Log in, and you will be presented with the front Pasta page.

<img class="aligncenter size-full wp-image-665" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Front-Controller-redirects-to-login-to-force-registered-customers.jpg?resize=525%2C255&#038;ssl=1" alt="" width="525" height="255" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Front-Controller-redirects-to-login-to-force-registered-customers.jpg?w=1531&ssl=1 1531w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Front-Controller-redirects-to-login-to-force-registered-customers.jpg?resize=300%2C146&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Front-Controller-redirects-to-login-to-force-registered-customers.jpg?resize=768%2C373&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Front-Controller-redirects-to-login-to-force-registered-customers.jpg?resize=1024%2C498&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

More info on [how to redirect with Prestashop (from front and back)](https://floriancourgey.com/2018/04/redirects-in-prestashop-1-7/).

### 4.3 Use the GET parameters from URL

<pre class="lang:php decode:true ">// todo</pre>

### 4.4 Use Twig instead of Smarty 🌱🌿

<pre class="lang:php decode:true">// todo</pre>

<img class="aligncenter" src="https://i2.wp.com/media.giphy.com/media/pCO5tKdP22RC8/giphy.gif?w=525&#038;ssl=1" data-recalc-dims="1" />