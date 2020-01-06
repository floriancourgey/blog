---
title: Google Shopping products import into Adobe Campaign
categories: [google,opensource,adobe campaign]
---

Create a custom table to store products from Google Shopping to target recipient based on shopping behavior 
and send marketing communications with Product data such as Image, Title and Price!

<p class="text-center">💲📥🌍</p>

<!--more-->

**bold** *italic*  ~~strikethrough~~

## Schema, form and navigation creation
### Data Schema `grl:productExtensions
Schema with basic fields (string, memo [can contain XML/HTML], long)
```xml
<srcSchema entitySchema="xtk:srcSchema" img="xtk:schema.png" label="Product Extensions"
           mappingType="sql" name="productExtension" namespace="grl" xtkschema="xtk:srcSchema">
  <element autopk="true" label="Product Extensions" labelSingular="Product Extension" name="productExtension">
    <!-- Key -->
    <key>
      <keyfield xpath="@code"/>
    </key>
    <!-- Codes -->
    <attribute label="Code" name="code" type="string"/>
    <!-- Fields -->
    <attribute label="Title" name="title" type="string"/>
    <attribute label="Description" name="description" type="memo"/>
    <attribute label="Product Page URL" length="500" name="productPageUrl" type="string"/>
    <attribute label="Product Image URL" length="500" name="imageUrl" type="string"/>
    <attribute label="Availability" name="availability" type="string"/>
    <attribute label="Price" length="10" name="price" type="string"/>
    <attribute label="Product Category (Google)" name="googleCategory" type="string"/>
    <attribute label="Product type" name="type" type="string"/>
    <attribute label="Brand" name="brand" type="string"/>
    <attribute label="GTIN" name="gtin" type="string"/>
    <attribute label="MPN" name="mpn" type="string"/>
    <!-- Technical -->
    <element aggregate="xtk:common:auditTrail" name="auditTrail"/>
  </element>
</srcSchema>
```
Update SQL database with `Tools` > `Advanced` > `Update database structure`.

Disconnect, Reconnect. No need to clear the cache.

```xml
<form entitySchema="xtk:form" img="xtk:form.png" label="productExtension" name="productExtension"
      namespace="grl" xtkschema="xtk:form">
  <container colcount="2">
    <container>
      <input xpath="@code"/>
      <input xpath="@title"/>
      <input xpath="@gtin"/>
      <input xpath="@groupCode"/>
      <input xpath="@price"/>
      <input xpath="@productPageUrl"/>
      <input xpath="@googleCategory"/>
      <input xpath="@type"/>
      <input xpath="@description"/>
      <input xpath="@created"/>
      <input xpath="@lastModified"/>
    </container>
    <container label="Preview">
      <input forceNavigate="true" type="urlViewer" urlExpr="@imageUrl"/>
    </container>
  </container>
</form>
```

![todo](/assets/images/2019/01/image.png)
