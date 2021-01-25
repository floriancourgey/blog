---
id: 572
title: How to use Uploader, the Prestashop upload management class?
date: 2018-05-30T20:52:46+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=572
permalink: /2018/05/how-to-use-uploader-the-prestashop-upload-management-class/
categories:
  - opensource
---
Tired of using $\_FILES and move\_uploaded_file? Well, Uploader is here to help you! No more error checking, extension safety, etc. This tutorial will show you how to upload files from a HelperForm to store it on your FTP server.

<!--more-->

<pre class="lang:php decode:true " title="YourAdminController.php">&lt;?php

class AdminAllFitLieuController extends ModuleAdminController {
  public function __construct(){
    /* [...] */
    parent::__construct();
    /* [...] */
    $this-&gt;fields_form = [
        'legend' =&gt; [
            'title' =&gt; "",
            'icon' =&gt; 'icon-list-ul'
        ],
        'input' =&gt; [
          ['name'=&gt;'image','label' =&gt; 'Image','type' =&gt; 'file',],
        ],
        'submit' =&gt; [
              'title' =&gt; $this-&gt;trans('Save', [], 'Admin.Actions'),
          ]
      ];
  }

  public function processSave(){
    parent::processSave();
    // handle file upload
    if(Validate::isLoadedObject($this-&gt;object)){
      $newName = "{$this-&gt;object-&gt;id}-".$_FILES['image']['name'];
      $uploader = new \Uploader('image');
      $uploader-&gt;setSavePath(_PS_IMG_DIR_.'your_dir');
      $files = $uploader-&gt;process($newName);
      $this-&gt;object-&gt;image = $newName;
      $this-&gt;object-&gt;save();
    }
  }
}
</pre>

&nbsp;