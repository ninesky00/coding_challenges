function balancedSum(arr) {
  // let i = 0;
  // let j = arr.length - 1;
  // let leftsum = arr[i];
  // let rightsum = arr[j];
  // while (i < j) {
  //   if (leftsum < rightsum) {
  //     i++;
  //     leftsum += arr[i];
  //   } else if (leftsum > rightsum) {
  //     j--;
  //     rightsum += arr[j];
  //   } else {
  //     return arr[i+1];
  //   }
  // }
  let sum = arr.reduce((a, b) => a + b, 0);
  let leftsum = 0;
  for (let i = 0; i < arr.length; i++) {
    if (leftsum === sum - leftsum - arr[i]) {
      return arr[i];
    }
    leftsum += arr[i];
  }
}


console.log(balancedSum([1, 4, 2, 5])); // 4
console.log(balancedSum([1, 2, 3, 4, 6])); // 4
console.log(balancedSum([1,4,1,2,5, 1]));