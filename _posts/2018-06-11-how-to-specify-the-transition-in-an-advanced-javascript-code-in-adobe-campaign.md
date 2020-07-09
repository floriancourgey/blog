---
title: Specify the transition in an Advanced Javascript Code in Adobe Campaign
redirect_from: /2018/06/how-to-specify-the-transition-in-an-advanced-javascript-code-in-adobe-campaign/
categories: [adobe campaign,javascript,neolane,opensource]
---

With the default`Javascript Code` we only have 1 transition named `ok`. But what if you want to use multiple transitions, depending on conditions? You have to use an `Advanced Javascript Code` and call `task.postEvent(task.transitionByName('transition'));`

<!--more-->

## General example

Create a Advanced Javascript Code with 2 transitions:

![](/assets/images/2018/06/advanced-JS-transition.jpg)

Then, in the code use

```js
var age = 20;

if(age >= 21){ // or whatever condition you need
  task.postEvent(task.transitionByName('major')); // the important part
} else {
  task.postEvent(task.transitionByName('minor')); // the important part
}
```

![](/assets/images/2018/06/advanced-JS-code.jpg)

## Use case: list files in a directory

You can leverage this activity by listing all files in a dir, and execute a transition if there's files or not:

![](/assets/images/2018/06/Advanced-JavaScript-Code-Use-case-with-files.jpg)

![](/assets/images/2018/06/Advanced-JavaScript-Code-Transitions.jpg)

JavaScript code:

```js
loadLibrary('my:helpers'); // contains function getIncomingDir(), must end with '/'

var dir = new File(getIncomingDir());
var files = dir.list("20180727*_customers_*.xml"); // see https://docs.campaign.adobe.com/doc/AC/en/jsapi/c-File.html

if(files && files.length > 0){
  task.postEvent(task.transitionByName("yes"));
} else {
  task.postEvent(task.transitionByName("no"));
}
```

So you can use it in a scheduled workflow like this, with a file collector that processes files One at a time (Check option `Stop as soon as a file has been processed`):

![](/assets/images/2018/06/Advanced-JavaScript-Code-Use-case-full-2.jpg)

Schedule the workflow daily, configure your variables `vars.directory`  and `vars.fileFilter` in the first Javascript Activity. Use them in the File collector. The Data Loading activity is set to use the file Specified in the Transition. Both jumps are defined to 1.

The code to determine of there's still some files left to be processed becomes:

```js
var dir = new File(vars.directory);
var files = dir.list(vars.fileFilter);
if(files && files.length > 0){
  for each (var file in files){
    logInfo('- '+file.name);
  }
  task.postEvent(task.transitionByName("yes"));
} else {
  task.postEvent(task.transitionByName("no"));
}
```

Much cleaner!
