---
title: Create a Search in Jekyll [Part 2/2]
author: Florian Courgey
layout: post
categories:
  - jekyll
  - opensource
  - server
---
This post is the part 2 of the tutorial collection on how to migrate from Wordpress to Jekyll.
- [Part 1. Introduction]({{ site.baseurl }}{% post_url 2018-11-21-migrate-from-wordpress-to-jekyll %})
- Part 2. Create the Search component

## Simple method: text search in title and url with
This feature consists of creating a JSON object with all pages and posts with Jekyll `site.posts` in the file `/search.json`:
{% raw %}```json
---
---
[
  {% for post in site.posts %}
    {

      "title"    : "{{ post.title | escape }}",
      "url"      : "{{ site.baseurl }}{{ post.url }}",
      "categories" : "{{ post.categories | join: ', ' }}",
      "tags"     : "{{ post.tags | join: ', ' }}",
      "date"     : "{{ post.date }}"

    } {% unless forloop.last %},{% endunless %}
  {% endfor %}
]
```{% endraw %}
*See source [https://github.com/floriancourgey/www/blob/master/search.json](https://github.com/floriancourgey/www/blob/master/search.json)*

The file is immediately available at [https://blog.floriancourgey.com/search.json](https://blog.floriancourgey.com/search.json).

Now each time the site is built, a search.json is created, containing every post along with its title, url, categories and tags.

XX developed a plugin to display the list of results, based on a simple text search:
```html
<input id="search-input" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
<ul id="results-container"></ul>
<script src="https://cdn.jsdelivr.net/npm/simple-jekyll-search@1.7.1/dest/simple-jekyll-search.min.js"></script>
<script>
SimpleJekyllSearch({
  searchInput: document.getElementById('search-input'),
  resultsContainer: document.getElementById('results-container'),
  json: '/search.json'
})
</script>
```

*Source [https://blog.webjeda.com/instant-jekyll-search](https://blog.webjeda.com/instant-jekyll-search)*

## Advanced search: Full-text search with lunr.js

Following the method above, we can take a great advantage of the Jekyll automatic index building and link it to a Full text search library such as lunr.js. This way, we can have more natural langugage processing, all for free!

`/search-lunr.js`
{% raw %}```js
---
---
var documents = [
  {% for post in site.posts %}
    {
      "path"     : "{{ post.path | escape }}",
      "title"    : "{{ post.title | escape }}",
      "url"      : "{{ site.baseurl }}{{ post.url }}",
      "categories" : "{{ post.category }}",
      "tags"     : "{{ post.tags | join: ', ' }}",
      "date"     : "{{ post.date }}",
      "excerpt"     : "{{ post.excerpt | strip | strip_newlines | strip_html }}"
    } {% unless forloop.last %},{% endunless %}
  {% endfor %}
];
```{% endraw %}

https://lunrjs.com/guides/getting_started.html
```html
<script src="https://unpkg.com/lunr/lunr.js"></script>
<script>
  var idx = lunr(function () {
    this.ref('url');
    this.field('category');
    this.field('title');
    this.field('excerpt');
    this.field('date');

    documents.forEach(function (doc) {
      this.add(doc)
    }, this)
  });
</script>
```
