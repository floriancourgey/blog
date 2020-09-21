---
title: Delivery Post-Processing Best Pratices (on Adobe Campaign)
categories: [opensource,adobe campaign]
---

Excerpt here...

<p class="text-center">📬🌍⚙️</p>

<!--more-->

## Intro

There are 2 ways of handling any process after a delivery execution:
1. Inside the Campaign Workflow
1. With a Post-Processing workflow via the Routing External Account

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
1. Duplicate your delivery's current routing
1. Change the Routing's Delivery mode to `External` or `Bulk Delivery`, in order to reveal the `Post-Processing...` option
1. Select the workflow you created in #1 as the Post-Processing workflow
1. Leave the activity name to `signal`

![](/assets/images/2020/adobe-campaign-post-processing-routing.jpg)

Start the workflow, launch your campaign/delivery and debug the workflow, like before. you'll have the following variables in the `eventVariables` XML doc:
- `deliveryId`: the delivery id
- `description`
- `filename`: the absolute or relative filepath of the generated delivery external file

![](/assets/images/2020/adobe-campaign-post-processing-post-processing-debug.jpg)
