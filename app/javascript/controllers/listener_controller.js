import { Controller } from '@hotwired/stimulus';

export default class extends Controller {

  static targets = ['clicktest'];

  yes() {
    console.log("yes")
    const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597547/RPUW/yes.mp3_xmcxrq.mp3');
    currentTarget = audio.play();
  }

  ouioui() {
    console.log("ouioui")
    const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597546/RPUW/ouioui.mp3_kv3pxq.mp3');
    currentTarget = audio.play();
  }

  no() {
    console.log("no")
    const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597547/RPUW/no.mp3_guuge0.mp3');
    currentTarget = audio.play();
  }

  non() {
    console.log("non")
    const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597546/RPUW/non.mp3_bmjunm.mp3');
    currentTarget = audio.play();
  }

  nop() {
    // console.log("nop")
    // const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597546/RPUW/non.mp3_bmjunm.mp3');
    // currentTarget = audio.play();
    const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597547/RPUW/no.mp3_guuge0.mp3');
    const audio2 = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597546/RPUW/non.mp3_bmjunm.mp3');
    const sounds = [audio, audio2];
    const rSound = Math.floor(Math.random() * sounds.length);
    currentTarget = rSound.audio.play();

  }

}
