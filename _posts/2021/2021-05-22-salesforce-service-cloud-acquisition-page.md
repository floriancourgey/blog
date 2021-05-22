---
title: Salesforce Service Cloud Acquisition Page to create Contacts & Accounts
categories: [salesforce]
---
Use a custom Salesforce Visualforce Page & Apex Controller for public web page data collect!

<p class="text-center">☁️🧑‍🤝‍🧑✔️</p>

<!--more-->

## Visualforce setup with HTML

### General template

Create a new Visualforce page in `Setup`>`Developer Console`>`File`>`New`>`Visualforce Page`>`FCO_DataCollect_Page`.

```html
<apex:page showHeader="false" sidebar="false" standardStylesheets="false"
           applyHtmlTag="false" applyBodyTag="false" docType="html-5.0"
           controller="FCO_DataCollect_Controller" action="{!init}"
           id="page">
  <html lang="en">
    <head>
    </head>
    <body>
    </body>
  </html>
</apex:page>
```

- Most important `<apex:page>` attributes are `controller`, `action`, `id` and `applyHtmlTag`
- All attributes are described in the [apex:page doc](https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/pages_compref_page.htm)

### Data collect Form

```html
<apex:form id="form"> <!-- use id attribute to explicitly define Input fields prefix id -->
    <!-- Standard text field of Contact & PersonAccount objects -->
    <apex:inputField value="{!contact.FirstName}" required="true" html-maxlength="50" html-autocomplete="given-name"/>
    <apex:inputField value="{!account.PersonEmail}" required="true" html-autocomplete="email" html-maxlength="50" id="PersonEmail"/>
    <!-- Custom text field of PersonAccount object -->
    <apex:inputField value="{!account.custom_field__c}" id="custom_field__c"/>
    <!-- Custom hidden text field of PersonAccount object -->
    <apex:inputHidden value="{!market}" id="market" required="true"/>
    <!-- Custom text field available only in controller -->
    <apex:inputcheckbox value="{!allowEmail}" id="allowEmail"/>
    <!-- Shipping Address fields. Note: State field is dependant on Country field, based on "State & Country/Territory Picklists" -->
    <apex:inputField value="{!account.ShippingStreet}" html-maxlength="50" html-autocomplete="address-line1"/>
    <apex:inputField value="{!account.ShippingPostalCode}" html-maxlength="10" html-minlength="4" html-autocomplete="postal-code"/>
    <apex:inputField value="{!account.ShippingCity}" html-maxlength="40" html-minlength="2" html-autocomplete="address-level2"/>
    <apex:inputfield value="{!account.ShippingCountryCode}" id="ShippingCountryCode"/>
    <apex:inputfield value="{!account.ShippingStateCode}" id="ShippingStateCode"/>
</apex:form>
```

Each field will be generated with an `id`=`{page_id}:{form_id}:{input_id}`. I.e. the `PersonEmail` `id`=`page:form:PersonEmail`. Useful for jQuery and CSS selectors.

## Apex Controller Class

Create a new Apex Controller in the Developer Console: `File`>`New`>`Apex Class`>`FCO_DataCollect_Controller`.

```java
public class FCO_DataCollect_Controller {
    public Account account { get; set; }
    public Contact contact { get; set; }
	public String market { get; set; }
	public boolean allowEmail { get; set; }
    /**
     * Called by Salesforce before the HTML output of the Visualforce page
     */
    public void init(){
        this.allowEmail = true; // init variable
        this.market = ApexPages.currentpage().getParameters().get('market'); // init variable from URL (https://xxx/?market=EU)
    }
    /**
     * Called by Salesforce after form submit
     */
    public PageReference save() {
        // set custom field
        account.customDataField__c = [SELECT Id FROM CustomTable__c WHERE Id = :account.PersonEmail].Id;
        // set standard RecordType to PersonAccount
        Id personAccountRecordType = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('PersonAccount').getRecordTypeId();
    	account.RecordTypeId = personAccountRecordType;
        // create a new account (and a Contact automatically)
        insert account;
        // redirect
        String url = '/../FCO_DataCollect_ThankYou';
        PageReference page = new PageReference(url);
    	page.setRedirect(True);
    	return page;
    }
}
```

## Apex Test Class

Any Apex Class deployed to production needs to be at least 80% covered by Unit Tests. Create a New `Apex Class`>`FCO_DataCollect_ControllerTest`.

```java
@isTest
private class CustomerSelfRegistrationControllerTest {
    static testMethod void validateSave() {
    	CustomerSelfRegistrationController controller = new CustomerSelfRegistrationController();
		controller.save();
        System.assertNotEquals(null, controller.account.Id);
    }
}
```

That's it! You're now able to save any data into Salesforce with a fully customized HTML page!

