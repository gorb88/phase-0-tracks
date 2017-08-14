var colors = ["blue", "brown", "vantablack", "green"];
var names = ["Spartacus", "Thunder", "Kona", "Butternut"];

console.log(names[1]);
console.log(colors[2]);

names.push("Dolores");
colors.push("Paint");

var horses = {};

for(i = 0; i < names.length; i++){
  horses[names[i]] = colors[i];
}

console.log(horses);

function Car(make, model, color){
  this.make = make;
  this.model = model;
  this.color = color;

  this.horn = function() { console.log("Beep!"); };

  console.log("Initialized a car");

}

newCar = new Car("Acura", "Legend", "Silver");

newCar.horn();
console.log(newCar.make);
console.log(newCar.model);

newCar2 = new Car("Chevrolet", "LUV", "Green");

newCar2.horn();
console.log(newCar2.make);
console.log(newCar2.model);