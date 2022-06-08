import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"

  export default class extends Controller {
    static values = {
      gameId: Number,
      time: Number,
      state: String,
    };

    connect() {
      console.log("test")
      if (this.stateValue == "paused") return
      // const answerId = params.answerId
      const owner = this.element.closest("#timer").classList.contains("owner")
      const answers = document.querySelectorAll('.point-1round-orange');
      const question = this
      console.log(owner)
      console.log("Hello from timer controller")
      console.log('answers:', answers)
      this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
      this.interval = setInterval(() => {
        if (this.timeValue > 0) {
          this.element.innerText = this.timeValue - 1
          this.timeValue -= 1
        } else {
          if (owner) this._nextQuestion()
          // && si aucune attemtps (count des attempts de la game_question_id dans ce game_id)
          // @game.game_questions.attempt.count
          // no click sur une réponse for all participants
          //&& answers.length == 0
        }
        if (this.timeValue > 10) {
          this.element.classList.add("timer_green", "timer");
        }
        if (this.timeValue < 10){
          this.element.classList.remove("timer_green");
          this.element.classList.add("timer_orange");
        }
        if (this.timeValue < 5){
          this.element.classList.remove("timer_orange");
          this.element.classList.add("timer_red");
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
