---
title: Search
permalink: /search/
---

<!-- Html Elements for Search -->
<div id="search-container">
<input type="text" id="search-input" placeholder="search...">
<ul id="results-container"></ul>
</div>

<script src="https://cdn.jsdelivr.net/npm/simple-jekyll-search@1.7.1/dest/simple-jekyll-search.min.js"></script>

<script>
SimpleJekyllSearch({
  searchInput: document.getElementById('search-input'),
  resultsContainer: document.getElementById('results-container'),
  json: '/search.json'
})
</script>
