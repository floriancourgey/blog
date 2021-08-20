---
title: How to display any Smarty template?
categories: [opensource]
---

```php
// display it right away
$tpl = _PS_ALL_THEMES_DIR_.'/my_theme/templates/index.tpl';
$this->context->smarty->display($tpl);
// or use it as html
$tpl = _PS_ALL_THEMES_DIR_.'/my_theme/templates/index.tpl';
$html = $this->context->smarty->fetch($tpl);
echo $html;
```
