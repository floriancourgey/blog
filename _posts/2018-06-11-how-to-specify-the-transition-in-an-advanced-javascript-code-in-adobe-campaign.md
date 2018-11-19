---
id: 598
title: How to specify the transition in an Advanced Javascript Code in Adobe Campaign?
date: 2018-06-11T20:59:22+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=598
permalink: /2018/06/how-to-specify-the-transition-in-an-advanced-javascript-code-in-adobe-campaign/
categories:
  - adobe campaign
  - javascript
  - neolane
  - opensource
---
With the default &#8220;Javascript Code&#8221; you only have 1 transition: &#8220;ok&#8221;. But what if you want to use multiple transitions, depending on conditions? You have to use an &#8220;Advanced Javascript Code&#8221; and call &#8220;task.postEvent(task.transitionByName(&#8216;transition&#8217;));&#8221;<!--more-->Step 1. General example

Create a Advanced Javascript Code with 2 transitions:

<img class="aligncenter size-full wp-image-600" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/06/advanced-JS-transition.jpg?resize=525%2C263&#038;ssl=1" alt="" width="525" height="263" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/06/advanced-JS-transition.jpg?w=652&ssl=1 652w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/06/advanced-JS-transition.jpg?resize=300%2C150&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

Then, in the code use

<pre class="lang:js decode:true ">var age = 20;

if(age &gt;= 21){ // or whatever condition you need
  task.postEvent(task.transitionByName("major")); // the important part
} else {
  task.postEvent(task.transitionByName("minor")); // the important part
}
</pre>

&nbsp;

<img class="aligncenter size-full wp-image-599" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/06/advanced-JS-code.jpg?resize=525%2C458&#038;ssl=1" alt="" width="525" height="458" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/06/advanced-JS-code.jpg?w=544&ssl=1 544w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/06/advanced-JS-code.jpg?resize=300%2C262&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

## Step 2. Use case: list files in a directory

You can leverage this activity by listing all files in a dir, and execute a transition if there&#8217;s files or not:

<img class="aligncenter size-full wp-image-890" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/06/Advanced-JavaScript-Code-Use-case-with-files.jpg?resize=391%2C244&#038;ssl=1" alt="" width="391" height="244" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/06/Advanced-JavaScript-Code-Use-case-with-files.jpg?w=391&ssl=1 391w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/06/Advanced-JavaScript-Code-Use-case-with-files.jpg?resize=300%2C187&ssl=1 300w" sizes="(max-width: 391px) 100vw, 391px" data-recalc-dims="1" />

<img class="aligncenter size-full wp-image-891" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/06/Advanced-JavaScript-Code-Transitions.jpg?resize=455%2C149&#038;ssl=1" alt="" width="455" height="149" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/06/Advanced-JavaScript-Code-Transitions.jpg?w=455&ssl=1 455w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/06/Advanced-JavaScript-Code-Transitions.jpg?resize=300%2C98&ssl=1 300w" sizes="(max-width: 455px) 100vw, 455px" data-recalc-dims="1" />

JavaScript code:

<pre class="lang:js decode:true">loadLibrary('my:helpers')

var dir = new File(getIncomingDir())
var files = dir.list("20180727*_customers_*.xml")

if(files && files.length &gt; 0){
  task.postEvent(task.transitionByName("yes"))
} else {
  task.postEvent(task.transitionByName("no"))
}</pre>

&nbsp;

So you can use it in a scheduled workflow like this, with a file collector that processes files One at a time (Check option &#8220;Stop as soon as a file has been processed&#8221;):

<img class="aligncenter size-full wp-image-896" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/06/Advanced-JavaScript-Code-Use-case-full-2.jpg?resize=525%2C137&#038;ssl=1" alt="" width="525" height="137" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/06/Advanced-JavaScript-Code-Use-case-full-2.jpg?w=1033&ssl=1 1033w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/06/Advanced-JavaScript-Code-Use-case-full-2.jpg?resize=300%2C78&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/06/Advanced-JavaScript-Code-Use-case-full-2.jpg?resize=768%2C201&ssl=1 768w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/06/Advanced-JavaScript-Code-Use-case-full-2.jpg?resize=1024%2C268&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

Schedule the workflow daily, configure your variables <span class="lang:default decode:true crayon-inline ">vars.directory</span>  and <span class="lang:default decode:true crayon-inline ">vars.fileFilter</span>  in the first Javascript Activity. Use them in the File collector. The Data Loading activity is set to use the file Specified in the Transition. Both jumps are defined to 1.

The code to determine of there&#8217;s still some files left to be processed becomes:

<pre class="lang:js decode:true">var dir = new File(vars.directory)
var files = dir.list(vars.fileFilter)
if(files && files.length &gt; 0){
  for each (var file in files){
    logInfo('- '+file.name)
  }
  task.postEvent(task.transitionByName("yes"))
} else {
  task.postEvent(task.transitionByName("no"))
}</pre>

Much cleaner!