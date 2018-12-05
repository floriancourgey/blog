---
title: String replace in expressions of Adobe Campaign
author: Florian Courgey
layout: post
categories:
  - opensource
  - adobe campaign
---
Say you want to have a dead simple slug of your string, you want to replace all spaces by dashes, right? 
It's impossible in an expression in standard Adobe Campaign...
We have to import a XML package file to create a new SQL function. 
<!--more-->
## Create the XML package definition
```xml
<?xml version="1.0" encoding='ISO-8859-1' ?>
<!-- ===========================================================================
  Additional SQL functions for Adobe Campaign
  ========================================================================== -->
<package
  namespace   = "nms"
  name        = "myNms-funclist-replace"
  label       = "My Nms Additional function Replace"
  buildVersion= "6.1"
  buildNumber = "10000"><!-- namespace, name and label are for information only -->
  <entities schema="xtk:funcList">
    <funcList name="myList" namespace="myNms"><!-- This pair namespace:name is the real id of the function. To update, use the same pair. -->
      <group name="string" label="String"><!-- define in which group the function belongs to -->
        <function name="MyReplace" type="string" args="(&lt;LookIn&gt;,&lt;From&gt;,&lt;To&gt;)"
                  help="Replace all occurrences in string of substring from with substring to. MyReplace(myString, replaceThis, byThis)" minArgs="3" maxArgs="3"
                  display="Replace all occurrences in string of substring from with substring to. MyReplace(myString, replaceThis, byThis)">  
          <providerPart provider="PostgreSQL,MSSQL" body="replace($1,$2,$3)"/>  
        </function>  
      </group>
    </funcList>
  </entities>
</package>
```

`<group>` must have as attributes one of:
- `name="aggregate" abel="Aggregates"`
- `name="string" label="String"`
- `name="date" label="Date"`
- `name="numeric" label="Numeric"`
- `name="geomarketing" label="Geomarketing"`
- `name="other" label="Others"`
- `name="window" label="Windowing functions"`

## XML package installation

Tools > Advanced > Import package

![todo](/assets/images/2018/12/adobe-campaign-package-install-1.jpg)
![todo](/assets/images/2018/12/adobe-campaign-package-install-2.jpg)
![todo](/assets/images/2018/12/adobe-campaign-package-install-3.jpg)

File > Disconnect, then Log back in

Sources:
- https://docs.campaign.adobe.com/doc/AC/en/CFG_API_Adding_additional_SQL_functions.html#General_structure_of_package_to_import
- https://forums.adobe.com/thread/2382673
