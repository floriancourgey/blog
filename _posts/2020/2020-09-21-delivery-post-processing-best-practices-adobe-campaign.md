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

