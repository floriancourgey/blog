---
id: 581
title: How to display any Smarty template?
date: 2018-06-07T17:54:37+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=581
permalink: /2018/06/how-to-display-any-smarty-template/
categories:
  - opensource
---
<pre class="lang:php decode:true ">// display it right away
$tpl = _PS_ALL_THEMES_DIR_.'/my_theme/templates/index.tpl';
$this-&gt;context-&gt;smarty-&gt;display($tpl);
// or use it as html
$tpl = _PS_ALL_THEMES_DIR_.'/my_theme/templates/index.tpl';
$html = $this-&gt;context-&gt;smarty-&gt;fetch($tpl);
echo $html;</pre>

&nbsp;