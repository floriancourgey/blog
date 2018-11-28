---
id: 339
title: Squelette pour module Prestashop 1.7
date: 2018-04-16T14:26:35+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=339
permalink: /2018/04/squelette-pour-module-prestashop-1-7/
kc_data:
  - 'a:8:{i:0;s:0:"";s:4:"mode";s:0:"";s:3:"css";s:0:"";s:9:"max_width";s:0:"";s:7:"classes";s:0:"";s:9:"thumbnail";s:0:"";s:9:"collapsed";s:0:"";s:9:"optimized";s:0:"";}'
categories:
  - prestashop
  - prestashop 1.7
---
  1. Basic
  2. Add a config page
  3. Make it multi shop
  4. Good practices for Dabatabse install/uninstall
  5. Work with a Composer library

# Most basic

<pre class="">- modules
  - fc_redirect
    - fc_redirect.php</pre>

<pre class="lang:php decode:true" title="fc_redirect.php">if (!defined('_PS_VERSION_')) {exit;}
class Fc_Redirect extends Module { 
      public function __construct() { 
      $this-&gt;name = 'fc_redirect';
      $this-&gt;tab = 'administration';
      $this-&gt;version = '1.0.0';
      $this-&gt;author = 'Florian Courgey';
      $this-&gt;bootstrap = true;
      parent::__construct();
      $this-&gt;displayName = $this-&gt;l('PrestaShop Redirect by FC');
      $this-&gt;description = $this-&gt;l('Improve your store by avoiding 404 errors and redirecting customers to existing pages!');
      $this-&gt;ps_versions_compliancy = array('min' =&gt; '1.7', 'max' =&gt; _PS_VERSION_);
  }

  public function install(){
      return (
          parent::install() &&
          $this-&gt;registerHook('actionDispatcher')
      );
  }

  public function hookActionDispatcher($params = []){
      if(!$this-&gt;context || !$this-&gt;context-&gt;controller){
        return;
      }
      // do things!
  }
}</pre>

All hooks <http://build.prestashop.com/news/new-updated-hooks-1-7-1-0/>

# Add a config page

must have `getContent()` method

<pre class="lang:php decode:true ">// define your confuguration keys + default value here
  const CONFS = [
    'FCSENTRY_DSN' =&gt; '',
    'FCSENTRY_ALLOW_BO' =&gt; true,
  ];
  // define a value for your form submit button
  const SUBMIT = 'submitFcSlack';

 public function getContent(){
   if (((bool)Tools::isSubmit(self::SUBMIT)) == true) {
     $this-&gt;postProcess(); // see at the bottom
   }
   return $this-&gt;renderForm(); // see below
 }

  /**
   * Create the form that will be displayed in the configuration of your module.
   */
  protected function renderForm()
  {
      $helper = new HelperForm();

      $helper-&gt;show_toolbar = false;
      $helper-&gt;table = $this-&gt;table;
      $helper-&gt;module = $this;
      $helper-&gt;default_form_language = $this-&gt;context-&gt;language-&gt;id;
      $helper-&gt;allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG', 0);

      $helper-&gt;identifier = $this-&gt;identifier;
      $helper-&gt;submit_action = self::SUBMIT;
      $helper-&gt;currentIndex = $this-&gt;context-&gt;link-&gt;getAdminLink('AdminModules', false)
          .'&configure='.$this-&gt;name.'&tab_module='.$this-&gt;tab.'&module_name='.$this-&gt;name;
      $helper-&gt;token = Tools::getAdminTokenLite('AdminModules');

      $helper-&gt;tpl_vars = array(
          'fields_value' =&gt; $this-&gt;getConfigFormValues(), // see below
          'languages' =&gt; $this-&gt;context-&gt;controller-&gt;getLanguages(),
          'id_language' =&gt; $this-&gt;context-&gt;language-&gt;id,
      );

      return $helper-&gt;generateForm(array($this-&gt;getConfigForm())); // see below
  }


  /**
   * Set values for the inputs.
   */
  protected function getConfigFormValues(){
      $return = [];
      foreach (self::CONFS as $key =&gt; $default) {
        $return[$key] = Configuration::get($key, $default);
      }
      return $return;
  }


