// create lunr index
const idx = lunr(function () {
  this.ref('url');
  this.field('category');
  this.field('title');
  this.field('excerpt');
  this.field('date');
  for(var doc in documents) {
    this.add(documents[doc]);
  }
});
// watch input
var $searchInput;
var $resultsContainer;
$(function(){
  var $searchInput = $('#search-input');
  var $resultsContainer = $('#results-container');
  $searchInput.on('input', function() {
    $resultsContainer.empty();
    var val = $searchInput.val();
    if(val.length < 2) return;
    var results = idx.search(val);
    for (result of results) {
      var doc = documents[result.ref];
      $resultsContainer.append('<li><a href="'+doc.url+'">'+doc.title+'</a></li>');
    }
  });
})
