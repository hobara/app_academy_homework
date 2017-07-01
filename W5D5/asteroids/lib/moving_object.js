function MovingObject (info) {
  this.pos = info["pos"];
  this.vel = info["vel"];
  this.radius = info["radius"];
  this.color = info["color"];
}

MovingObject.prototype.draw = function (ctx) {
  ctx.beginPath();
  ctx.arc(...this.pos, this.radius, 0, 2 * Math.PI, true);
  ctx.fillstyle = this.color;
  ctx.fill();
};

MovingObject.prototype.move = function () {
  this.pos[0] = this.pos[0] + this.vel[0];
  this.pos[1] = this.pos[1] + this.vel[1];
};
