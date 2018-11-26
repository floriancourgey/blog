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
See [the Jekyll homepage](https://jekyllrb.com/)
```bash
$ ruby -v && gem -v # just making sure we got ruby and gem installed
$ gem install bundler jekyll
```
## Publish to github.io
Github can be used to host Jekyll static websites, on username.github.io/repository-name

Just push to a Github repo on the `master` branch, and enable Pages on Gihtub in Settings > GitHub Pages
## Create custom domain with https
2 steps:
1. Activate it in the repo settings, it's going to create a `CNAME` file with your custom domain:

2. Then, in your hosting provider DNS settings (such as [OVH](https://www.ovh.co.uk/domains/)), configure a CNAME DNS entry with your github.io URL:
![todo](/assets/images/2018/11/ovh-dns-blog-floriancourgey-com.jpg)

PS: For HTTPS it's [automatic since 2016](https://help.github.com/articles/securing-your-github-pages-site-with-https/), it might take up to a day to propagate. Be sure to enable this option in the repo settings.

## Migrate posts content from Wordpress
I used [https://wordpress.org/plugins/jekyll-exporter/](https://wordpress.org/plugins/jekyll-exporter/).

## Edit Server config for redirects
Posts on old wordpress site were hosted on https://floriancourgey.com/2018/01/title-here, but now they are hosted on https://blog.floriancourgey.com/2018/01/title-here

A quick Nginx rule did the trick, to ensure backward compatibility:
```nginx
location ~ ^/2018 {
	rewrite     ^ https://blog.floriancourgey.com$request_uri? permanent;
}
```

## Migrate Wordpress default functionalities
Jekyll comes as a pretty bare and simple blogging plateform. You can create posts and categories, but there's no SEO, no categories browsing or even comments. I had to dig a little deeper to find what I was looking for.

### Add Jekyll SEO
This one is easy and automatic as it comes as a Jekyll plugin. Jekyll plugins are installed by adding an entry in `_config.yml` and `Gemfile`, then running `bundle install`. See [Jekyll SEO install details](https://github.com/jekyll/jekyll-seo-tag/blob/master/docs/installation.md).
### Add categories
This one is a little bit more complicated. Categories in wordpress allow us to browse, search and display posts. This is not a native feature of Jekyll.

First we need a page with all categories. I reused this [very good tutorial on Jekyll categories](https://blog.webjeda.com/jekyll-categories/) where the idea is to have a `/categories.html` with a Jekyll standard loop `{% for category in page.categories %}`.

I also added this bit at the top and the bottom of each post, in order to display the categories of a post:
![todo](/assets/images/2018/11/wordpress-to-jekyll-categories-display.jpg)
```
{% for category in page.categories %}
  <a href="{{site.baseurl}}/categories?id={{category|slugize}}"
    class="badge badge-info">
    <i class="fas fa-tag"></i> {{category}}
  </a>
  {% unless forloop.last %}&nbsp;{% endunless %}
{% endfor %}
```
_See https://github.com/floriancourgey/www/blob/master/_layouts/post.html_

Noticed the `/categories?id=` part? With a bit of javascript, we are able to display a specific category:
![todo](/assets/images/2018/11/jekyll-display-categories-by-id.jpg)
```javascript
if(location.search.match(/id=([^&]*)/i)){
  var hash = location.search.match(/id=([^&]*)/i)[1].replace(/%20/g, ' ');
  var categories = document.getElementsByClassName('category');
  for(var category of categories){
    if(category.id != hash){
      category.className += ' d-none'; // d-none is the bootstrap 4 class to hide an element
    };
  }
}
```
_See https://github.com/floriancourgey/www/blob/master/categories.html_

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
