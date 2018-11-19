---
id: 993
title: Module Login as customer in Prestashop 1.6, 1.7
date: 2018-09-11T00:33:28+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=993
permalink: /2018/09/module-login-as-customer-in-prestashop-1-6-1-7/
tinymce-comment-field_enabled:
  - "1"
categories:
  - github
  - opensource
  - prestashop
  - prestashop 1.6
  - prestashop 1.7
---
With this module, as an admin you are now able to login as a customer in order to make orders, payments and edits to his profile. Source code included, open source.

<!--more-->

<img class="aligncenter size-full wp-image-995" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/09/FC-Login-as-Customer-module-prestashop.png?resize=525%2C171&#038;ssl=1" alt="" width="525" height="171" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/09/FC-Login-as-Customer-module-prestashop.png?w=1582&ssl=1 1582w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/09/FC-Login-as-Customer-module-prestashop.png?resize=300%2C97&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/09/FC-Login-as-Customer-module-prestashop.png?resize=768%2C250&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/09/FC-Login-as-Customer-module-prestashop.png?resize=1024%2C333&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

The module consists in 2 files: the main module file <span class="lang:default decode:true  crayon-inline ">Fc_LoginAsCustomer</span>  and the front controller file <span class="lang:default decode:true  crayon-inline">Fc_LoginAsCustomerLoginModuleFrontController</span>

## Step 1. Create the main module

Create the main module file in <span class="lang:default decode:true  crayon-inline ">/modules/fc_loginascustomer/fc_loginascustomer.php</span> :

<pre class="lang:php decode:true" title="/modules/fc_loginascustomer/fc_loginascustomer.php">&lt;?php
if (!defined('_PS_VERSION_'))
  exit;

class Fc_LoginAsCustomer extends Module {

  public function __construct(){
    $this-&gt;name = 'fc_loginascustomer';
    $this-&gt;tab = 'back_office_features';
    $this-&gt;version = '1.0.0';
    $this-&gt;author = 'Florian Courgey';
    $this-&gt;controllers = ['login'];

    $this-&gt;bootstrap = true;
    parent::__construct();

    $this-&gt;displayName = $this-&gt;l('FC Login as customer');
    $this-&gt;description = $this-&gt;l('Allows you login as customer');

    $this-&gt;ps_versions_compliancy = array('min' =&gt; '1.6', 'max' =&gt; _PS_VERSION_);
  }

  public function install(){
    return (
      parent::install() &&
      $this-&gt;registerHook('displayAdminCustomers')
    );
  }

  public function hookDisplayAdminCustomers($params){
    $customer = New CustomerCore ((int)Tools::getValue("id_customer"));
    $link = $this-&gt;context-&gt;link-&gt;getModuleLink($this-&gt;name, 'login', [
      'id_customer' =&gt; $customer-&gt;id,
      'xtoken' =&gt; $this-&gt;makeToken($customer-&gt;id)
    ]);
   if(!Validate::isLoadedObject($customer)){
      return;
    }
    return '&lt;div class="panel"&gt;
              &lt;div class="panel-heading"&gt;
                &lt;i class="icon-file"&gt;&lt;/i&gt; '.$this-&gt;l("FC Login As Customer").' v'.$this-&gt;version.'
              &lt;/div&gt;
              &lt;p class="text-center"&gt;
                &lt;a class="btn btn-default" href="'.$link.'" target="_blank"&gt;
                  &lt;i class="icon-user"&gt;&lt;/i&gt; '.$this-&gt;l("Login as customer").' '.$customer-&gt;email.'
                &lt;/a&gt;
              &lt;/p&gt;
          &lt;/div&gt;';
  }

  public function makeToken($id_customer) {
    return md5(_COOKIE_KEY_.$id_customer.date("Ymd"));
  }
}
</pre>

## Step 2. The Front Controller

and the Front controller in <span class="lang:default decode:true  crayon-inline">/modules/fc_loginascustomer/controllers/front/login.php</span>:

<pre class="lang:default decode:true " title="/modules/fc_loginascustomer/controllers/front/login.php@">&lt;?php

class Fc_LoginAsCustomerLoginModuleFrontController extends ModuleFrontControllerCore {
  public $ssl = true;

  public function postProcess() {
    parent::postProcess();
    $id_customer = (int)Tools::getValue('id_customer');
    if(!$id_customer || $id_customer &lt; 0){
      die('bad $id_customer');
    }
    $xTokenOk = Tools::getValue('xtoken') == $this-&gt;module-&gt;makeToken($id_customer);
    if(!$xTokenOk){
      die('bad xtoken');
    }
    $customer = new Customer($id_customer);
    if (!Validate::isLoadedObject($customer)){
      die('bad customer object');
    }
    $customer-&gt;logged = 1;
    $this-&gt;context-&gt;customer = $customer;
    $this-&gt;context-&gt;cookie-&gt;id_customer = $customer-&gt;id;
    $this-&gt;context-&gt;cookie-&gt;customer_lastname = $customer-&gt;lastname;
    $this-&gt;context-&gt;cookie-&gt;customer_firstname = $customer-&gt;firstname;
    $this-&gt;context-&gt;cookie-&gt;logged = 1;
    $this-&gt;context-&gt;cookie-&gt;check_cgv = 1;
    $this-&gt;context-&gt;cookie-&gt;is_guest = $customer-&gt;isGuest();
    $this-&gt;context-&gt;cookie-&gt;passwd = $customer-&gt;passwd;
    $this-&gt;context-&gt;cookie-&gt;email = $customer-&gt;email;
    Tools::redirect('index.php?controller=my-account');
  }
}
</pre>

_Source <https://www.prestashop.com/forums/topic/444031-free-module-login-as-customer/> refactored, cleaned and simplified._