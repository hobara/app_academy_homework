
function madLib (verb, adjective, noun) {
  return 'We shall ' + verb.toUpperCase() + ' the ' + adjective.toUpperCase() + ' ' + noun.toUpperCase();
}
console.log(madLib('make', 'best', 'guac'));

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}
console.log(isSubstring("time to program", "time")); //true
console.log(isSubstring("Jump for joy", "joys")); //false

function fizzBuzz(array) {
  var res = [];
  for (var i = 0; i < array.length; i++) {
    if (array[i] % 15 === 0) {
    } else if ((array[i] % 3 === 0) || (array[i] % 5 === 0)) {
      res.push(array[i]);
    }
  }
  return res;
}
console.log(fizzBuzz([1,2,3,4,5,10,11,12,13,14,15]));

function isPrime(number) {
  var primes = [];
  for (var i = 2; i <= number; i++) {
    if (number % i === 0) {
      primes.push(i);
    }
  }
  if (primes.length === 1) {
    return true;
  } else {
    return false;
  }
}
console.log(isPrime(2)); // true
console.log(isPrime(10)); // false
console.log(isPrime(15485863)); // true
console.log(isPrime(3548563)); // false

function sumOfNPrimes(n) {
  var primes = [];
  var i = 2;
  while (primes.length < n) {
    if (isPrime(i)) {
      primes.push(i);
    }
    i++;
  }
  var sum = primes.reduce(function(a, b) {
    return a + b;
  }, 0);
  return sum;
}
console.log(sumOfNPrimes(0)); //0
console.log(sumOfNPrimes(1)); //2
console.log(sumOfNPrimes(4)); //17
