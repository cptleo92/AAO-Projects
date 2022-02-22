const Util = require("./utils.js");

function MovingObject (options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
  this.isWrappable = true;
}

MovingObject.prototype.draw = function (ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI)
  ctx.fill();
}

MovingObject.prototype.move = function (delta = 1) {
  let pos = [this.pos[0] + (this.vel[0] * delta), this.pos[1] + (this.vel[1] * delta)];  
  if (this.game.isOutOfBounds(pos)) {
    if (this.isWrappable) {
      pos = this.game.wrap(pos);
    } else {
      this.game.remove(this);
    }
  }
  this.pos = pos;  
}

MovingObject.prototype.isCollidedWith = function (otherObject) {
  let dist = Util.distance(this.pos, otherObject.pos);
  if (dist < this.radius + otherObject.radius) {  
    return true;
  } else {
    return false;
  }
}

MovingObject.prototype.collideWith = function (otherObject) {

}

module.exports = MovingObject;