const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');
const Bullet = require('./bullet.js');

const COLOR = "green";
const RADIUS = 15;

Util.inherits(Ship, MovingObject);

function Ship (options) {
  MovingObject.call(this, options);

  this.pos = options.pos;
  this.vel = [0,0];
  this.color = COLOR;
  this.radius = RADIUS;
  this.game = options.game;
}

Ship.prototype.relocate = function () {
  this.pos = this.game.randomPos();
  this.vel = [0,0];
}

Ship.prototype.power = function (impulse) {
  let [x, y] = impulse;
  this.vel[0] += x;
  this.vel[1] += y;
}

Ship.prototype.fireBullet = function () {
  const p = this.pos;
  const v = this.vel;
  let bullet = new Bullet({
    pos: p,
    vel: v,
    game: this.game
  });

  // if (bullet.vel === [0,0]) {
  //   bullet.vel = [1,0];
  // }

  this.game.add(bullet);
}

module.exports = Ship;