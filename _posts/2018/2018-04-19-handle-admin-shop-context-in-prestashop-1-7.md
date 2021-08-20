---
title: Handle Admin Shop Context in Prestashop 1.7
categories: [opensource,prestashop,prestashop 1.7]
---
Get the shop id

```php
$this->context->shop->id;
Shop::getContextShopID();
```

Get context (a shop, a group or all shops)

```php
if(Shop::getContext() == Shop::CONTEXT_SHOP){}
if(Shop::getContext() == Shop::CONTEXT_GROUP){}
if(Shop::getContext() == Shop::CONTEXT_ALL)
```

Get actual shop ids (if you're in a group or a shop)

```php
Shop::getContextListShopID(); // [1,2,3]
$sql = 'object.id_shop IN ('.join(Shop::getContextListShopID(),',').')';
```
