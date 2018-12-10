---
title: Javascript File Splitter
author: Florian Courgey
layout: post
categories:
  - javascript
  - opensource
  - adobe campaign
---
Javascript File Splitter compatible with Adobe Campaign 7.
<!--more-->
## Source code
```js
/**
 * Splits a file such as:
 * A
 * A
 * A
 * into:
 * File 1:
 * header
 * A
 * A
 * footer
 * File 2:
 * header
 * A
 * footer
 * 
 * with params occurence="A", times=2
 */

var header = '<?xml version="1.0" encoding="UTF-8"?>\n<orders xmlns="http://www.demandware.com/xml/impex/customer/2006-10-31">'; 
var ommitFirstHeader = true;
var occurence = '<order order-no';
var maxOccurencesPerFile = 50;
var footer = '</orders>';
var extension = '.xml';

var file = new File(vars.filename);

var outputDir = "./";

var text = loadFile(vars.filename);
var lines = text.split('\n');

var textToWrite = '';
if(!vars.ommitFirstHeader){
  textToWrite = header;
}
var nbOfFilesDone = 1;
var actualTime = 0;

function getNewFile(){
  var actualFile = outputDir+'/'+file.name.replace(extension, '')+"_"+nbOfFilesDone.toString().padStart(4, "0")+extension;
  var f = new File(actualFile);
  f.open("a");
  logInfo('Created file '+f.fullName);
  return f;
}

var f = getNewFile();

for(var i in lines){
  var line = lines[i];
  // if we find an occurence
  if(line.indexOf(vars.occurence) > -1){
    // write
    f.writeln(textToWrite)
    textToWrite = '';
    // if it's time to create a new file
    if(actualTime >= vars.maxOccurencesPerFile){
      logInfo('New file for occurence at line '+i+' for occurence('+actualTime+'/'+vars.maxOccurencesPerFile+') for line ('+i+')')
      // write footer
      f.writeln(vars.footer);
      f.close();
      // reset vars
      actualTime = 0;
      nbOfFilesDone++;
      // open the next file
      var f = getNewFile();
      /// adding header
      if(nbOfFilesDone>1 || !vars.ommitFirstHeader){
        f.writeln(vars.header)
      }
    }
    actualTime++;
  }
  
  if(i > 0 && line.length>1){
    textToWrite += '\n';
  }
  textToWrite += line;
}
// last one
f.writeln(textToWrite);
f.close();
```

## Polyfills for `padStart()` in Adobe Campaign
Note: to make it work with Adobe Campaign, add the following polyfills for `padStart()` in `nms:polyfill`:
```js
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/repeat
if (!String.prototype.repeat) {
  String.prototype.repeat = function(count) {
    'use strict';
    if (this == null) {
      throw new TypeError('can\'t convert ' + this + ' to object');
    }
    var str = '' + this;
    count = +count;
    if (count != count) {
      count = 0;
    }
    if (count < 0) {
      throw new RangeError('repeat count must be non-negative');
    }
    if (count == Infinity) {
      throw new RangeError('repeat count must be less than infinity');
    }
    count = Math.floor(count);
    if (str.length == 0 || count == 0) {
      return '';
    }
    // Ensuring count is a 31-bit integer allows us to heavily optimize the
    // main part. But anyway, most current (August 2014) browsers can't handle
    // strings 1 << 28 chars or longer, so:
    if (str.length * count >= 1 << 28) {
      throw new RangeError('repeat count must not overflow maximum string size');
    }
    var rpt = '';
    for (var i = 0; i < count; i++) {
      rpt += str;
    }
    return rpt;
  }
}
// https://github.com/uxitten/polyfill/blob/master/string.polyfill.js
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padStart
if (!String.prototype.padStart) {
    String.prototype.padStart = function padStart(targetLength,padString) {
        targetLength = targetLength>>0; //truncate if number or convert non-number to 0;
        padString = String((typeof padString !== 'undefined' ? padString : ' '));
        if (this.length > targetLength) {
            return String(this);
        }
        else {
            targetLength = targetLength-this.length;
            if (targetLength > padString.length) {
                padString += padString.repeat(targetLength/padString.length); //append to original to ensure we are longer than needed
            }
            return padString.slice(0,targetLength) + String(this);
        }
    };
}
```

Then add `loadLibrary('nms:polyfill');` in your main file.

