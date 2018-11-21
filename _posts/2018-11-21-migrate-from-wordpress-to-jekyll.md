---
title: Migrate from Wordpress to Jekyll
author: Florian Courgey
layout: post
categories:
  - prestashop
  - google
  - opensource
  - adobe campaign
---
## Install Jekyll locally

## Publish to github.io

## Create custom domain with https

## Migrate posts

## Edit DNS config for redirects
from example.com to blog.example.com

## Migrate Wordpress default functionalities
### Add Jekyll SEO
### Add categories
### Add Previous/Next
### Add comments
### Add search

## Migrate HTML Headers to Markdown headers
```
Find:    [ \t]*<h2>\s*([\w  \-]+)\s*</h2>
Replace: ## $1
```

## Migrate Crayon Code Highlighter
Regex for code blocks:
```
Find:    [ \t]*<pre class="lang:(\w+) decode:true ?">(.*)\n
Replace: ```$1\n$2

Find:    \n?</pre>
Replace: \n```

Find:    (&#8216;|&#8217;|&#8220;|&#8221;)
Replace: '

Find:    &lt;
Replace: <

Find:    &gt;
Replace: >
```


## Migrate images
Regex for jetpack optimised images:
~~~
Find:    <img.*src=".+wp-content/uploads(.+)\?.+".*/>
Replace: ![todo](/assets/images$1)
~~~

## Customization
### Add Bootstrap 4
