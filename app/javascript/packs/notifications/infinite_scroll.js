import Rails from "@rails/ujs"

document.addEventListener('turbolinks:load', () => {
  if (!!document.querySelector("#notifications") && !!document.querySelector('.digg_pagination')) {
    window.addEventListener('scroll', () => {
      let url;
      if (!!document.querySelector('.digg_pagination .next_page')) {
        url = document.querySelector('.digg_pagination .next_page').getAttribute('href');
        if (url && window.pageYOffset + document.documentElement.clientHeight > document.documentElement.scrollHeight - 50) {
          document.querySelector('.digg_pagination').innerHTML = 'Loading more...';
          Rails.ajax({
            type: 'GET',
            url: url
          })
        }
      }
    })
  }
});
