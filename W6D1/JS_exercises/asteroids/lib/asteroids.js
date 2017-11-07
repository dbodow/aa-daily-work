const GameView = require('./gameview.js');
const Asteroid = require('./asteroid.js');

document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("game-canvas");
  canvasEl.width = 1000;
  canvasEl.height = 1000;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "black";
  // ctx.fillRect(0, 0, 1000, 1000);

  const XXYY = new GameView(ctx);
  window.ast = ast;
  window.ast2 = ast2;
  window.ctx = ctx;

});



const ast = new Asteroid({ pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"});
const ast2 = new Asteroid({pos: [30, 30]});
