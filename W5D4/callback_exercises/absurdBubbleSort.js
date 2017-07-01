const readline = require('readline');


const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});



function askIfGreaterThan(el1, el2, callback){
    reader.question(`Is ${el1} greater than ${el2}?`, function (answer){
      if (answer === 'yes' || answer === 'y'){
        callback(true);
      // } else if (answer === 'y') {
      //   callback(true);
    } else {
        callback(false);
      }
    });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerbubbleSortLoop){
  // if (i < arr.length-1){
  if (i == (arr.length -1)) {
    outerbubbleSortLoop(madeAnySwaps);
    return;
  }
    askIfGreaterThan(arr[i], arr[i+1], function (isGreaterThan){
      if (isGreaterThan) {
        const temp = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = temp;
        madeAnySwaps = true;
      }

      innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerbubbleSortLoop);
    });

  // }
  // else
}

function absurdBubbleSort(arr, sortCompletionCallback) {

  function outerbubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps == true) {
      innerBubbleSortLoop(arr, 0, false, outerbubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  outerbubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});



// function absurdBubbleSort (arr, sortCompletionCallback){
//
//
// }
