import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer"
export default class extends Controller {
  static targets = ["input", "listButton"]

  static values = { participationId: Number }

  connect() {
    console.log("Hello I'm here")
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  revealAnswer(evt) {
    evt.preventDefault()

    const answerId = evt.params.answerId
    console.log(this.participationIdValue)
    console.log(answerId)
    const url = `/participations/${this.participationIdValue}/answer?answer_id=${answerId}`
    console.log(url)
    fetch(url, {
      method: "POST",
      headers: { 'Accept': 'text/vnd.turbo-stream.html', "X-CSRF-Token": this.csrfToken },
    })

    this.listButtonTarget.style.pointerEvents = "none";
  }
}
