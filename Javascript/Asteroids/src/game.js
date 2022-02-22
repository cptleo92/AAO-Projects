const Asteroid = require('./asteroid.js')
const Ship = require('./ship.js')
const Bullet = require('./bullet.js');
const Util = require('./utils.js')

const DIM_X = 800;
const DIM_Y = 800;

const NUM_ASTEROIDS = 10;

function Game () {
  this.dim_x = DIM_X;
  this.dim_y = DIM_Y;
  this.num_asteroids = NUM_ASTEROIDS;
  this.asteroids = [];
  this.addAsteroids();
  this.ship = new Ship({pos: this.randomPos(), game: this});
  this.bullets = [];
}

Game.prototype.allObjects = function () {
  return this.asteroids.concat([this.ship].concat(this.bullets));
}

Game.prototype.isOutOfBounds = function (pos) {
  let [x, y] = pos;
  return (x < 0 || x > this.dim_x || y < 0 || y > this.dim_y);
}

Game.prototype.add = function (obj) {
  if (obj instanceof Asteroid) {
    this.asteroids.push(obj);
  }

  if (obj instanceof Bullet && this.bullets.length <= 6) {
    this.bullets.push(obj);
  }
}

Game.prototype.addAsteroids = function () { 
  for (i = 1; i <= this.num_asteroids; i++) {
    let ass = new Asteroid({
      pos: this.randomPos(),
      game: this
    });
   this.asteroids.push(ass);
  }
}

Game.prototype.randomPos = function () {
  let x = Math.random() * DIM_X;
  let y = Math.random() * DIM_Y;
  return [x, y];
}

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, this.dim_x, this.dim_y);
  this.allObjects().forEach(ass => {
    ass.draw(ctx);
  })
}

Game.prototype.moveObjects = function (delta = 1) {
  this.allObjects().forEach(ass => {
    ass.move(delta);
  })
}

Game.prototype.wrap = function (pos) {
  let [x, y] = pos;
  if (x > this.dim_x) {
    x -= this.dim_x;    
  }

  if (y > this.dim_y) {
    y -= this.dim_y;
  }

  if (x < 0) {
    x += this.dim_x;    
  }

  if (y < 0) {
    y += this.dim_y;
  }

  return [x, y];
}

Game.prototype.checkCollisions = function () {
  this.allObjects().forEach(obj1 => {
    this.allObjects().forEach(obj2 => {
      if (obj1 !== obj2 && obj1.isCollidedWith(obj2)) {            
        obj1.collideWith(obj2);
      }
    })
  })
}

Game.prototype.step = function () {
  this.moveObjects();
  this.checkCollisions();
}

Game.prototype.remove = function (obj) {
  if (obj instanceof Asteroid) {
    let idx = this.asteroids.indexOf(obj);
    this.asteroids.splice(idx, 1);
  }

  if (obj instanceof Bullet) {
    let idx = this.bullets.indexOf(obj);
    this.bullets.splice(idx, 1);
  }

}

module.exports = Game;