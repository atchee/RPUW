import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer"
export default class extends Controller {
  static targets = ["input", "response"]

  connect() {
    console.log("Hello I'm here")
  }

  revealAnswer(evt) {
    evt.preventDefault()
    console.log("Hello I clicked to an answer")
    console.log(this.inputTarget)
    console.log(this.inputTarget.dataset.answerid)
  }
}
