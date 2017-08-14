//longest phrase

//define function with array as parameter
//define check variable
//loop through array
//if length of a string is longer than check variable, set equal to check variable
//return check variable

function longestPhrase(phrases){
  var check = "";
  for(i = 0; i < phrases.length; i++){
    if(phrases[i].length > check.length){
      check = phrases[i];
    }
  }
  return check

}


function pairMatch(obj1, obj2){
  var returnVal = false;
  for (var key in obj1) {
    if (obj1.hasOwnProperty(key) && obj2.hasOwnProperty(key)) {
      if(obj1[key] == obj2[key]){
       //console.log(key + " -> " + obj1[key]);
       returnVal = true;
      }
    }
  }
  return returnVal;
}


function randomStrings(number){
  var strings = [];
  var newRandomString = ""
  var alphabet = "abcdefghijklmnopqrstuvwxyz";
  var stringLength
  for(i = 0; i < number; i++){
    newRandomString = "";
    stringLength = Math.floor(Math.random() * 10 + 1);
    while(newRandomString.length < stringLength){
      newRandomString += alphabet[Math.floor(Math.random() * alphabet.length)];
    }
    strings.push(newRandomString);
  }
  return strings;
}

console.log(longestPhrase(["333", "22", "1", "444"]));
console.log(longestPhrase(["long phrase","longest phrase","longer phrase"]));

console.log(pairMatch({name: "Steven", age: 54}, {name: "Tamir", age: 54}));
console.log(pairMatch({animal: "Dog", legs: 4}, {animal: "Dog", legs: 3}));

for(j = 0; j < 10; j++){
  arr = randomStrings(4);
  console.log(arr);
  console.log("Longest phrase is " + longestPhrase(arr));
}