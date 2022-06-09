import { Controller } from '@hotwired/stimulus';

export default class extends Controller {

  static targets = ['clicktest'];

  yes() {
    console.log("yes")
    const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654783443/RPUW/JJkkUo5y4Mh_bruitage-bonne-reponse-question-pour-un-champion_mp3cut.net_ww0daq_mp3cut.net_fjm3jw.mp3');
    audio.play();
  }

  ouioui() {
    console.log("ouioui")
    const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597546/RPUW/ouioui.mp3_kv3pxq.mp3');
    audio.play();
  }

  no() {
    console.log("no")
    const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654783590/RPUW/no.mp3_2_htkash_mp3cut.net_snmect.mp3');
    audio.play();
  }

  non() {
    console.log("non")
    const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597546/RPUW/non.mp3_bmjunm.mp3');
    audio.play();
  }

  nop() {
    // console.log("nop")
    // const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597546/RPUW/non.mp3_bmjunm.mp3');
    // currentTarget = audio.play();
    const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597547/RPUW/no.mp3_guuge0.mp3');
    const audio2 = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597546/RPUW/non.mp3_bmjunm.mp3');
    const sounds = [audio, audio2];
    const rSound = Math.floor(Math.random() * sounds.length);
    rSound.audio.play();

  }

}
