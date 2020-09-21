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
```

You may debug by activating the feature "Display the tasks and the log"

## With a Post-Processing workflow via the Routing External Account

