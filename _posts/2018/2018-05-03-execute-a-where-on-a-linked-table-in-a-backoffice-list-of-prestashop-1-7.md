---
title: Execute a WHERE on a linked table in a Backoffice List of Prestashop 1.7
categories: [prestashop,prestashop 1.7]
---

You have a list with a linked table? For example in the AdminController you display Customer, right? What if you want to separate first names and last names ; and then perform a simple search?

It will trigger an error! You have to use the `filter_key` parameter. Here's how.

<!--more-->

Let's say you have

```sql
LEFT JOIN category_lang as cl [...]
LEFT JOIN customers as c [...]
```

You can then use

```php
$this->fields_list = [
  'category' => ['title' => 'Category', 'filter_key' => 'cl!name'], // mind the ! as a separator
  'customer' => ['title' => 'Customer', 'filter_key' => 'c!firstname'],
]
```
