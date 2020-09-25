---
title: Delivery Post-Processing Best Pratices (on Adobe Campaign)
categories: [opensource,adobe campaign]
---

Find out how to execute actions after a delivery has been sent with Post-Processing in the Campaign, the Routing and the Service Provider!

<p class="text-center">📬🌍⚙️</p>

<!--more-->

## Intro

There are 3 ways of handling any process after a delivery execution:
1. Inside the Campaign Workflow
1. With a Post-Processing workflow via the Routing External Account
1. With a Post-Processing workflow Template via the Service Provider

## Inside the Campaign Workflow

Add a Javascript Code activity after a delivery, with the following code:

```js
logInfo('vars.deliveryId:', vars.deliveryId); // will display "vars.deliveryId: 999999"
var delivery = NLWS.nmsDelivery.load(vars.deliveryId);
logInfo('delivery.label:', delivery.label); // "My Delivery Label"
```

You may debug by activating the feature "Display the tasks and the log":
![](/assets/images/2020/adobe-campaign-post-processing-vars-debug.jpg)

1. Activate the option, it will bring up a new panel in the lower section of the Workflow, with 2 tabs: "Tasks" and "Journal"
1. Select the activity that comes right after the delivery
1. In the "Tasks" tab, make sure the first line is selected, and hit the "Detail" button
1. Select the "Variables" tab
1. You'll find the XML version of the `vars` variable content, with the `deliveryId` attribute, hence `vars.deliveryId`

## With a Post-Processing workflow via the Routing External Account

Instead of having code and process in a campaign (that should be kept simple), you may externalize your dev to a Post-Processing workflow.

To do so, follow the current steps:
1. Create an new workflow with a Signal activity called `signal`, linked to JavaScript activity (use the same code as previous chapter), linked to an End activity.
1. Duplicate your delivery's current routing (Administration > Platform > External Accounts (nms:ExtAccount)) and then from the delivery Properties > General > Routing
1. Change the Routing's Delivery mode to `External` or `Bulk Delivery`, in order to reveal the `Post-Processing...` option
1. Select the workflow you created in #1 as the Post-Processing workflow
1. Leave the activity name to `signal`

![](/assets/images/2020/adobe-campaign-post-processing-routing.jpg)

Start the workflow, launch your campaign/delivery and debug the workflow, like before. you'll have the following variables in the `eventVariables` XML doc:
- `vars.deliveryId`: the delivery id
- `vars.description`
- `vars.filename`: the absolute or relative filepath of the generated delivery external file

![](/assets/images/2020/adobe-campaign-post-processing-post-processing-debug.jpg)

NB: Using a standard delivery activity with "Send a Proof" works well with this solution.

## With a Post-Processing workflow Template via the Service Provider

If you'd like to save and keep each workflow execution separate, you have to use a Workflow Template referenced by the Delivery's Service Provider. The workflow template is configured as follow:
1. Create a new Workflow Template with a JavaScript activity and an End
1. Duplicate your routing
1. Remove the Post-Processing workflow (if any) from the routing
1. Create a new Service Provider in Administration > Campaign Management > Service providers (nms:supplier)
1. Create a new Service (nms:supplierModel) in the newly created Service Provider
1. Link the workflow Template in Jobs > Post-Processing > Workflow template
1. In the Delivery, link the Supplier via Properties > Advanced > Service Provider > Service

In the workflow template, the main difference is the variable name, you now have access to:
- `instance.vars.iDeliveryId`: delivery id
- `instance.vars.iOperationId`: campaign id
- `instance.vars.strFileName`: the absolute or relative filepath of the generated delivery external file
- No more Signal activity


Feel free to test with the below JavaScriot code:
```js
logInfo('instance.vars.iDeliveryId:', instance.vars.iDeliveryId);
logInfo('instance.vars.iOperationId:', instance.vars.iOperationId);
vars.filename = instance.vars.strFileName;
logInfo('vars.filename:', vars.filename);
instance.vars.isProof = NLWS.nmsDelivery.load(instance.vars.iDeliveryId).FCP;
logInfo('instance.vars.isProof:', instance.vars.isProof);
```

NB: Using a standard delivery activity with "Send a Proof" doesn't work with this solution.
