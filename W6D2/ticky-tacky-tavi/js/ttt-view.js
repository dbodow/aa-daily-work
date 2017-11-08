class View {
  constructor(game, $el) {
    this.el = $el;
    this.game = game;
    this.setupBoard();
    this.bindEvents(this.game);
  }

  bindEvents(game) {
    let useX = true;
    const self = this;
    $('.ttt ul li').click(function() {
      if ($(this).hasClass('markedX') || $(this).hasClass('markedO') || game.isOver()) {
        return;
      }

      $(this).css('background-color', 'white');
      if (useX) {
        $(this).addClass('markedX');
        useX = false;
      } else {
        $(this).addClass('markedO');
        useX = true;
      }
      // console.log($(this).attr('data').split(",").map(Number));
      self.makeMove($(this));

      if (game.winner()) {
        // alert(`${game.winner().toUpperCase()} is the WINNER!!!`);
        const $victoryMessage = $(`<h2>${game.winner().toUpperCase()} is the WINNER!!!</h2>`);
        $('body').append($victoryMessage);
      } else if (game.isOver()) {
        const $tieMessage = $(`<h2>It is a tie!!</h2>`);
        $('body').append($tieMessage);
      }
    });
  }

  makeMove($square) {
    this.game.playMove($square.data('pos').split(",").map(Number));
  }

  setupBoard() {
    this.el.append('<ul>');
    const $ul = this.el.find('ul');

    for (let i = 0; i < 9; i++) {
      let row = Math.floor(i / 3);
      let col = i % 3;
      let newLi = $('<li>').data('pos', `${[row, col]}`);
      this.el.find('ul').append(newLi);
      // this.el.find('ul li').attr('data', `${[row, col]}`);
    }
    const $li = $ul.find('li');

    $ul.css('width', '600px');
    $li.css('height', '200px');

    $li.css('box-sizing', 'border-box');
    $li.css('width', '200px');
    $li.css('border', '3px solid #ccc');
    $li.css('float', 'left');
    $ul.css('list-style-type', 'none');
  }
}

module.exports = View;
