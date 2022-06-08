import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="desk"
export default class extends Controller {
  static values = {
    points: Number,
    userId: Number,
    previous: Boolean,
  };

  connect() {
    // const userId = parseInt(
    // 	document.querySelector('#game-show').dataset.userId
    // );

    // console.log(userId);
    // console.log(this.userIdValue);
    console.log(this.pointsValue)

    const answers = this.element.querySelectorAll('.point-1round-orange');

    // if (userId === this.userIdValue) {
    Array.from(answers)
      .slice(0, this.pointsValue)
      .forEach((answer) => {
        answer.classList.add('flash');
      });
    // }
  }
}
