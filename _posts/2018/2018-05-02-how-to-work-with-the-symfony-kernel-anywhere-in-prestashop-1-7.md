---
title: How to work with the symfony kernel anywhere in Prestashop 1.7
permalink: /2018/05/how-to-work-with-the-symfony-kernel-anywhere-in-prestashop-1-7/
categories: [opensource, symfony, kernel]
---

You want to fully tak advantage of symfony in your Prestashop application? Use the symfony kernel! By default, the $kernel variable is only available in the Backoffice section, but here's a tuto on how to use it also on the Frontoffice. Once the kernel is set up, you can use any symfony services, such as Doctrine, Twig, Monolog! Awesome 😃

Let's see first how to do it on the backoffice, because it's a one-liner, and then in the front office, because it requires a little more work. And at the end, we'll see how to wrap it up in a module, to be always available!

<!--more-->

## In the backoffice

```php
global $kernel;
// that's it!! Now you can use
$kernel->getContainer()->get('twig')->render(...)
```

## In the frontoffice

The kernel is not set up in the front, but it can be booted with:

```php
require_once _PS_ROOT_DIR_.'/app/AppKernel.php';
$env = 'prod';// or you can use _PS_MODE_DEV_ ? 'dev' : 'prod';
$debug = false;// or you can use _PS_MODE_DEV_ ? true : false;
$kernel = new \AppKernel($env, $debug);
$kernel->boot();
// that's it!! Now you can use
$kernel->getContainer()->get('twig')->render(...)
```

## Refactorisation in a module to be available anywhere

```php
//modules/mymodule/MyModule.php
class MyModule extends Module {
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
          self::$kernel->boot();
        }
      }
      return self::$kernel;
    }
    public static function getDoctrine(){
      if(!self::$doctrine){
        self::$doctrine = self::getKernel()->getContainer()->get('doctrine')->getManager();
      }
      return self::$doctrine;
    }
    public static function get($service){
      return self::getKernel()->getContainer()->get($service);
    }

}
```

And use it anywhere:

```php
MyModule::getDoctrine()
MyModule::get('twig')
MyModule::getKernel()->getContainer()->get('twig')
```