protected function getConfigForm()
  {
      return array(
          'form' =&gt; array(
              'legend' =&gt; array(
              'title' =&gt; $this-&gt;l('Settings'),
              'icon' =&gt; 'icon-cogs',
              ),
              'input' =&gt; array(
                  // string input
                  array(
                      'col' =&gt; 8,
                      'type' =&gt; 'text',
                      'desc' =&gt; $this-&gt;l('Use the DSN provided by Sentry.io. Documentation here https://docs.sentry.io/quickstart/#about-the-dsn'),
                      'name' =&gt; 'FCSENTRY_DSN',
                      'label' =&gt; $this-&gt;l('DSN'),
                      'required' =&gt; true,
                  ),
                  // boolean input
                  array(
                      'type' =&gt; 'switch',
                      'label' =&gt; $this-&gt;l('Allow in Backoffice'),
                      'name' =&gt; 'FCSENTRY_ALLOW_BO',
                      'is_bool' =&gt; true,
                      'desc' =&gt; $this-&gt;l('Disable sentry if controller extends AdminController'),
                      'values' =&gt; array(
                          array(
                              'id' =&gt; 'active_on',
                              'value' =&gt; true,
                              'label' =&gt; $this-&gt;l('Enabled')
                          ),
                          array(
                              'id' =&gt; 'active_off',
                              'value' =&gt; false,
                              'label' =&gt; $this-&gt;l('Disabled')
                          )
                      ),
                  ),
               ), // end 'input'
               'submit' =&gt; array(
                 'title' =&gt; $this-&gt;l('Save'),
               ),
            ), // end 'form'
       );
    }


protected function postProcess(){
      $form_values = $this-&gt;getConfigFormValues();

      foreach (array_keys($form_values) as $key) {
          Configuration::updateValue($key, Tools::getValue($key));
      }
  }</pre>

Don&#8217;t forget to update your install/uninstall methods:

<pre class="lang:php decode:true">public function install()
  {
      foreach (self::CONFS as $key =&gt; $default) {
        Configuration::updateValue($key, $default);
      }
      return (
          parent::install() &&
          $this-&gt;registerHook('actionDispatcher')
      );
  }

public function uninstall(){
    $return = true;
    foreach (self::CONFS as $key =&gt; $default) {
      $return = $return && Configuration::deleteByName($key);
    }
    return (
      $return &&
      parent::uninstall()
    );
  }</pre>

&nbsp;

# Make it multishop

&nbsp;

# Good practices for Database install/uninstall

taken from <https://github.com/PrestaShop/gamification>

<pre class="lang:php decode:true" title="module.php">/**
 * DATABASE INSTALL/UNINSTALL
 */
 public function installDb()
 {
   $return = true;
   include(dirname(__FILE__).'/sql_install.php');
   foreach ($sql as $s) {
     $return &= Db::getInstance()-&gt;execute($s);
   }
   return $return;
 }
 
 public function uninstallDb()
 {
   include(dirname(__FILE__).'/sql_install.php');
   foreach ($sql as $name =&gt; $v) {
     Db::getInstance()-&gt;execute('DROP TABLE '.$name);
   }
   return true;
 }</pre>

<pre class="lang:php decode:true " title="sql_install.php">$sql = [];
$sql[_DB_PREFIX_.'badge'] =
 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'badge` (
 `id_badge` int(11) NOT NULL AUTO_INCREMENT,
 `type` varchar(32) NOT NULL,
 `awb` INT NULL DEFAULT \'0\',
 `validated` tinyint(1) unsigned NOT NULL DEFAULT 0,
 PRIMARY KEY (`id_badge`)
 ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8;';</pre>

# Work with a Composer library

Go to your module directory /modules/my_module

<span class="lang:sh decode:true crayon-inline ">composer require maknz/slack</span>

will create a <span class="lang:default decode:true crayon-inline ">vendor </span> dir, with an <span class="lang:default decode:true crayon-inline ">autoload.php</span>  inside

So just do a <span class="lang:php decode:true crayon-inline">require_once __DIR__.&#8217;/vendor/autoload.php&#8217;;</span>

<pre class="lang:php decode:true">require_once __DIR__.'/vendor/autoload.php';

if (!defined('_PS_VERSION_')) {exit;}
class Fc_Slack extends Module {
  public function __construct() {
    
  }
}</pre>

&nbsp;