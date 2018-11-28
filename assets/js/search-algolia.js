const search = instantsearch({
  appId: 'B5V7RM7VIT',
  apiKey: 'bb03f7d79bc5c27720fcd98e433b12ae',
  indexName: 'jekyll',
  routing: true
});

// initialize SearchBox
search.addWidget(
  instantsearch.widgets.searchBox({
    container: '#search-input',
    placeholder: 'Search'
  })
);

// initialize hits widget
search.addWidget(
  instantsearch.widgets.hits({
    container: '#results-container',
    templates: {
      empty: 'No results',
      item: function(hit) {
        var date = moment.unix(hit.date).format('MMM D, YYYY');
        return `
          <div class="post-item">
            <span class="post-meta">${date}</span>
            <h2><a class="post-link" href="{{ site.baseurl }}${hit.url}">${hit._highlightResult.title.value}</a></h2>
            <div class="post-snippet">${hit._highlightResult.html.value}</div>
          </div>
        `;
      }
    }
  })
);

search.start();
