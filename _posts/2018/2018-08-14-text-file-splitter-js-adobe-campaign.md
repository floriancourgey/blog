---
title: Text file splitter JS (Adobe Campaign)
categories: [opensource, adobe campaign]
---

Splits a text file into multiple chunks based on number of occurences found (e.g. split an XML file every 50 `<node>`), with configurable prefix (e.g. `<xml><nodes>`) and suffix (e.g. `</nodes></xml>`).

<!--more-->

```js
vars.header = '&lt;?xml version="1.0" encoding="UTF-8"?&gt;\n&lt;orders xmlns="http://www.demandware.com/xml/impex/customer/2006-10-31"&gt;';
vars.ommitFirstHeader = true;
vars.occurence = '&lt;order order-no';
vars.maxOccurencesPerFile = 150;
vars.footer = '&lt;/orders&gt;';

vars.inputDir = getIncoming() + 'dev/';
vars.outputDir = getWebIncoming();
vars.fileFormat = 'WEB_20180814134030.xml'; // *.xml
```

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

logInfo('loading: '+vars.filename)
var text = loadFile(vars.filename);
logInfo('splitting by newline: '+vars.filename)
var lines = text.split('\n');
logInfo('ready to split into files')

var textToWrite = '';
if(!vars.ommitFirstHeader){
  textToWrite = header
}
var nbOfFilesDone = 1;
var actualTime = 0;
var matches = extractRealFilenameFromFileCollector(vars.filename, true)
var file = matches[1]
var extension = matches[2]

var actualFile = vars.outputDir+'/'+file+"_"+nbOfFilesDone.toString().padStart(4, "0")+extension;
var f = new File(actualFile)
f.open("a")

for(var i in lines){
  var line = lines[i];
  // if we find an occurence
  if(line.indexOf(vars.occurence) &gt; -1){
    // write
    f.writeln(textToWrite)
    textToWrite = '';
    // if it's time to create a new file
    if(actualTime &gt;= vars.maxOccurencesPerFile){
      logInfo('New file for occurence at line '+i+' for occurence('+actualTime+'/'+vars.maxOccurencesPerFile+') for line ('+i+')')
      // write footer
      f.writeln(vars.footer)
      // reset vars
      actualTime = 0;
      nbOfFilesDone++;
      // open the next file
      actualFile = vars.outputDir+'/'+file+"_"+nbOfFilesDone.toString().padStart(4, "0")+extension;
      f = new File(actualFile)
      f.open("a")
      /// adding header
      if(nbOfFilesDone&gt;1 || !vars.ommitFirstHeader){
        f.writeln(vars.header)
      }
    }
    actualTime++;
  }
  textToWrite += '\n'+line;
}
// last one
f.writeln(textToWrite)
```
