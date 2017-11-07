const Asteroid = require('./asteroid.js');

const Game = function (ctx) {
  this.DIM_X = 1000;
  this.DIM_Y = 1000;
  this.NUM_ASTEROIDS = 10;
  this.asteroids = [];
  this.addAsteroids();
  this.ctx = ctx;
  this.draw();
};

Game.prototype.addAsteroids = function () {
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    // debugger;
    this.asteroids.push( new Asteroid( this.randomPosition() ));
  }
};

Game.prototype.randomPosition = function () {
  return { pos: [Math.random()*this.DIM_X, Math.random()*this.DIM_Y]};
};

Game.prototype.draw = function() {
  this.asteroids.forEach( (ast) => {
    ast.draw(this.ctx);
  });
};

Game.prototype.moveObjects = function(ctx) {
  this.asteroids.forEach( (ast) => {
    ast.move();
    ast.draw();
  });
};

module.exports = Game;
