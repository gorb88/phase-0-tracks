//longest phrase

//define function with array as parameter
//define check variable
//loop through array
//if length of a string is longer than check variable, set equal to check variable
//return check variable

function longestPhrase(phrases){
  check = "";
  for(i = 0; i < phrases.length; i++){
    if(phrases[i].length > check.length){
      check = phrases[i];
    }
  }
  return check

}


function pairMatch(obj1, obj2){
  returnVal = false;
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

console.log(longestPhrase(["333", "22", "1", "444"]));
console.log(longestPhrase(["long phrase","longest phrase","longer phrase"]));

console.log(pairMatch({name: "Steven", age: 54}, {name: "Tamir", age: 54}));
console.log(pairMatch({animal: "Dog", legs: 4}, {animal: "Dog", legs: 3}));