> Please note that this Visualforce Page is only available to registered Salesforce Users.

> If you want to make the Page public for any anonymous visitor, please check next chapter `Public site setup`.

## Public site setup

To make the Page public and accessible by anyone, create a new `Site` in `Setup`>`Sites`:
- the `Label` is used in URL, i.e. `FCO_DataCollect` => `https://instance.secure.force.com/FCO_DataCollect`
- `Active`: `Yes`
- `Active Site Home Page`: `FCO_DataCollect_Page`

The Visualforce Page is now publicly available (try in Private Mode!) on `https://instance.secure.force.com/FCO_DataCollect`.

## Going further

### Package static resources

Create a ZIP achive in `Setup`>`Static Resources` with:
- `Name`: `FCO_DataCollect_Resource`
- `Cache Control`: `Public`

Any file may then be used from the Visualforce Page with `URLFOR($Resource`:

```html
<apex:includeScript value="{!URLFOR($Resource.FCO_DataCollect_Resource, 'helpers.v1.js')}"/>
<apex:stylesheet value="{!URLFOR($Resource.FCO_DataCollect_Resource, 'style.css')}"/>
<apex:image url="{!URLFOR($Resource.FCO_DataCollect_Resource, 'logo.svg')}" alt="Logo"/>
```

### Custom select options

```html
<!-- Standard select field of Account object with custom options -->
<apex:selectList value="{!account.Salutation}" id="Salutation" size="1" html-autocomplete="honorific-prefix" required="true">
    <apex:selectOptions value="{!salutations}"/>
</apex:selectList>
```

```java
public List<SelectOption> getSalutations(){
    List<SelectOption> options = new List<SelectOption>();
    options.add(new SelectOption('', '')); // add empty option
    Schema.DescribeFieldResult fieldResult = Schema.Account.Salutation.getDescribe();
    List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
    for(Schema.PicklistEntry pickListVal : ple){
        options.add(new SelectOption(pickListVal.getValue(), pickListVal.getLabel()));
    }
    return options;
}
```

### Hide and display based on Controller condition

In the Page:

```html
<div>
    <!-- Displayed when success in controller -->
    <apex:outputPanel rendered="{! If(controllerError == null, true, false) }">
        <apex:form></apex:form>
    </apex:outputPanel>
    <!-- Displayed when error in controller -->
    <apex:outputPanel rendered="{! If(controllerError != null, true, false) }">
        <section>
            Error: <apex:outputtext value="{!controllerError}"/>.
        </section>
    </apex:outputPanel>
</div>
```

In the Controller:
```java
public String controllerError { get; set; }
public void init(){
    if( some_condition ){
        this.controllerError = 'Error because of [...]';
        return;
    }
    // [...]
}
```

### Send an email from the Controller

Create an HTML template in `Setup`>`Classic Email Templates`:
- `Type`: `Visualforce`
- `Name`: `FCO_DataCollect_EmailWelcome`
- `Content`:

```xml
<messaging:emailTemplate subject="Welcome" recipientType="Contact" relatedToType="Contact" renderUsingSystemContextWithoutSharing="True">
    <messaging:htmlEmailBody>
        <p>Hello {!relatedTo.FirstName}</p>
        <p>Go to your profile page: https://{!$Site.Domain}/FCO_ProfilePage?conId={!relatedTo.Id}&lang=en</p>
    </messaging:htmlEmailBody>
    <messaging:plainTextEmailBody>
        Hello {!relatedTo.FirstName}
        Go to your profile page: https://{!$Site.Domain}/FCO_ProfilePage?conId={!relatedTo.Id}&amp;lang=en
    </messaging:plainTextEmailBody>
</messaging:emailTemplate>
```

And in the Controller:

```java
insert account; // also does "insert contact"
// get contact id from account
Id PersonContactId = [SELECT PersonContactId FROM account WHERE Id =: account.Id].PersonContactId;
// get template
String templateName = 'FCO_DataCollect_EmailWelcome';
Id templateId = [SELECT Id FROM EmailTemplate WHERE developername = :templateName].Id;
// send email
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
mail.setTargetObjectId(PersonContactId); // for merge fields {!relatedTo.Id}
mail.setTemplateId(templateId);
mail.setWhatId(PersonContactId); // for merge fields {!relatedTo.Id}
//mail.setOrgWideEmailAddressId(owea.Id); // removed because of https://developer.salesforce.com/forums/?id=906F00000009DNKIA2. to change "from" address, change the email of Public Site User
mail.setSaveAsActivity(false); // do not save this in Contact's Activities. Setting it to true causes "System.EmailException: SendEmail failed."
mail.setUseSignature(false);
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); // @throws Exception
```
