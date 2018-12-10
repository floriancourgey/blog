---
title: Javascript File Splitter
author: Florian Courgey
layout: post
categories:
  - javascript
  - opensource
  - adobe campaign
---
Javascript File Splitter
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
