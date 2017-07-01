let Util = require('./utils.js');
let MovingObject = require('./moving_object.js');

function Asteroid(info) {
  info.color = 'black';
  // info.pos =
  info.radius = 5;
  info.vel = Util.randomVec(1);
  MovingObject.call(this, info);
}



Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
