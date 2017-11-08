class View {
  constructor(hanoiGame, DOMEl) {
    this.game = hanoiGame;
    this.$el = DOMEl;
  }

  setupTowers() {
    this.on('click', function() {
      $('.disc-3').appendTo('.disc-space-3');
    });
  }
}

module.exports = View;
