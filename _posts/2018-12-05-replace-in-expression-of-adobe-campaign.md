---
title: Custom SQL functions Best Pratices (Adobe Campaign)
categories: [opensource,adobe campaign]
redirect_from: /2018/12/replace-in-expression-of-adobe-campaign
---
Create your own SQL functions to be used as XTK expressions in Adobe Campaign Query Editor!
<!--more-->
## Intro
Adobe Campaign lets us create custom SQL functions that will be available in the functions list, in the Expression Editor. With that in mind, let's create an SQL String Replace function in Adobe Campaign:
![](/assets/images/2020/adobe-campaign-debug-xtk-funclist-string-replace.jpg)

## Create the XML package definition
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- namespace, name and label are for information only -->
<package
  namespace   = "nms"
  name        = "fco-funclist"
  label       = "FCO SQL Additional functions"
  buildVersion= "6.7"
  buildNumber = "8937">
  <entities schema="xtk:funcList">
    <!-- The pair "namespace:name" is the id of the functions List. To update, use the same pair -->
    <funcList name="StringReplace" namespace="fco">
      <!-- The groupe "name" defined the group the function belongs to -->
      <group name="string" label="String">
        <!-- The "name" value is the function id and label. To update, use the same name -->
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
  You must restart the `web` server for the new SQL function to be available! Use `nlserver restart web`:
</div>

![todo](/assets/images/2020/adobe-campaign-debug-xtk-funclist-server-restart.jpg)

```console
16:19:28 >>> Objects with a 'xtk:package' schema cannot be added to a package.
16:29:09 >   Enumerating the file entities...
16:29:10 >   Writing entities in the database...
16:29:10 >   Saving data related to packages...
16:29:10 >   Package 'StringReplace SQL Additional function': Saving entities of type 'xtk:funcList'...
16:29:10 >   Installation of packages successful.
```

## Check installed SQL functions
To debug installed SQL functions, open the Generic Query Editor on `xtk:funcList` and select `data` as Data to Extract:
![](/assets/images/2020/adobe-campaign-debug-xtk-funclist.jpg)

Hit `Next` until `Data Preview` > button `Start the preview of the data` > tab `XML result`
![](/assets/images/2020/adobe-campaign-debug-xtk-funclist-data-preview.jpg)

Source:
- [Adding additional SQL functions - Adobe docs](https://docs.adobe.com/content/help/en/campaign-classic/using/configuring-campaign-classic/api/adding-additional-sql-functions.html)
- [Replace function - Adobe forum](https://experienceleaguecommunities.adobe.com/t5/adobe-campaign-standard/replace-function/qaq-p/254911)
