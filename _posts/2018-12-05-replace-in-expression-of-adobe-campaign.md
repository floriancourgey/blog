---
title: Custom SQL functions in Adobe Campaign
categories: [opensource,adobe campaign]
redirect_from: /2018/12/replace-in-expression-of-adobe-campaign
---

<!--more-->
## Create the XML package definition
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- namespace, name and label are for information only -->
<package
  namespace   = "nms"
  name        = "myNms-funclist-replace"
  label       = "StringReplace SQL Additional function"
  buildVersion= "6.7"
  buildNumber = "8937">
  <entities schema="xtk:funcList">
    <funcList name="StringReplace" namespace="fco"><!-- The pair "namespace:name" is the real id of the function. To update, use the same pair. -->
      <group name="string" label="String"><!-- define in which group the function belongs to -->
        <function name="StringReplace" type="string" args="(&lt;LookIn&gt;, &lt;From&gt;, &lt;To&gt;)"
          minArgs="3" maxArgs="3"
          help="Replace all occurrences of 'replaceThis' by 'byThis' in 'text'. StringReplace(text, replaceThis, byThis)"
          display="Replace all occurrences of 'replaceThis' by 'byThis' in 'text'. StringReplace(text, replaceThis, byThis)">
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

Import it as a regular package from `Tools > Advanced > Import package`:
![todo](/assets/images/2018/12/adobe-campaign-package-install-1.jpg)
![todo](/assets/images/2018/12/adobe-campaign-package-install-2.jpg)
![todo](/assets/images/2018/12/adobe-campaign-package-install-3.jpg)

<div class="alert alert-danger">
  You must restart the server for the new SQL function to be available!
</div>

## Check installed SQL functions
To debug installed SQL functions, open the Generic Query Editor on `xtk:funcList` and select `data` as Data to Extract:
![](/assets/images/2020/adobe-campaign-debug-xtk-funclist.jpg)

Hit `Next` until `Data Preview` > button `Start the preview of the data` > tab `XML result`
![](/assets/images/2020/adobe-campaign-debug-xtk-funclist-data-preview.jpg)

Source:
- [Adding additional SQL functions - Adobe docs](https://docs.adobe.com/content/help/en/campaign-classic/using/configuring-campaign-classic/api/adding-additional-sql-functions.html)
- [Replace function - Adobe forum](https://experienceleaguecommunities.adobe.com/t5/adobe-campaign-standard/replace-function/qaq-p/254911)
