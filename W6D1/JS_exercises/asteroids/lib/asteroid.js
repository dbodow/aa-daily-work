const Util = require('./util.js');
const MovingObject = require('./moving_object.js');

const Asteroid = function (params) {
  // debugger;
  MovingObject.call(this, params);
};

Util.inherits(Asteroid, MovingObject);

function randomVec(length) {
  const deg = 2 * Math.PI * Math.random();
  return Util.scale([Math.sin(deg), Math.cos(deg)], length);
}

Asteroid.prototype.color = 'yellow';
Asteroid.prototype.radius = 15;
Asteroid.prototype.vel = randomVec(10 * Math.random());


module.exports = Asteroid;
