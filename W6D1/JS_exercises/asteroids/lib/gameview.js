const Game = require('./game.js');


const GameView = function (ctx) {
  this.game = new Game(ctx);
  this.ctx = ctx;
};

GameView.prototype.start = function() {
  setInterval(function() { this.game.moveObjects(); }, 20);
};


module.exports = GameView;
