Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function (callback) {
  const newArr = [];

  this.myEach(element => newArr.push(callback(element)) );

  return newArr;
};


// Array.prototype.myReduce = function(callback, initialValue) {
//   if (initialValue) {
//     let accumulator = initialValue;
//     this.myEach(element => accumulator = callback(accumulator, element));
//     return accumulator;
//   }
//   else {
//     let accumulator = this[0];
//     let arr = this
//     arr = arr.slice(1)
//     arr.myEach(element => accumulator = callback(accumulator, element));
//     return accumulator;
//   }
//
// };

Array.prototype.myReduce = function(callback, initialValue) {
  let arr = this;
  if (!initialValue) {
    initialValue = arr[0];
    arr = arr.slice(1);
  }
  arr.myEach(element => initialValue = callback(initialValue, element));
  return initialValue;
};

// def something(arr)
//   arr.map { |el| el += 1 }
// end
//
// for (let i = 0; i < length; i++)
//
// el => (
//   el + 1
// )
//
//
// function(element) {
//   callback(element)
// }
