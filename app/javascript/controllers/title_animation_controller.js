import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="titleanimation"
export default class extends Controller {
  static targets = ['bounceTxt', 'wrapText']

  connect() {
    // console.log('io')
    // var myText = document.getElementById("bounceTxt").innerHTML,
    // wrapText = "";

    // for (var i = 0; i < myText.length; i++) {
    //   wrapText += "<em>" + myText.charAt(i) + "</em>";
    // }

    // document.getElementById("bounceTxt").innerHTML = wrapText;

    // var myLetters = document.getElementsByTagName("em"),
    //   j = 0;

    // function applyBounce() {
    //   setTimeout(function () {
    //     myLetters[j].className = "bounce-me";
    //     j++;
    //     console.log(myLetters[j])

    //     if (j < myLetters.length) {
    //         applyBounce();
    //     }
    //   }, 250);
    // }

    // applyBounce();
  }
}
