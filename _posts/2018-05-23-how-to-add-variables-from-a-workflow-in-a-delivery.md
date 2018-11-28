---
id: 537
title: How to add variables from a Workflow in a Delivery in Adobe Campaign?
date: 2018-05-23T16:10:19+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=537
permalink: /2018/05/how-to-add-variables-from-a-workflow-in-a-delivery/
categories:
  - adobe campaign
  - neolane
---
You process then create variables in your Workflow and you would like to be able to use them in a delivery? You can! Adobe Campaign allows you to define Delivery Variables which are accessible from your workflow. For example, you can create a CSV in your workflow, and set it as attachment by using <span class="lang:js decode:true crayon-inline ">vars.filename</span>  in the Delivery.

<!--more-->

## 1. Create the variable definition in the Delivery Template

Go to the Delivery Template properties, and use the tab &#8220;Variables&#8221;. You can add, edit and delete Variables with Data Types such as Text, Integer, Floating Point, DateTime and Long text. Each variable may be mandatory and have a default value.<img class="aligncenter size-full wp-image-538" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Delivery-Template-Properties-Annoted.png?resize=525%2C298&#038;ssl=1" alt="" width="525" height="298" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Delivery-Template-Properties-Annoted.png?w=1422&ssl=1 1422w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Delivery-Template-Properties-Annoted.png?resize=300%2C170&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Delivery-Template-Properties-Annoted.png?resize=768%2C436&ssl=1 768w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Delivery-Template-Properties-Annoted.png?resize=1024%2C582&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

Note: The &#8220;Name&#8221; doesn&#8217;t matter but the Order in which you declare your variables does. Here, storename is defined in the second position. It will be later used in the workflow as variables\[1], and storecode as variables[2\] (0-index based).

You can now insert your variables anywhere in your Delivery, in the body and the subject:

<img class="aligncenter size-full wp-image-544" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Insert-variables-in-delivery-annoted.jpg?resize=525%2C301&#038;ssl=1" alt="" width="525" height="301" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Insert-variables-in-delivery-annoted.jpg?w=1421&ssl=1 1421w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Insert-variables-in-delivery-annoted.jpg?resize=300%2C172&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Insert-variables-in-delivery-annoted.jpg?resize=768%2C440&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Insert-variables-in-delivery-annoted.jpg?resize=1024%2C587&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

And also in the attachment definition:

<img class="aligncenter size-full wp-image-553" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Variable-in-attachment-annoted.jpg?resize=525%2C305&#038;ssl=1" alt="" width="525" height="305" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Variable-in-attachment-annoted.jpg?w=1199&ssl=1 1199w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Variable-in-attachment-annoted.jpg?resize=300%2C174&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Variable-in-attachment-annoted.jpg?resize=768%2C446&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Variable-in-attachment-annoted.jpg?resize=1024%2C595&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

## 2. Set variable value in your workflow

In your wokflow, open your Delivery Activity, and use the Tab &#8220;Script&#8221;. In here, you can use <span class="lang:js decode:true crayon-inline ">delivery.variables._var[0]</span>  to set the value of the variables you defined before. <span class="lang:js decode:true crayon-inline ">delivery.variables._var</span>  is an EntityCollection 0-index based. So sadly you  <span style="text-decoration: underline;">cannot use</span> <span class="lang:js decode:true crayon-inline ">delivery.variables._var[&#8216;filename&#8217;]</span> &#8230;

<img class="aligncenter size-full wp-image-550" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Create-variables-in-the-WF.jpg?resize=525%2C157&#038;ssl=1" alt="" width="525" height="157" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Create-variables-in-the-WF.jpg?w=923&ssl=1 923w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Create-variables-in-the-WF.jpg?resize=300%2C90&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Create-variables-in-the-WF.jpg?resize=768%2C230&ssl=1 768w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

## 3. What to do in case of error?

<ol style="list-style-type: lower-alpha;">
  <li>
    Check your workflow logs
  </li>
  <li>
    Check your delivery logs
  </li>
  <li>
    Check your hidden delivery logs, by double-clicking you Delivery, then head to Delivery tab:<img class="aligncenter size-full wp-image-555" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Debug-error-annoted.jpg?resize=525%2C340&#038;ssl=1" alt="" width="525" height="340" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Debug-error-annoted.jpg?w=1169&ssl=1 1169w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Debug-error-annoted.jpg?resize=300%2C194&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Debug-error-annoted.jpg?resize=768%2C497&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Debug-error-annoted.jpg?resize=1024%2C662&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />
  </li>
</ol>

<span style="font-size: 10pt;"><em>Source: <a href="https://forums.adobe.com/thread/2380515">https://forums.adobe.com/thread/2380515</a> and <a href="https://forums.adobe.com/thread/2451509">https://forums.adobe.com/thread/2451509</a></em></span>