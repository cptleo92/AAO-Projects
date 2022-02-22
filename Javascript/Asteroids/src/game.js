const Asteroid = require('./asteroid.js')

const DIM_X = 800;
const DIM_Y = 800;
const NUM_ASTEROIDS = 10;

function Game () {
  this.dim_x = DIM_X;
  this.dim_y = DIM_Y;
  this.num_asteroids = NUM_ASTEROIDS;
  this.asteroids = this.addAsteroids();
}

Game.prototype.addAsteroids = function () {
  const asteroids = [];
  for (i = 1; i <= this.num_asteroids; i++) {
    let ass = new Asteroid({pos: this.randomPos()});
    asteroids.push(ass);
  }
  return asteroids;
}

Game.prototype.randomPos = function () {
  let x = Math.random() * DIM_X;
  let y = Math.random() * DIM_Y;
  return [x, y];
}

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, this.dim_x, this.dim_y);
  this.asteroids.forEach(ass => {
    ass.draw(ctx);
  })
}

Game.prototype.moveObjects = function () {
  this.asteroids.forEach(ass => {
    ass.move();
  })
}

module.exports = Game;