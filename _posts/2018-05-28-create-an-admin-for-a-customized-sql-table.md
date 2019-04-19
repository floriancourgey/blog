---
title: 'Create an Admin Controller for a customized SQL table (Part 1/2) [Prestashop 1.7]'
permalink: /2018/05/create-an-admin-for-a-customized-sql-table/
categories: [opensource, prestashop, prestashop 1.7]
---

Prestashop has developed great admin interface : data table, filters, edit/create form, etc. But you know what? You can re-use this UI for your own SQL table. This tutorial will walk through it.


![](/assets/images/2018/05/Admin-Controller-Cover.jpg)

If you want to [edit an already existing Object such as your invoices, head over to this tutorial](https://floriancourgey.com/2018/04/admin-controller-in-module-prestashop-1-7/).

This is the part 1 of a Series to customize Prestashop in depth. [Follow this link for the tutorial 2 about creating the Front Controller (Part 2/2)](https://floriancourgey.com/2018/04/how-to-create-a-new-front-controller-for-prestashop-1-7/).

<!--more-->

## Objective

We are going to be able to create, read, update and delete a customized SQL table. Let's take some pastas as an example.

We will be using this SQL Dataset [setup.sql](https://floriancourgey.com/wp-content/uploads/2018/05/setup.sql_.txt) (taken from the CSV [dh\_product\_lookup.csv](https://floriancourgey.com/wp-content/uploads/2018/05/dh_product_lookup.csv), from the website <https://www.dunnhumby.com/sourcefiles>).

Let's use the pasta database:

```sql
CREATE TABLE pasta (
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
-- find all the SQL setup in https://floriancourgey.com/wp-content/uploads/2018/05/dh_product_lookup.csv
```

## Step 1: Create your PHP class

Folder does not matter, all properties as `public`, `extends ObjectModel`, use `public static $definition` to define your SQL fields.

For example I like to use use `/override/classes/my_dir`. This way, it will stay even if Prestashop is updated, and can be included in a git repository.

```php
<?php
class Pasta extends ObjectModel {
  public $id;
  public $sku;
  public $name;
  public $created;
  public static $definition = [
    'table' => 'pasta',
    'primary' => 'id',
    'fields' => [
      'sku' =>  ['type' => self::TYPE_STRING, 'validate' => 'isAnything', 'required'=>true],
      'name' =>  ['type' => self::TYPE_STRING, 'validate' => 'isAnything', 'required'=>true],
      'created' =>  ['type' => self::TYPE_DATE, 'validate' => 'isDateFormat'],
    ],
  ];
}
```

## Step 2: Create your Admin Controller

AdminController can only be created inside a Module. Let's create a dummy module first in `modules/my_module/my_module.php`:

```php
<?php
if (!defined('_PS_VERSION_')) {exit;}
class My_Module extends Module {
  public function __construct() {
      $this->name = 'my_module';
      $this->tab = 'administration';
      $this->version = '1.0.0';
      $this->author = 'Florian Courgey';
      $this->bootstrap = true;
      parent::__construct();
      $this->displayName = $this->l('PrestaShop Module by FC');
      $this->description = $this->l('Improve your store by [...]');
      $this->ps_versions_compliancy = ['min' => '1.7', 'max' => _PS_VERSION_];
  }
}
```

Activate it through the PrestShop Backoffice by looking for "my_module":

![](/assets/images/2018/05/search-for-my_module-in-the-backoffice-annote.jpg)

and then create the bare minimum in an Admincontroller in `modules/my_module/controllers/admin/AdminPastaController.php`, which `extends ModuleAdminController`

```php
<?php
require_once _PS_ROOT_DIR_.'/override/classes/my_dir/Pasta.php';

class AdminPastaController extends ModuleAdminController {
  public function __construct(){
      parent::__construct();
      $this->bootstrap = true; // use Bootstrap CSS
      $this->table = 'pasta'; // SQL table name, will be prefixed with _DB_PREFIX_
      $this->identifier = 'id'; // SQL column to be used as primary key
      $this->className = 'Pasta'; // PHP class name
      $this->allow_export = true; // allow export in CSV, XLS..
  }
}
```

Head to <http://localhost/admin-dev/index.php?controller=AdminPasta> and you should now have an empty AdminController:

![](/assets/images/2018/05/empty-AdminController-PastaController.jpg)

## Step 3: Configure your Admin Controller

Now all the customization will be executed in the AdminController only. Let's start by adding the list with `$this->fields_list`:

```php
<?php
require_once _PS_ROOT_DIR_.'/override/classes/my_dir/Pasta.php';

class AdminPastaController extends ModuleAdminController {
  public function __construct(){
    parent::__construct();
    $this->bootstrap = true; // use Bootstrap CSS
    $this->table = 'pasta'; // SQL table name, will be prefixed with _DB_PREFIX_
    $this->identifier = 'id'; // SQL column to be used as primary key
    $this->className = 'Pasta'; // PHP class name
    $this->allow_export = true; // allow export in CSV, XLS..

    $this->_defaultOrderBy = 'a.created'; // the table alias is always `a`
    $this->_defaultOrderWay = 'DESC';
    $this->fields_list = [
        'id' => ['title' => 'ID','class' => 'fixed-width-xs'],
        'sku' => ['title' => 'SKU'],
        'name' => ['title' => 'Name'],
        'created' => ['title' => 'Created','type'=>'datetime'],
    ];
  }

  // As our SQL table doesn't use the _DB_PREFIX_, we have to remove it from the WHERE clause
  protected function getFromClause() {
      return str_replace(_DB_PREFIX_, '', parent::getFromClause());
  }
}
```

This gives us a wonderful table with export, filters, orders and pagination:

![](/assets/images/2018/05/AdminController-with-list-only-2.jpg)

## 4. Create, edit and delete your Custom Object

But we still cannot create or edit our object. We have to add a new part in our controller with `$this->fileds_form`:

```php
<?php
require_once _PS_ROOT_DIR_.'/override/classes/my_dir/Pasta.php';

class AdminPastaController extends ModuleAdminController {
  public function __construct(){
    parent::__construct();
    $this->bootstrap = true; // use Bootstrap CSS
    $this->table = 'pasta'; // SQL table name, will be prefixed with _DB_PREFIX_
    $this->identifier = 'id'; // SQL column to be used as primary key
    $this->className = 'Pasta'; // PHP class name
    $this->allow_export = true; // allow export in CSV, XLS..

    $this->_defaultOrderBy = 'a.created'; // the table alias is always `a`
    $this->_defaultOrderWay = 'DESC';
    $this->fields_list = [
        'id' => ['title' => 'ID','class' => 'fixed-width-xs'],
        'sku' => ['title' => 'SKU'],
        'name' => ['title' => 'Name'],
        'created' => ['title' => 'Created','type'=>'datetime'],
    ];

    $this->addRowAction('edit');
    $this->addRowAction('details');
    $this->fields_form = [
      'legend' => [
        'title' => 'Pasta',
        'icon' => 'icon-list-ul'
      ],
      'input' => [
        ['name'=>'sku','type'=>'text','label'=>'SKU','required'=>true,],
        ['name'=>'name','type'=>'text','label'=>'Name','required'=>true],
        ['name'=>'created','type'=>'text','label'=>'Created','suffix'=>'YYYY-MM-DD HH:mm',],
      ],
      'submit' => [
        'title' => $this->trans('Save', [], 'Admin.Actions'),
      ]
    ];

  }

  // As our database doesn't use the _DB_PREFIX_, we have to remove it
  protected function getFromClause() {
      return str_replace(_DB_PREFIX_, '', parent::getFromClause());
  }
}
```

So we now have a nice form when we click on Create:

![](/assets/images/2018/05/AdminController-with-Add-New.jpg)

> > But it doesn't work! You can also try to click on edit or on details, you'll have an error:

<http://localhost/admin-dev/index.php?controller=AdminPasta&id=768&updatepasta>

![](/assets/images/2018/05/AdminController-Object-cannot-be-loaded.jpg)

This is the error thrown here <https://github.com/PrestaShop/PrestaShop/blob/1.7.3.x/classes/controller/AdminController.php#L1655>

This is a limitation of PrestaShop: if you want to edit/create/delete an object, its SQL table **MUST** use the `_DB_PREFIX_`.

So you have to rename your pasta table:

`RENAME TABLE prestashop_pasta.pasta TO prestashop_pasta.ps_pasta; # adjust with your own _DB_PREFIX_`

And remove the whole `function getFromClause`:

```php
// protected function getFromClause() {
//     return str_replace(_DB_PREFIX_, '', parent::getFromClause());
// }
```

Refresh your page and you now have a fully working Form with a Custom Object:

![](/assets/images/2018/05/AdminController-Edit-is-now-working.jpg)

Here we are!! There's still much to do, as adding new fields in the Edit Form (tuto coming soon) and display those pastas in a nice Front Controller for the customers to be able to see them, you can head over here [for the tutorial 2 about creating the Front Controller](https://floriancourgey.com/2018/04/how-to-create-a-new-front-controller-for-prestashop-1-7/).


![Hooray!](https://i0.wp.com/uploads.disquscdn.com/images/3681964a5dbe8e4d3ca23796cfdeb66e137b3f46f16d82453437872e417e410f.jpg?w=525&#038;ssl=1)
