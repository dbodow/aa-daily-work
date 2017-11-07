
const MovingObject = function (params) {
  this.pos = params['pos'];
  if (params['vel']) this.vel = params['vel'];
  if (params['radius']) this.radius = params['radius'];
  if (params['color']) this.color = params['color'];
};


MovingObject.prototype.draw = function (ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI, true);
  ctx.fillStyle = this.color;
  ctx.fill();
};

MovingObject.prototype.move = function () {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
};

// test
// const mo = new MovingObject(
//   { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"}
// );


module.exports = MovingObject;

// ctx.beginPath();
// ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
// ctx.strokeStyle = "green";
// ctx.lineWidth = 5;
// ctx.stroke();
// ctx.fillStyle = "blue";
// ctx.fill();
