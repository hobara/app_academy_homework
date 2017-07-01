const range = (start, end) => {
  if (start === end) {
    return [start];
  }
  return [start].concat(range(start+1, end));
};

const sumRec = (arr) => {
  if (arr.length <= 1) {
    return arr[0];
  }
  return arr[0] + sumRec(arr.slice(1));
};

const exponent = (base, exp) => {
  if ( exp === 0 ) {
    return 1;
  } else if ( exp === 1 ) {
    return base;
  }
  return base * exponent(base, exp-1);
};

const exponent_two = (base, exp) => {
  if ( exp === 0 ) {
    return 1;
  } else if ( exp === 1 ) {
    return base;
  }
  if (exp%2 === 0) {
    return exponent_two(base, exp/2) ** 2;
  } else {
    return base * (exponent_two(base, (exp-1)/2) ** 2);
  }
};

const fibonacci = (n) => {
  const fibNum = [1, 1]
  if (n === 1) {
    return [1];
  } else if (n === 2) {
    return fibNum;
  } else if (n === 0) {
    return [];
  }
  const fibs = fibonacci(n-1)
  return fibs.concat(fibs[fibs.length-1] + fibs[fibs.length-2]);
};

const bsearch = (arr, target) => {
  let middleIndex = Math.floor(arr.length / 2);
  if (arr.length === 0) {
    return -1;
  } else if ( arr[middleIndex] === target ) {
    return middleIndex;
  } else if ( arr[middleIndex] < target ) {
    return middleIndex + bsearch(arr.slice(middleIndex+1, arr.length), target);
  } else if ( arr[middleIndex] > target ) {
    return bsearch(arr.slice(0, middleIndex-1), target);
  }
};
