---
id: 390
title: 'Create a new front controller from scratch (Part 2/2) [Prestashop 1.7]'
date: 2018-04-23T16:01:18+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=390
permalink: /2018/04/how-to-create-a-new-front-controller-for-prestashop-1-7/
categories:
  - opensource
  - prestashop
  - prestashop 1.7
---
Prestashop can be used to display any page that you want. Either it's pure HTML or templated data with Smarty, or even Twig since Prestashop 1.7! In this tutorial, we will create front controller to get a new URL to display organized data from the database.

<!--more-->

## Objective

As we've already created [a nice backoffice for our pasta here](https://floriancourgey.com/2018/05/create-an-admin-for-a-customized-sql-table/), we would now like to display them on the Front office as a catalog. We will link a URL to a Front Controller which will be responsible to do a few database calls and then display the data through a Smarty Template.

The new URL will be `http://localhost/prestashop/my-pasta`.

## 1. Override the Dispatcher

You have to add your route in the overriden dispatcher (`/override/classes/Dispatcher.php`). Here, we are going to use `/my-pasta` as our endpoint URL.

```php
class Dispatcher extends DispatcherCore {
  public function __construct(){
    $this->default_routes['use-a-unique-id-here'] = [
      'controller' => 'pasta', // will be linked to PastaController (see next section)
      'rule' => 'my-pasta', //  the actual URL without trailing slash
      'keywords' => [],
    ];
    parent::__construct();
  }
}
```

Don't forget to clear your Class Cache by removing `app/cache/prod/class_index.php`.

## 2. Create your Front Controller

It has to be in `/override/controller/front`:

`/override/controllers/front/PastaController.php`
```php
class PastaController extends FrontController {
  public function initContent(){
    die('This is working!!');
  }
}
```

Don't forget to clear your Class Cache by removing `app/cache/prod/class_index.php`.

Go to http://localhost/prestashop/my-pasta and you should hit the constructor of PastaController:

<img class="aligncenter size-full wp-image-655" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-the-Front-PastaController.jpg?resize=347%2C123&#038;ssl=1" alt="" width="347" height="123" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-the-Front-PastaController.jpg?w=347&ssl=1 347w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-the-Front-PastaController.jpg?resize=300%2C106&ssl=1 300w" sizes="(max-width: 347px) 100vw, 347px" data-recalc-dims="1" />

But... This is ugly. Let's create a template 😎

## 3. Create your Template

The template file has to be in your theme, for example: `/themes/your_theme/templates/pasta-index.tpl`

```html
{extends file='page.tpl'}

{block name='titre'}My tasty bits{/block}

{block name="breadcrumb"}{/block} <!-- will remove the breadcrumb -->

{block name='page_content'}
  <h1>This is the pasta-index.tpl served by PastaController.php!</h1>
{/block}
```

And update the controller accordingly:

```php
class PastaController extends FrontController {
  public function initContent(){
    parent::initContent();
    $this->setTemplate('pasta-index');
  }
}
```

Looks definitely better:

<img class="aligncenter size-full wp-image-658" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-pasta-index.tpl-served-by-Pasta-Controller.jpg?resize=525%2C221&#038;ssl=1" alt="" width="525" height="221" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-pasta-index.tpl-served-by-Pasta-Controller.jpg?w=1472&ssl=1 1472w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-pasta-index.tpl-served-by-Pasta-Controller.jpg?resize=300%2C127&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-pasta-index.tpl-served-by-Pasta-Controller.jpg?resize=768%2C324&ssl=1 768w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/04/This-is-pasta-index.tpl-served-by-Pasta-Controller.jpg?resize=1024%2C432&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

