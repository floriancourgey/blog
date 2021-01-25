---
title: Use Javascript libraries in Adobe Campaign (MomentJS, Lodash..)
layout: post
permalink: /2018/10/use-javascript-libraries-in-adobe-campaign/
categories: [opensource, adobe campaign]
---

Ever wanted to use **MomentJS** or **Lodash** in your JS scripts? It's easy to include them via a CDN for client-side web apps, but it can get tricky to get them for server-side processing. This tutorial walks you through the installation of Javascript libraries for Server Side use.

<!--more-->

## Installation
Copy the source code of your library, such as Moment here [https://cdn.jsdelivr.net/npm/moment@2.22.2/min/moment.min.js](https://cdn.jsdelivr.net/npm/moment@2.22.2/min/moment.min.js)

Go to your Javascript Codes and create a new one labelled 'vendor:moment'. Paste the code you just copied:

![todo](/assets/images/2018/10/Adobe-Campaign-create-external-library.jpg)

Save it.

Now in a workflow you can use it as any other standard library:

![todo](/assets/images/2018/10/Adobe-Campaign-use-external-library.jpg)

## Example with lodash
Copy from [https://underscorejs.org/underscore-min.js](https://underscorejs.org/underscore-min.js) and paste to `vendor:undescore`:
```js
//     Underscore.js 1.9.1
//     http://underscorejs.org
//     (c) 2009-2018 Jeremy Ashkenas, DocumentCloud and Investigative Reporters & Editors
//     Underscore may be freely distributed under the MIT license.
!function(){var n="object"==typeof self&&self.self===self&&self||"object"==typeof global&&global.global===[...]
```

In any Javascript activity, you can now use it with `loadLibrary('vendor:undescore')`:
```js
loadLibrary('vendor:underscore');

_.map([1, 2, 3], function(num){ return num * 3; });
// => [3, 6, 9]
```

## Example with MomentJS
Copy from [https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js](https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js) and paste it to `vendor:moment`:
```js
!function(e,t){"object"==typeof exports&&"undefined"!=typeof module?module.exports=t():"function"==typeof define&&def[...]
```

In any Javascript activity, you can now use it with `loadLibrary('vendor:moment')`:
```js
loadLibrary('vendor:moment');

var yesterday = moment().subtract(1, 'day');
logInfo(yesterday.format('YYYY-MM-DD HH:mm:ss')); // 2020-07-27 15:12:59
var tomorrow = moment().add(1, 'day');
logInfo(tomorrow.format('YYYY-MM-DD HH:mm:ss')); // 2020-07-29 15:12:59
```

To handle MomentJS locales ([https://momentjs.com/docs/#/i18n/instance-locale/](https://momentjs.com/docs/#/i18n/instance-locale/)), use [https://cdn.jsdelivr.net/npm/moment@2.27.0/min/locales.min.js](https://cdn.jsdelivr.net/npm/moment@2.27.0/min/locales.min.js) in `vendor:moment-locales`

Then:
```js
loadLibrary('vendor:moment');
loadLibrary('vendor:moment-locales');

var yesterday = moment().subtract(1, 'day');
yesterday.locale('fr');
logInfo(yesterday.format('dddd D MMMM')); // lundi 27 juillet
yesterday.locale('us');
logInfo(yesterday.format('dddd D MMMM')); // Monday 27 July
```
