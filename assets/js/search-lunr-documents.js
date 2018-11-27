---
---
var documents = {
  {% for post in site.posts %}
    "{{ site.baseurl }}{{ post.url }}": {
      "title"    : "{{ post.title | escape }}",
      "url"      : "{{ site.baseurl }}{{ post.url }}",
      "categories" : "{{ post.categories | join: ', ' }}",
      "tags"     : "{{ post.tags | join: ', ' }}",
      "date"     : "{{ post.date }}",
      "excerpt"     : "{{ post.excerpt | strip | strip_newlines | strip_html }}"
    } {% unless forloop.last %},{% endunless %}
  {% endfor %}
};
