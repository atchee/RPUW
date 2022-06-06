import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="desk"
export default class extends Controller {
  connect() {
    console.log("hello from desk controller")
    const answers = document.querySelectorAll('card-point-1round-looser');
  }
}
