import { Controller } from "@hotwired/stimulus"
import JSConfetti from 'js-confetti'
// Connects to data-controller="js-confetti"
export default class extends Controller {
  connect() {
    console.log("Hello")
    const jsConfetti = new JSConfetti()

    this.confetti = setInterval(() => {
      jsConfetti.addConfetti({
        confettiColors: [
          '#f7d648', '#e9933e', '#e85a19', '#a2bbdf', '#478fca', '#2a3a84',
        ],
        confettiRadius: 4,
        confettiNumber: 500,

      })

    }, 2000);
  }

  disconnect () {
    clearInterval(this.confetti)
  }
}
