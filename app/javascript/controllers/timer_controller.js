import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"

  export default class extends Controller {
    static values = {
      gameId: Number,
      time: Number
    };

    connect() {
      const owner = this.element.closest("#timer").classList.contains("owner")
      this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
      this.interval = setInterval(() => {
        if (this.timeValue > 0) {
          this.element.innerText = this.timeValue - 1
          this.timeValue -= 1
        } else {
          if (owner) this._nextQuestion()
        }
      }, 1000);
    }

    disconnect() {
      clearInterval(this.interval)
    }

    _nextQuestion() {
      // evt.preventDefault()
      console.log(this.gameIdValue)
      const url = `${this.gameIdValue}/next_question`
      console.log(url)
      fetch (url, {
        method: "POST",
        headers: { 'Accept': 'text/vnd.turbo-stream.html', "X-CSRF-Token": this.csrfToken },
      })
    }
  }
