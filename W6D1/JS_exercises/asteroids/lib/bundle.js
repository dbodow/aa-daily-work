/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const GameView = __webpack_require__(1);
const Asteroid = __webpack_require__(3);

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


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(2);


const GameView = function (ctx) {
  this.game = new Game(ctx);
  this.ctx = ctx;
};

GameView.prototype.start = function() {
  setInterval(function() { this.game.moveObjects(); }, 20);
};


module.exports = GameView;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const Asteroid = __webpack_require__(3);

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


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(4);
const MovingObject = __webpack_require__(5);

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


/***/ }),
/* 4 */
/***/ (function(module, exports) {

const Util = {
  inherits: function inherits (childClass, parentClass) {
    function Surrogate () {}
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
  },

  scale: function scale (vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

module.exports = Util;


/***/ }),
/* 5 */
/***/ (function(module, exports) {


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


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map