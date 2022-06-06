import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="desk"
export default class extends Controller {
  static values = { points: Number };

  connect() {
    // console.log(this.pointsValue)
    // console.log("hello from desk controller")
    // console.log(answers)
    const answers = document.querySelectorAll('.point-1round-orange');

    console.log(Array.from(answers).slice(0, this.pointsValue))
    Array.from(answers).slice(0, this.pointsValue).forEach((answer) => {
			answer.classList.add('last');
		});
  }
}
