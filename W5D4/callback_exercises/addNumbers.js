const readline = require('readline');


const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question("Give me a number: ", function(answerStr) {
      const thisNumber = parseInt(answerStr);
      sum += thisNumber;
      console.log("Partial sum: " + sum);
      addNumbers(sum, numsLeft-1, completionCallback);
    });
  } else {
    completionCallback(sum);
  }
}

// addNumbers(0, 3, function (sum) {
//   console.log("Total Sum: " + sum);
//   reader.close();
// });


const x = function totalSum(sum) {
  console.log("Total sum: " + sum);
  reader.close();
};

//
addNumbers(0, 3, x);
