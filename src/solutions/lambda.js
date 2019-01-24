// lambda.js
// Lambda School model solution
function lambdaBubbleSort(arr) {
  let swappedValue;
  do {
    swappedValue = false;
    for (let i = 0; i < arr.length - 1; i++) {
      if (arr[i] > arr[i + 1]) {
        const temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
        swappedValue = true;
      }
    }
  } while (swappedValue);
  return arr;
}
