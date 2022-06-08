import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="gamestart"
export default class extends Controller {
  connect() {
    console.log("generique")
    const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597546/RPUW/generique.mp3_dfxaah.mp3');
    audio.play();
  }

  start() {
    console.log("generique")
    const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597546/RPUW/generique.mp3_dfxaah.mp3');
    audio.play();
  }
}
