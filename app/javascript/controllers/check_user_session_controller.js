import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check-user-session"
export default class extends Controller {
  static targets = ["button"]

  connect() {
    console.log("check-user-session")
  }

  desactivate_button() {
    console.log("bouton-desactive")
  }
}

// si l'utilisateur clique sur le bouton multijoueur il est rédirigé vers la connexion
