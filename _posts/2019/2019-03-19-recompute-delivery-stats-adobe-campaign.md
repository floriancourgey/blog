---
title: Recompute delivery statistics in Adobe Campaign
categories: [opensource,adobe campaign]
---
When working with external agencies, the broad logs are updated after a while. From the ACC client, it's possible to recompute the delivery stats, but here's how to update it automatically in Javascript.
<p class="text-center">🐍👑🌍</p>
<!--more-->

## Javascript code

```js
var nmsDeliveryDirtyFlags_tracking = 1; // tracking logs (1)
var nmsDeliveryDirtyFlags_messageCounters = 8; // broad logs (1)
var flags = nmsDeliveryDirtyFlags_tracking | nmsDeliveryDirtyFlags_messageCounters; // bit operation (2)
NLWS.nmsDelivery.RecomputeStats(vars.deliveryId, flags);
```

1. `nmsDeliveryDirtyFlags_tracking` and `nmsDeliveryDirtyFlags_messageCounters` come from the schema `nms:delivery` in the `dirtyFlags` enumeration.
1. The pipe `|` is a bit operation to sum 1 (0001) and 8 (1000) which results in 9 (1001).
