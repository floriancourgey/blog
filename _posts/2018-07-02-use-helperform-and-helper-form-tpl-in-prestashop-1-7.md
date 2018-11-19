---
id: 705
title: Use Helper Form and helper/form.tpl in Prestashop 1.7
date: 2018-07-02T16:50:40+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=705
permalink: /2018/07/use-helperform-and-helper-form-tpl-in-prestashop-1-7/
categories:
  - opensource
  - prestashop
  - prestashop 1.7
---
PrestaShop has developed a great UI for its Backoffice, and one of the not-so-well-known powerful features is the <span class="lang:php decode:true crayon-inline ">HelperForm</span>  object. You can create pretty much anything you want with it, but the official documentation is not complete and lacks some examples. Here&#8217;s a live preview of all the features provided by this wonderful Helper object.

<!--more-->

Source: Most of the code here has been taken from the [AdminPatternsController](https://github.com/PrestaShop/PrestaShop/blob/1.7.3.x/controllers/admin/AdminPatternsController.php). You can preview it fully from your backoffice <http://bo.demo.prestashop.com/demo/index.php?controller=AdminPatterns&email=demo@prestashop.com&password=prestashop_demo>.

<div id="content" class="bootstrap">
  <div class="form-horizontal">
    <div class="panel">
      <div class="panel-heading">
        <i class="icon-edit"></i> Patterns of helper form.tpl and HelperForm
      </div>
      
      <p>
        <!-- /.panel-heading -->
        
        <br /> 
        
        <div class="su-expand su-expand-collapsed su-expand-link-style-default" data-height="0">
          <div class="su-expand-content" style="color:#333333;max-height:0px;overflow:hidden">
            <pre class="lang:php decode:true">to copy/paste</pre>
          </div>
          
          <div class="su-expand-link su-expand-link-more" style="text-align:left">
            <a href="javascript:;" style="color:#0088FF;border-color:#0088FF"><span style="border-color:#0088FF">Show code</span></a>
          </div>
          
          <div class="su-expand-link su-expand-link-less" style="text-align:left">
            <a href="javascript:;" style="color:#0088FF;border-color:#0088FF"><span style="border-color:#0088FF">Hide code</span></a>
          </div>
        </div>
        
        <div class="alert alert-success">
          &#8230;
        </div>
        
        <div class="alert alert-info">
          &#8230;
        </div>
        
        <div class="form-group">
          <p>
            <label class="control-label col-lg-3 required">required input text</label>
          </p>
          
          <div class="col-lg-9">
            <input id="type_text_required" class="" name="type_text_required" required="required" type="text" value="" placeholder="placeholder here" />
          </div>
        </div>
        
        <div class="su-expand su-expand-collapsed su-expand-link-style-default" data-height="0">
          <div class="su-expand-content" style="color:#333333;max-height:0px;overflow:hidden">
            <pre class="lang:php decode:true ">[
  'type' =&gt; 'text',
  'label' =&gt; 'required input text',
  'name' =&gt; 'type_text_required',
  'required' =&gt; true,
  'placeholder' =&gt; 'placeholder here'
],</pre>
          </div>
          
          <div class="su-expand-link su-expand-link-more" style="text-align:left">
            <a href="javascript:;" style="color:#0088FF;border-color:#0088FF"><span style="border-color:#0088FF">Show code</span></a>
          </div>
          
          <div class="su-expand-link su-expand-link-less" style="text-align:left">
            <a href="javascript:;" style="color:#0088FF;border-color:#0088FF"><span style="border-color:#0088FF">Hide code</span></a>
          </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-lg-3"><br /> input md with prefix+suffix<br /> </label></p> 
          
          <div class="col-lg-9">
            <div class="input-group input fixed-width-md">
              <span class="input-group-addon">prefix</span><input id="type_text_md" class="input fixed-width-md" name="type_text_md" type="text" value="" /><span class="input-group-addon">suffix</span>
            </div>
            
            <p class="help-block">
              desc input text
            </p>
          </div>
        </div>
        
        <div class="su-expand su-expand-collapsed su-expand-link-style-default" data-height="0">
          <div class="su-expand-content" style="color:#333333;max-height:0px;overflow:hidden">
            <pre class="lang:php decode:true ">[
  'type' =&gt; 'text',
  'label' =&gt; 'input fixed-width-md with prefix+suffix',
  'name' =&gt; 'type_text_md',
  'class' =&gt; 'input fixed-width-md',
  'prefix' =&gt; 'prefix',
  'suffix' =&gt; 'suffix',
  'desc' =&gt; 'desc input text'
]</pre>
          </div>
          
          <div class="su-expand-link su-expand-link-more" style="text-align:left">
            <a href="javascript:;" style="color:#0088FF;border-color:#0088FF"><span style="border-color:#0088FF">Show code</span></a>
          </div>
          
          <div class="su-expand-link su-expand-link-less" style="text-align:left">
            <a href="javascript:;" style="color:#0088FF;border-color:#0088FF"><span style="border-color:#0088FF">Hide code</span></a>
          </div>
        </div>
        
        <div class="form-group">
          <p>
            <label class="control-label col-lg-3">input with button</label>
          </p>
          
          <div class="col-lg-9">
            <div class="row">
              <div class="col-lg-9">
                <input id="type_textbutton" class="" name="type_textbutton" type="text" value="" />
              </div>
              
              <div class="col-lg-2">
                <button class="btn btn-default" type="button">do something</button>
              </div>
            </div>
          </div>
        </div>
        
        <div class="su-expand su-expand-collapsed su-expand-link-style-default" data-height="0">
          <div class="su-expand-content" style="color:#333333;max-height:0px;overflow:hidden">
            <pre class="lang:php decode:true ">[
  'type' =&gt; 'textbutton',
  'label' =&gt; 'input with button',
  'name' =&gt; 'type_textbutton',
  'button' =&gt; [
      'label' =&gt; 'do something',
      'attributes' =&gt; [
          'onclick' =&gt; 'alert(\'something done\');'
      ]
  ]
],</pre>
          </div>
          
          <div class="su-expand-link su-expand-link-more" style="text-align:left">
            <a href="javascript:;" style="color:#0088FF;border-color:#0088FF"><span style="border-color:#0088FF">Show code</span></a>
          </div>
          
          <div class="su-expand-link su-expand-link-less" style="text-align:left">
            <a href="javascript:;" style="color:#0088FF;border-color:#0088FF"><span style="border-color:#0088FF">Hide code</span></a>
          </div>
        </div></div> 
        
        <p>
          <!-- /.panel -->
        </p></div> 
        
        <p>
          <!-- /.form-horizontal -->
        </p></div> 
        
        <p>
          <!-- /.bootstrap -->
        </p>
        
        <hr />
        
        <p>
          &nbsp;
        </p>