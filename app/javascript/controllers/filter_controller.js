import { Controller } from "stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["select"]
  static values = {
    url: String,
    param: String
  }

  connect() {
    console.log("filter connected")
  }

  change(event) {
    console.log("filter change")
    console.log(event.target.selectedOptions[0].value)
    let id = event.target.selectedOptions[0].value
    console.log(id)
    console.log(`${this.urlValue}?${"id=" + id}`)

    get(`${this.urlValue}?${"id=" + id}`, {
      // responseKind: "turbo-stream"
    })
  }
}