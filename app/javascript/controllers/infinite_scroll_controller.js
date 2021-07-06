import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["entries", "pagination"]

  initialize() {
    this.loading = false
  }
  
  scroll() {
    let next_page = this.paginationTarget.querySelector("a[rel='next']")

    if(next_page == null) { return }

    let url = next_page.href
    
    var body = document.body,
        html = document.documentElement
    
    var height = Math.max(body.scrollHeight, body.offsetHeight, html.offsetHeight, html.clientHeight, html.scrollHeight)

    if(window.pageYOffset >= height - window.innerHeight - 500) {
      if (this.loading) return;
      
      this.loadMore(url)
    }
  }

  loadMore(url) {
    this.loading = true

    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: (data) => {
        this.entriesTarget.insertAdjacentHTML('beforeend', data.entries)
        this.paginationTarget.innerHTML = data.pagination
        this.loading = false
      }
    })
  }
}
