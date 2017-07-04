const View = require("../js/ttt-view.js");
// require appropriate file
const Game = require("../js/game.js"); // require appropriate file

$( () => {
  const game = new Game();
  const view = new View(game, $("figure.ttt"));

  // Your code here
});
