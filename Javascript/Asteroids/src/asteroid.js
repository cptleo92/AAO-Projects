const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');

const COLOR = "black";
const RADIUS = 20;

Util.inherits(Asteroid, MovingObject);

function Asteroid (options) {  
  MovingObject.call(this, options);
  this.color = COLOR;
  this.radius = RADIUS;
  this.vel = Util.randomVec(5);
}

module.exports = Asteroid;