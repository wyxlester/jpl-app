import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="seller-tab"
export default class extends Controller {
  static targets = ["listings"]

  connect() {
    console.log('hello from seller tab')
  }

  listed() {
    // create a variable URL with a query

    // get back a response
    // data from response, change the outerHTML of the whole controller
  }
}
