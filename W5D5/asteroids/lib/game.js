let Asteroid = require('./asteroid.js');
let Util = require('./utils.js');

function Game() {
  this.DIM_X = 500;
  this.DIM_Y = 500;
  this.NUM_ASTEROIDS = 10;
  this.asteroids = [];

  while(this.asteroids.length < 10) {
    this.addAsteroids();
  }
}

Game.prototype.addAsteroids = function () {
  let newAsteroid = new Asteroid(this.prototype.randomPosition());
  this.asteroids.push(newAsteroid);
};

Game.prototype.randomPosition = function() {
  let xPos = Math.random(Math.floor(this.DIM_X));
  let yPos = Math.random(Math.floor(this.DIM_Y));
  return [xPos, yPos];
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect();
  this.asteroids.forEach(asteroid => asteroid.draw());
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach(asteroid => asteroid.move());
};

module.exports = Game;
