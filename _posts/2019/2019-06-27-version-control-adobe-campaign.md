---
title: Version control your Adobe Campaign instance (Git & backup)
categories: [git,opensource,adobe campaign]
---

Using a data package definition and a dead simple scheduled workflow to export it daily, we can simulate a version control on Adobe Campaign Classic.

<p class="text-center">🐍👑🌍</p>

<!--more-->

## Create the data package defintion
Set up a definition with the query set to:

- Data schema: `@namespace` `equal to` `your_namespace` or `@lastModified` `on or after` `1 day ago`
- Input form: `@lastModified` `is not empty`
- Workflows: @builtin = false and @id > 10,000 and @state = Started and @label not empty and @label != Default workflow and Lower(@label) doesn't contain test

![](/assets/images/2019/06/adobe-campaign-git-package-definition.jpg)

*(Check the generated XML by exporting the package)*.

## Create the workflow

A scheduler and a Javascript activity:

![](/assets/images/2019/06/adobe-campaign-git-workflow.jpg)

The scheduler defines the frequency for the XML generation.

The JS code contains:
```js
var packages = ['nms:backupDataSchema']; // add any definition here

for each(var package in packages){
  // load package def
  var spec = NLWS.xtkSpecFile.load(package);
  // generate xml
  var xml = spec.GenerateDoc();
  var xmlString = xml.toXMLString(true);
  // save to file
  var filename = '/my-ftp/'+formatDate(getCurrentDate(), "%4Y%2M%2D-%2H%2M%2S")+'-'+package.replace(':', '_')+'.xml';
  var f = new File(filename);
  f.open('w', File.CODEPAGE_UTF8); // use UTF-8
  f.writeln(xmlString);
  f.close();
}
```

Results in:
![](/assets/images/2019/06/adobe-campaign-backup-ftp.jpg)

## Going further
The next step is to upload it to some sort of external system (dropbox, gdrive) or a version control system (such as Git).
Git upload can be done via a SSH private generation (see [the doc on Github](https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys)) and git installation on the server.

### External drive
The idea is to compare the md5 of the previously generated XML vs the newly generated one. If the md5 hashes don't match, there's an update, proceed with the upload to the web space. If both md5 match, ignore.

This allows a very small amount of resources and can be run every 15 min, every 5 min, etc.

### Git
Unfortunately, I couldn't find any way yet to install git for a cloud-based installation, but the idea would be:
```js
// logInfo( execCommand('sudo apt-get -q -y install git') );
logInfo( execCommand('git status') );
logInfo( execCommand('git add .') );
logInfo( execCommand('git commit -m XXX') );
logInfo( execCommand('git push') );
```

Same for the resources, it can be run very frequently.
