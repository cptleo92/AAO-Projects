const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");
const Ship = require("./ship.js");
const Bullet = require("./bullet.js");

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Game = Game;
window.GameView = GameView;
window.Ship = Ship;
window.Bullet = Bullet;

window.addEventListener('DOMContentLoaded', (event) => {
  const canvas = document.getElementById("game-canvas");
  const ctx = canvas.getContext("2d");
  
  const g = new Game();
  const gv = new GameView(g, ctx);
  gv.start();
});

