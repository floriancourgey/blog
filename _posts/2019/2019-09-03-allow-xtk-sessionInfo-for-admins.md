---
title: Allow xtk:sessionionfo for administrators on Adobe Campaign
categories: [adobe campaign]
---

Access to records of `xtk:sessionInfo` without the `internal` account by creating a schema extension.
<p class="text-center">🐍👑🌍</p>
<!--more-->

Create a schema extension name `nms:sessionInfo`
```xml
<srcSchema entitySchema="xtk:srcSchema" extendedSchema="xtk:sessionInfo"
           name="sessionInfo" namespace="nms" xtkschema="xtk:srcSchema">
  <element name="sessionInfo">
    <!-- delete standard READ filter -->
    <sysFilter _operation="delete" name="readAccess"/>
    <!-- Re create it to allow admins only -->
    <sysFilter name="newReadAccess">
      <condition enabledIf="hasNamedRight('admin')=false" expr="FALSE"/>
    </sysFilter>
  </element>
</srcSchema>
```

- Source:

[https://docs.campaign.adobe.com/doc/AC/fr/CFG_Edition_des_schemas_Filtrage_des_schemas.html](https://docs.campaign.adobe.com/doc/AC/fr/CFG_Edition_des_schemas_Filtrage_des_schemas.html)


- Session info cleaned by:

[https://docs.campaign.adobe.com/doc/AC/en/PRO_Data_processing_Database_cleanup_workflow.html#Cleansing_session_information](https://docs.campaign.adobe.com/doc/AC/en/PRO_Data_processing_Database_cleanup_workflow.html#Cleansing_session_information)


- JS API for xtk:sessioninfo:

[https://docs.campaign.adobe.com/doc/AC/en/jsapi/s-xtk-session.html](https://docs.campaign.adobe.com/doc/AC/en/jsapi/s-xtk-session.html)
