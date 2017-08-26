console.log("this is so much fun!");



function addPinkBorder(event) {
  console.log("It's pink now");
  event.target.style.border = "20px dotted pink";


}

var photo = document.getElementById("funpic");
photo.addEventListener("click", addPinkBorder);