$(function(){
  $('article').find('img').each(function(){
    var $this = $(this);
    // exit for .no-lightgallery
    if($this.hasClass('no-lightgallery')){
      return;
    }
    // exit for .emoji
    if($this.hasClass('emoji')){
      return;
    }
    // exit for .gravatar
    if($this.hasClass('avatar')){
      return;
    }
    var imgUrlFullResolution = $this.attr('src');//.replace(/resize=.+/, ''); // on enleve le ?resize.. de https://.../uploads/Admin-Controller-Cover.jpg?resize=525%2C295&#038;ssl=1
    // on a :
    // div.lg-container
    // -- a.lg-link
    //   -- img
    //   -- span.lg-overlay
    $this.wrap('<div class="lg-container"><a class="lg-link" href="'+imgUrlFullResolution+'">'+$(this).html()+'</a></div>');
    $this.parent().append('<span class="lg-overlay"><span class="lg-overlay-inner"><i class="fa fa-search fa- "></i></span></span>');
  });
  $('article .lg-link').lightGallery({
      selector: 'this'
  });
})
