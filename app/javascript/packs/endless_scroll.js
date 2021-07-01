import Rails from "@rails/ujs"

document.addEventListener('DOMContentLoaded', () => {
  if (document.querySelector('.digg_pagination').childElementCount && document.querySelector('#notifications').childElementCount) {
    window.addEventListener('scroll', () => {
      let url = document.querySelector('.digg_pagination .next_page').getAttribute('href');
      if (url && window.pageYOffset + document.documentElement.clientHeight > document.documentElement.scrollHeight - 50) {
        Rails.ajax({
          type: 'GET',
          url: url})
      }
    })
  }
});
