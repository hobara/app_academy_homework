Array.prototype.bubbleSort = function() {
  let sorted = false;
  while (sorted === false) {
    let i = 0;
    sorted = true;
    for (i; i < this.length-1; i++) {
      if (this[i] > this[i+1]) {
        [this[i+1], this[i]] = [this[i], this[i+1]];
        sorted = false;
      }
    }
  }
  return this;
};

String.prototype.substring = function() {
  const arr = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      let subArray = [this.substr(i,j)];
      arr.push(subArray);
    }
  }
  return arr;
};
