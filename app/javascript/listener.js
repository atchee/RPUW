const element = document.querySelector("#clickme");
console.log(element)
element.addEventListener("click", (event) => {

  console.log(element)
  // Do something (callback)
  const audio = new Audio('https://res.cloudinary.com/alk1805/video/upload/v1654597546/RPUW/ouioui.mp3_kv3pxq.mp3');
  event.currentTarget = audio.play();
});
