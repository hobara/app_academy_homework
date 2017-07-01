Array.prototype.uniq = function() {
  // for (i = 0; i < arr.length; i++ )
  let newArray = [];
  this.forEach(function(element) {
    if (!newArray.includes(element)) {
      newArray.push(element);
    }
  });
  return newArray;
};

Array.prototype.twoSum = function() {
  let pairsArray = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let x = i+1; i < this.length; x++) {
      if (this[i] + this[x] === 0) {
        pairsArray.push([i, x]);
      }
    }
  }
  return pairsArray;
};

Array.prototype.transpose = function() {
  let transposeArray = [];
  for (let i = 0; i < this.length; i++) {
    let subArray = [];
    for (let x = 0; x < this.length; x++) {
      subArray.push(this[x][i]);
    }
    transposeArray.push(subArray);
    subArray = [];
  }
  return transposeArray;
};
