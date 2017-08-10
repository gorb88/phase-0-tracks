//take the string
//declare new working string
// where i is the length of the string, increment down, until i is 0
//add indexed letter to working string
//return working string

function reverse(str){
  var workingString = "";

  for(var i = str.length - 1; i >= 0; i--){
    workingString += str.charAt(i);
  }

  return workingString;

}


var reversedString = reverse("Hotdog")


if(reversedString.length > 4){

  console.log(reversedString)

}