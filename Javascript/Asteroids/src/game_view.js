const Game = require("./game.js");
const Keymaster = require("./keymaster.js")

function GameView (game, ctx) {
  this.game = game;
  this.ctx = ctx;
  this.lastTime = 0;
}

GameView.prototype.start = function () {
  this.bindKeyHandlers();
  requestAnimationFrame(this.animate.bind(this));
}

GameView.prototype.animate = function (time) {
  const timeDelta = time - this.lastTime;

  this.game.step(timeDelta);
  this.game.draw(this.ctx);
  this.lastTime = time;

  requestAnimationFrame(this.animate.bind(this));
}

GameView.prototype.bindKeyHandlers = function () {
  key('w, up', () => {
    this.game.ship.power([0, -1]);
  })
  key('a, left', () => {
    this.game.ship.power([-1, 0]);
  })
  key('s, down', () => {
    this.game.ship.power([0, 1]);
  })
  key('d, right', () => {
    this.game.ship.power([1, 0]);
  })
  key('f, j', () => {
    this.game.ship.fireBullet();
  })
}

module.exports = GameView;