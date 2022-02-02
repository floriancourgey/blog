---
title: Visualforce Cheatsheet for Salesforce Sales & Service
categories: [salesforce,visualforce]
---

<p class="text-center">🐍👑🌍</p>

<!--more-->

## List N records

```html
<apex:page showHeader="false" sidebar="false" id="page"
    lightningStylesheets="true" showQuickActionVfHeader="false"
    standardController="Campaign" recordSetvar="campaigns">

  <apex:slds />

  <apex:param value="Clienteling_Campaigns" assignTo="{!selectedFilterId}" name="selectedFilterId"/>

  <apex:variable var="campaignsSize" value="{!0}"/>

  <apex:repeat var="c" value="{!campaigns}" id="campaigns">
    <apex:variable var="campaignsSize" value="{!(campaignsSize+ 1)}"/>
    
    <!--<apex:outputLink value="{!URLFOR($Action.Campaign.View, c.id)}">-->
    <apex:outputLink value="{!URLFOR($Page.Clienteling_Details, null, [Id=c.id])}">
      {!c.Name}
      <apex:outputText value="{0,date,dd/MM/yyyy} - {1,date,dd/MM/yyyy}">
        <apex:param value="{!c.StartDate}"/>
        <apex:param value="{!c.EndDate}"/>
      </apex:outputText>
    </apex:outputLink>
  </apex:repeat>
</apex:page>
    
```

## Details for 1 record

```html
<apex:page showHeader="false" sidebar="false" id="page"
    lightningStylesheets="true" showQuickActionVfHeader="false"
    standardController="Campaign" extensions="MyCampaignController">
  
  <apex:repeat value="{!Campaign.CombinedAttachments}" var="attach">
      <div style="margin:4px 0;">
          <a href="/lightning/r/ContentDocument/{!attach.Id}/view">{!attach.Title}.{!attach.FileExtension} ({!attach.FileType})</a>
      </div>
  </apex:repeat>
</apex:page>
```
