const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');
const Bullet = require("./bullet.js");
// const Game = require('./game.js');

const COLOR = "black";
const RADIUS = 25;

Util.inherits(Asteroid, MovingObject);

function Asteroid (options) {  
  MovingObject.call(this, options);
  this.color = COLOR;
  this.radius = RADIUS;
  this.vel = Util.randomVec(5);
  this.game = options.game;
}

Asteroid.prototype.collideWith = function (otherObject) {
  if (otherObject instanceof Ship) {
    otherObject.relocate();
  }  

  if (otherObject instanceof Bullet) {
    this.game.remove(otherObject);
    this.game.remove(this);
  }
}

module.exports = Asteroid;