(Don't forget to Set the Twig Cache to `Recompile templates if the files have been updated` in the Backoffice > Advanced Parameters > Performance)

That's it!! You can use whatever content you fancy ⛱

## 4. Appendices

### 4.1 Fetch some content from the Database

Edit you Controller:

`override/controllers/front/PastaController.php`


```php
<?php
class PastaController extends FrontController {
  public function initContent(){
    parent::initContent();
    $this->setTemplate('pasta-index');
    $pasta = (Db::getInstance())->executeS((new DbQuery())
      ->from('pasta', 'p')->limit(15)
      ->orderBy('p.created DESC')
    );
    $categories = (Db::getInstance())->executeS((new DbQuery())
      ->from('category', 'c')
      ->where('c.level_depth > 1')
      ->innerJoin('category_lang', 'cl', 'cl.id_category=c.id_category')
      ->groupBy('c.id_category')
    );
    $this->context->smarty->assign([
      'pasta' => $pasta,
      'categories' => $categories,
    ]);
  }
}
```

and your template

`/themes/your_theme/templates/pasta-index.tpl`
```html
{extends file='page.tpl'}

{block name='titre'}My tasty bits{/block}

{block name="breadcrumb"}{/block} <!-- will remove the breadcrumb -->

{block name='page_content'}
  <h4>This is the pasta-index.tpl served by PastaController.php!</h4>
  <h5>1. Categories</h5>
  <ol>
    {foreach $categories as $category}
      <li>{$category.name}</li>
    {/foreach}
  </ol>
  <h5>2. Pasta</h5>
  <table class="table table-bordered table-sm table-striped">
    <thead>
      <tr>
        <th>ID</th>
        <th>SKU</th>
        <th>Name</th>
      </tr>
    </thead>
    <tbody>
      {foreach $pasta as $p}
        <tr>
          <td>{$p.id}</td>
          <td>{$p.sku}</td>
          <td>{$p.name}</td>
        </tr>
      {/foreach}
    </tbody>
  </table>
{/block}
```

You now have some templated data in your completely new Front Page:

<img class="aligncenter size-full wp-image-661" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Pasta-displayed-with-templated-data-from-new-Front-Controller.jpg?resize=525%2C303&#038;ssl=1" alt="" width="525" height="303" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Pasta-displayed-with-templated-data-from-new-Front-Controller.jpg?w=1527&ssl=1 1527w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Pasta-displayed-with-templated-data-from-new-Front-Controller.jpg?resize=300%2C173&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Pasta-displayed-with-templated-data-from-new-Front-Controller.jpg?resize=768%2C443&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Pasta-displayed-with-templated-data-from-new-Front-Controller.jpg?resize=1024%2C590&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

More info on the `Db`/`DbQuery` classes in this [tutorial about avoiding raw SQL with Prestashop](https://floriancourgey.com/2018/04/use-db-the-database-class-in-prestashop-1-7/).

### 4.2 Redirect the customer if not logged (non-guest area)

You can update your controller to only allow registered customers to view this page with a few checks on `$this->context->customer`

```php
class PastaController extends FrontController {
  public function initContent(){
    parent::initContent();
    $this->setTemplate('pasta-index');
    $customer = $this->context->customer;
    if(!$customer || !$customer->isLogged()){
      return Tools::redirect('index.php?controller=authentication&back=pasta');
    }
  }
}
```

Refresh your page, and you are being redirected to the login! Log in, and you will be presented with the front Pasta page.

<img class="aligncenter size-full wp-image-665" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Front-Controller-redirects-to-login-to-force-registered-customers.jpg?resize=525%2C255&#038;ssl=1" alt="" width="525" height="255" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Front-Controller-redirects-to-login-to-force-registered-customers.jpg?w=1531&ssl=1 1531w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Front-Controller-redirects-to-login-to-force-registered-customers.jpg?resize=300%2C146&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Front-Controller-redirects-to-login-to-force-registered-customers.jpg?resize=768%2C373&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/04/Front-Controller-redirects-to-login-to-force-registered-customers.jpg?resize=1024%2C498&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

More info on [how to redirect with Prestashop (from front and back)](https://floriancourgey.com/2018/04/redirects-in-prestashop-1-7/).

### 4.3 Use the GET parameters from URL

<pre class="lang:php decode:true ">// todo</pre>

### 4.4 Use Twig instead of Smarty 🌱🌿

<pre class="lang:php decode:true">// todo</pre>

<img class="aligncenter" src="https://i2.wp.com/media.giphy.com/media/pCO5tKdP22RC8/giphy.gif?w=525&#038;ssl=1" data-recalc-dims="1" />
