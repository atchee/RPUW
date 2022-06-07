import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="desk"
export default class extends Controller {
  static values = {
    points: Number,
    correct: Boolean,
  };

  connect() {
    console.log("hello from desk controller")
    // console.log(this.pointsValue)
    // console.log(this.correctValue)
    // console.log(answers)
    const answers = document.querySelectorAll('.point-1round-orange');

    Array.from(answers).slice(0, this.pointsValue).forEach((answer) => {
      if (this.correctValue != false) {
        // console.log(this.correctValue)
        // console.log(answer)
        answer.classList.add('flash');
      } else {
        // console.log(this.correctValue)
        // console.log(answer)
        answer.classList.remove('flash');
        answer.classList.add('unflash');
      }
    });
  }
}
