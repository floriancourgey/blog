---
id: 981
title: Adobe Campaign input Form helper
date: 2018-09-06T17:26:42+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=981
permalink: /2018/09/adobe-campaign-input-form-helper/
tinymce-comment-field_enabled:
  - "1"
categories:
  - opensource
---
Curated list of XML codes example for your input form in Adobe Campaign  7 with actual business cases.

<!--more-->

Full documentation here [https://docs.campaign.adobe.com/doc/AC/en/CFG\_Input\_forms\_Form\_structure.html](https://docs.campaign.adobe.com/doc/AC/en/CFG_Input_forms_Form_structure.html)

### Static

<img class="aligncenter size-full wp-image-983" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/09/Adobe-Campaign-form-static-help.jpg?resize=525%2C40&#038;ssl=1" alt="" width="525" height="40" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/09/Adobe-Campaign-form-static-help.jpg?w=676&ssl=1 676w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/09/Adobe-Campaign-form-static-help.jpg?resize=300%2C23&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

<pre class="lang:xhtml decode:true ">&lt;static type="help" label="Market is used to customize the delivery form by hiding/showing some fields."/&gt;
&lt;input xpath="@market"/&gt;</pre>

### Quick summary

<img class="aligncenter size-full wp-image-982" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/09/Adobe-Campaign-form-quick-summary.jpg?resize=525%2C29&#038;ssl=1" alt="" width="525" height="29" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/09/Adobe-Campaign-form-quick-summary.jpg?w=1021&ssl=1 1021w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/09/Adobe-Campaign-form-quick-summary.jpg?resize=300%2C16&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/09/Adobe-Campaign-form-quick-summary.jpg?resize=768%2C42&ssl=1 768w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

<pre class="lang:xhtml decode:true ">&lt;container colcount="5" colspan="3" label="Summary" type="frame"&gt;
      &lt;container type="visibleGroup" visibleIf="@a!=''"&gt;
        &lt;static fontBold="true" img="xtk:xtkcheck.png" label="Email"/&gt;
      &lt;/container&gt;
      &lt;container type="visibleGroup" visibleIf="@a=''"&gt;
        &lt;static fontBold="true" img="xtk:xtkcancel.png" label="Email"/&gt;
      &lt;/container&gt;
      &lt;container type="visibleGroup" visibleIf="@b!=''"&gt;
        &lt;static fontBold="true" img="xtk:xtkcheck.png" label="POS id"/&gt;
      &lt;/container&gt;
      &lt;container type="visibleGroup" visibleIf="@b=''"&gt;
        &lt;static fontBold="true" img="xtk:xtkcancel.png" label="POS id"/&gt;
      &lt;/container&gt;
      &lt;container type="visibleGroup" visibleIf="@c!=''"&gt;
        &lt;static fontBold="true" img="xtk:xtkcheck.png" label="WEB id"/&gt;
      &lt;/container&gt;
      &lt;container type="visibleGroup" visibleIf="@c=''"&gt;
        &lt;static fontBold="true" img="xtk:xtkcancel.png" label="WEB id"/&gt;
      &lt;/container&gt;
      &lt;container type="visibleGroup" visibleIf="[d/@d]&gt;0"&gt;
        &lt;static fontBold="true" img="xtk:xtkcheck.png" label="Loyalty id"/&gt;
      &lt;/container&gt;
      &lt;container type="visibleGroup" visibleIf="[d/@d]&lt;1"&gt;
        &lt;static fontBold="true" img="xtk:xtkcancel.png" label="Loyalty id"/&gt;
      &lt;/container&gt;
      &lt;container type="visibleGroup" visibleIf="@e=1"&gt;
        &lt;static fontBold="true" img="xtk:xtkcheck.png" label="Guest"/&gt;
      &lt;/container&gt;
      &lt;container type="visibleGroup" visibleIf="@e=0"&gt;
        &lt;static fontBold="true" img="xtk:xtkcancel.png" label="Guest"/&gt;
      &lt;/container&gt;
    &lt;/container&gt;</pre>

### Select an image

<img class="aligncenter size-full wp-image-987" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/09/Adobe-Campaign-form-select-an-image.jpg?resize=525%2C155&#038;ssl=1" alt="" width="525" height="155" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/09/Adobe-Campaign-form-select-an-image.jpg?w=837&ssl=1 837w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/09/Adobe-Campaign-form-select-an-image.jpg?resize=300%2C89&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/09/Adobe-Campaign-form-select-an-image.jpg?resize=768%2C227&ssl=1 768w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

<pre class="lang:default decode:true " title="mynms:deliveryExtensions">&lt;!-- Step 1. input with form fields --&gt;
&lt;input fontBold="true" img="nl:sryimage.png" label="Select image 1" type="subFormLink"
             xpath="image1"&gt;
        &lt;form editionMode="dialog" entitySchema="xtk:form" img="xtk:form.png" label="File resource"
              name="fileRes" namespace="xtk" xpathsToLoad="@originalName,@fileName,@md5,@contentType,@codepage,@storageType"
              xpathsToLoadOpt="@publish" xtkschema="xtk:form"&gt;
          &lt;enter&gt;
            &lt;soapCall name="GetPublicFileResURL" service="xtk:fileRes"&gt;
              &lt;param type="string" xpathOut="/tmp/@publicFileResUrl"/&gt;
            &lt;/soapCall&gt;
            &lt;if expr="@internalName=''"&gt;
              &lt;set expr="GetOption('XtkInstancePrefix')+'RES'+CounterValue('xtkResource')"
                   xpath="@internalName"/&gt;
            &lt;/if&gt;
          &lt;/enter&gt;
          &lt;container ref="mynms:deliveryExtensions:selectAnImage"/&gt;
          &lt;leave&gt;
            &lt;set value="xtk:fileRes" xpath="../../ignored/writer/fileRes/@xtkschema"/&gt;
            &lt;set value="insert" xpath="../../ignored/writer/fileRes/@_operation"/&gt;
            &lt;if expr="@md5 != ''"&gt;
              &lt;set value="insertOrUpdate" xpath="../../ignored/writer/fileRes/@_operation"/&gt;
            &lt;/if&gt;
            &lt;set expr="[@fileName]" xpath="../../ignored/writer/fileRes/@fileName"/&gt;
            &lt;set expr="[@md5]" xpath="../../ignored/writer/fileRes/@md5"/&gt;
            &lt;set value="0" xpath="../../ignored/writer/fileRes/@codepage"/&gt;
            &lt;set expr="[@originalName]" xpath="../../ignored/writer/fileRes/@originalName"/&gt;
            &lt;set expr="[@label]" xpath="../../ignored/writer/fileRes/@label"/&gt;
            &lt;set expr="[@internalName]" xpath="../../ignored/writer/fileRes/@internalName"/&gt;
            &lt;set expr="[@contentType]" xpath="../../ignored/writer/fileRes/@contentType"/&gt;
            &lt;set value="1" xpath="../../ignored/writer/fileRes/@useMd5AsFilename"/&gt;
            &lt;!-- set folder --&gt;
            &lt;set value="23352281" xpath="../../ignored/writer/fileRes/@folder_id"/&gt;

          &lt;/leave&gt;
        &lt;/form&gt;
      &lt;/input&gt;

  &lt;!-- Step 2. Select An Image popup --&gt;
  &lt;container colcount="2" img="xtk:properties.png" label="General" name="selectAnImage"&gt;
    &lt;container colcount="2" colspan="2"&gt;
      &lt;input xpath="@label"/&gt;
      &lt;input xpath="@internalName"/&gt;
      &lt;input colspan="2" img="xtk:properties.png" label="Advanced parameters..."
             nolabel="true" type="subFormLink" xpath="."&gt;
        &lt;form label="Advanced parameters"&gt;
          &lt;input xpath="@useMd5AsFilename"/&gt;
          &lt;static label="This option is used to generate a unique filename using a MD5 hash of the file content."
                  type="help"/&gt;
        &lt;/form&gt;
      &lt;/input&gt;
    &lt;/container&gt;
    &lt;container colspan="2" type="visibleGroup" visibleIf="GetOption('NmsDelivery_ImagePublishing')!='none'"&gt;
      &lt;container form="xtk:fileResUpload" name="dropZone" prebuildSubForm="false"
                 type="fileDropZone"&gt;
        &lt;enter name="onClick"&gt;
          &lt;set expr="[/tmp/@uploadFile]" xpath="@originalName"/&gt;
          &lt;set value="5" xpath="/tmp/@storageType"/&gt;
        &lt;/enter&gt;
        &lt;container label="File" name="actions" type="frame"&gt;
          &lt;container name="upload" type="visibleGroup" visibleIf="@loaded==false"&gt;
            &lt;static img="xtk:loginfo.png" label=" " name="helpNotLoaded"&gt;The file has not yet been uploaded on the server. You can drag &amp; drop the file here to upload it, or click on the link below.&lt;/static&gt;
            &lt;input form="xtk:fileResUpload" img="xtk:upload.png" label="Upload file to server..."
                   modelessExpr="'$(entityPath)'='/fileRes'" needWriteAccess="true"
                   type="subFormLink" xpath="."&gt;
              &lt;enter name="onClick"&gt;
                &lt;set value="5" xpath="/tmp/@storageType"/&gt;
                &lt;set expr="FileDlg(@originalName, 'open')" xpath="/tmp/@uploadFile"/&gt;
                &lt;set expr="[/tmp/@uploadFile]" xpath="@originalName"/&gt;
                &lt;if expr="'$(entityPath)'='/fileRes'"&gt;
                  &lt;saveView/&gt;
                &lt;/if&gt;
              &lt;/enter&gt;
            &lt;/input&gt;
          &lt;/container&gt;
          &lt;container name="loaded" type="visibleGroup" visibleIf="@loaded"&gt;
            &lt;static img="xtk:xtkcheck.png" name="helpLoaded" nolabel="true"&gt;The file has been uploaded on the server. You can drag &amp; drop it here, or click on the link below to replace the file.&lt;/static&gt;
            &lt;container name="download"&gt;
              &lt;input form="xtk:fileResDownload" imgExpr="EImg(@userContentType)"
                     labelExpr="FileName(@originalName)" modelessExpr="'$(entityPath)'='/fileRes'"
                     needWriteAccess="true" nolabel="true" type="fileLink" xpath="."/&gt;
            &lt;/container&gt;
            &lt;container name="uploadModify"&gt;
              &lt;input form="xtk:fileResUpload" img="xtk:upload.png" label="Change the file on the server..."
                     modelessExpr="'$(entityPath)'='/fileRes'" needWriteAccess="true"
                     nolabel="true" type="subFormLink" xpath="."&gt;
                &lt;enter name="onClick"&gt;
                  &lt;set value="5" xpath="/tmp/@storageType"/&gt;
                  &lt;set expr="FileDlg(@originalName, 'open')" xpath="/tmp/@uploadFile"/&gt;
                  &lt;set expr="[/tmp/@uploadFile]" xpath="@originalName"/&gt;
                  &lt;if expr="'$(entityPath)'='/fileRes'"&gt;
                    &lt;saveView/&gt;
                  &lt;/if&gt;
                &lt;/enter&gt;
              &lt;/input&gt;
            &lt;/container&gt;
          &lt;/container&gt;
        &lt;/container&gt;
      &lt;/container&gt;
    &lt;/container&gt;
  &lt;/container&gt;

&lt;!-- Step 3. update fields on leave --&gt;
&lt;leave&gt;
  &lt;!-- link image 1 to delivery, if any --&gt;
      &lt;if expr="[image1/@fileName] !=''"&gt;
        &lt;if expr="[/ignored/writer/fileRes/@internalName]!=''"&gt;
          &lt;soapCall name="Write" service="xtk:persist"&gt;
            &lt;param exprIn="[/ignored/writer/fileRes]" type="DOMDocument"/&gt;
          &lt;/soapCall&gt;
        &lt;/if&gt;
        &lt;set value="xtk:fileRes" xpath="/ignored/queryDefFR/@schema"/&gt;
        &lt;set value="select" xpath="/ignored/queryDefFR/@operation"/&gt;
        &lt;set value="@id" xpath="/ignored/queryDefFR/select/node[1]/@expr"/&gt;
        &lt;set expr="'@internalName=\''+[image1/@internalName]+'\''" xpath="/ignored/queryDefFR/where/condition[1]/@expr"/&gt;
        &lt;soapCall name="ExecuteQuery" service="xtk:queryDef"&gt;
          &lt;param exprIn="[/ignored/queryDefFR]" type="DOMDocument"/&gt;
          &lt;param type="DOMDocument" xpathOut="/ignored/tmp/operationFR"/&gt;
        &lt;/soapCall&gt;
        &lt;set expr="[/ignored/tmp/operationFR/fileRes/@id]" xpath="@image1-id"/&gt;
        &lt;soapCall name="PublishIfNeededFromId" service="xtk:fileRes"&gt;
          &lt;param exprIn="[@image1-id]" type="string"/&gt;
        &lt;/soapCall&gt;
      &lt;/if&gt;
&lt;/leave&gt;</pre>

&nbsp;