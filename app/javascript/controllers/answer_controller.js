import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer"
export default class extends Controller {
  static targets = ["input", "result"]

  static values = { participationId: Number }

  connect() {
    console.log("Hello I'm here")
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  revealAnswer(evt) {
    evt.preventDefault()
    const answerId = evt.params.answerId
    console.log(this.participationIdValue)
    // console.log("Hello I clicked to an answer")
    // console.log(this.inputTarget)
    // console.log(this.inputTarget.dataset.answerid)
    // const answerid = parseInt(this.inputTarget.dataset.answerid)
    // this.resultTarget.innerText = `The id is : ${answerid}`
    const url = `/participations/${this.participationIdValue}/answer?answer_id=${answerId}`

    fetch(url, {
      method: "POST",
      headers: { 'Accept': 'text/vnd.turbo-stream.html', "X-CSRF-Token": this.csrfToken },
    })
  }
}
