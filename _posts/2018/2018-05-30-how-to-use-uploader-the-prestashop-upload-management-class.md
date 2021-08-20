---
title: How to use Uploader, the Prestashop upload management class?
categories: [opensource]
---

Tired of using `$\_FILES` and `move\_uploaded_file`? Well, Uploader is here to help you! No more error checking, extension safety, etc. This tutorial will show you how to upload files from a `HelperForm` to store it on your FTP server.

<!--more-->

```php
class AdminAllFitLieuController extends ModuleAdminController {
  public function __construct(){
    /* [...] */
    parent::__construct();
    /* [...] */
    $this->fields_form = [
        'legend' => [
            'title' => "",
            'icon' => 'icon-list-ul'
        ],
        'input' => [
          ['name'=>'image','label' => 'Image','type' => 'file',],
        ],
        'submit' => [
              'title' => $this->trans('Save', [], 'Admin.Actions'),
          ]
      ];
  }

  public function processSave(){
    parent::processSave();
    // handle file upload
    if(Validate::isLoadedObject($this->object)){
      $newName = "{$this->object->id}-".$_FILES['image']['name'];
      $uploader = new \Uploader('image');
      $uploader->setSavePath(_PS_IMG_DIR_.'your_dir');
      $files = $uploader->process($newName);
      $this->object->image = $newName;
      $this->object->save();
    }
  }
}
```
