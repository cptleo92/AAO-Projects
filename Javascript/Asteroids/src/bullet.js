const Util = require("./utils.js");
const MovingObject = require("./moving_object.js")

const COLOR = "blue";
const RADIUS = 3;

Util.inherits(Bullet, MovingObject);

function Bullet (options) {
  MovingObject.call(this, options);
  this.pos = options.pos;
  this.vel = Util.scale(options.vel, 2);
  if (this.vel[0] === 0 && this.vel[1] === 0) {this.vel = [3,0]};
  this.color = COLOR;
  this.radius = RADIUS;
  this.game = options.game;
  this.isWrappable = false;
}

module.exports = Bullet; 