let Game = require('./game.js');

function GameView(game, ctx) {
  this.game = game;
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  setInterval(this.game.moveObjects(), 10);
  setInterval(this.game.draw(), 10);
};
