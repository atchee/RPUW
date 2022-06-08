import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="generique"
export default class extends Controller {
  connect() {
    console.log("generique")
    const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654681138/RPUW/OuiOuiGenerique2_kjfgln.mp3');
    audio.play();
  }
}
