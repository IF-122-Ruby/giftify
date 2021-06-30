document.querySelector(function() {
  if (document.querySelector('.pagination').length && document.querySelector('#products').length) {
    document.querySelector(window).scroll(function() {
      var url;
      url = document.querySelector('.pagination .next_page').attr('href');
      if (url && document.querySelector(window).scrollTop > document.querySelector(document).height() - document.querySelector(window).height() - 50) {
        document.querySelector('.pagination').text('Load more');
        return $.getScript(url);
      }
    });
    return document.querySelector(window).scroll();
  }
});
