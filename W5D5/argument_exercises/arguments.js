function sum (...args) {
  let total = 0;
  args.forEach((el) => {total += el;});
  return total;
}
console.log(sum(1,2,3,5));



Function.prototype.myBind = function (target, ...args) {
  return (...callArgs) => {
    return this.apply(target, args.concat(callArgs));
  };
};

Function.prototype.myBind = function (target) {
  let contextArgs = Array.from(arguments).slice(1);
  const that = this;
  return function () {
    const callArgs = Array.from(arguments);
    return that.apply(target, contextArgs.concat(callArgs));
  };
};


// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true
//
// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(breakfast, "meow", "Kush")();
// // Breakfast says meow to Kush!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// markov.says.myBind(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
//
// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(breakfast, "meow")("Markov");
// // Breakfast says meow to Markov!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");
// // Breakfast says meow to me!
// // true


let numbers = [];
//
function curriedSum(numArgs) {

  function _curriedSum(number) {
    numbers.push(number);

    if (numbers.length === numArgs) {
      return numbers.reduce( (total ,value) => {return total + value;});
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

// let f1 = curriedSum(3);
// console.log(f1 = f1(3));
// console.log(f1 = f1(3));
// console.log(f1 = f1(3));

Function.prototype.curry = function (numArgs) {
  // let that = this;
  const _curry = (number) => {
    numbers.push(number);

    if (numbers.length === numArgs) {
      return this.apply(this, numbers);
    } else {
      return _curry;
    }
  };
  return _curry;
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
console.log(f1 = f1(4)); // [Function]
console.log(f1 = f1(4)); // [Function]
console.log(f1 = f1(4)); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// or more briefly:
sumThree.curry(3)(4)(20)(6); // == 30
