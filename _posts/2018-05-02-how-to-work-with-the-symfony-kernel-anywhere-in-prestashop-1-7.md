---
id: 453
title: How to work with the symfony kernel anywhere in Prestashop 1.7
date: 2018-05-02T14:22:54+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=453
permalink: /2018/05/how-to-work-with-the-symfony-kernel-anywhere-in-prestashop-1-7/
kc_data:
  - 'a:8:{i:0;s:0:"";s:4:"mode";s:0:"";s:3:"css";s:0:"";s:9:"max_width";s:0:"";s:7:"classes";s:0:"";s:9:"thumbnail";s:0:"";s:9:"collapsed";s:0:"";s:9:"optimized";s:0:"";}'
categories:
  - opensource
---
You want to fully tak advantage of symfony in your Prestashop application? Use the symfony kernel! By default, the $kernel variable is only available in the Backoffice section, but here&#8217;s a tuto on how to use it also on the Frontoffice. Once the kernel is set up, you can use any symfony services, such as Doctrine, Twig, Monolog! Awesome 😃

Let&#8217;s see first how to do it on the backoffice, because it&#8217;s a one-liner, and then in the front office, because it requires a little more work. And at the end, we&#8217;ll see how to wrap it up in a module, to be always available!

<!--more-->

## In the backoffice

<pre class="lang:php decode:true">global $kernel;
// that's it!! Now you can use
$kernel-&gt;getContainer()-&gt;get('twig')-&gt;render(...)</pre>

&nbsp;

## In the frontoffice

The kernel is not set up in the front, but it can be booted with:

<pre class="lang:php decode:true ">require_once _PS_ROOT_DIR_.'/app/AppKernel.php';
$env = 'prod';// or you can use _PS_MODE_DEV_ ? 'dev' : 'prod';
$debug = false;// or you can use _PS_MODE_DEV_ ? true : false;
$kernel = new \AppKernel($env, $debug);
$kernel-&gt;boot();
// that's it!! Now you can use
$kernel-&gt;getContainer()-&gt;get('twig')-&gt;render(...)</pre>

&nbsp;

## Refactorisation in a module to be available anywhere

<pre class="lang:php decode:true  " title="/modules/mymodule/MyModule.php">class MyModule extends Module {
    public static $kernel = null;
    public static $doctrine = null;
    public static function getKernel(){
      // if the singleton doesn't exist
      if(!self::$kernel){
        // try to load it globally (for backoffice pages)
        global $kernel;
        if($kernel){
          self::$kernel = $kernel;
        } 
        // otherwise create it manually
        else {
          require_once _PS_ROOT_DIR_.'/app/AppKernel.php';
          $env = 'prod';//_PS_MODE_DEV_ ? 'dev' : 'prod';
          $debug = false;//_PS_MODE_DEV_ ? true : false;
          self::$kernel = new \AppKernel($env, $debug);
          self::$kernel-&gt;boot();
        }
      }
      return self::$kernel;
    }
    public static function getDoctrine(){
      if(!self::$doctrine){
        self::$doctrine = self::getKernel()-&gt;getContainer()-&gt;get('doctrine')-&gt;getManager();
      }
      return self::$doctrine;
    }
    public static function get($service){
      return self::getKernel()-&gt;getContainer()-&gt;get($service);
    }

}</pre>

And use it anywhere:

<pre class="lang:default decode:true ">MyModule::getDoctrine()
MyModule::get('twig')
MyModule::getKernel()-&gt;getContainer()-&gt;get('twig')</pre>

&nbsp;

&nbsp;