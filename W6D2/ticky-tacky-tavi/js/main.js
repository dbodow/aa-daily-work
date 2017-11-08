const View = require('./ttt-view.js');
const Game = require('./game.js');

$( () => {
  const newGame = new Game();
  const board = $('.ttt');
  const newView = new View(newGame, board);
});
