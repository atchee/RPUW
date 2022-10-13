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
    console.log("generique")
    const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654783754/RPUW/mix_10s_audio-joiner.com_vj6qh1.mp3');
    audio.play();
  }

  disconnect() {
    clearInterval(this.confetti)
  }
}
