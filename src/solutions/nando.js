// nando.js
// Nando solution
function nandoBubbleSort(arr) {
  for (let i = 0, l = arr.length; i < l; i++) {
    for (let j = 1; j < l; j++) {
      if (arr[j - 1] > arr[j]) {
        const temp = arr[j - 1];
        arr[j - 1] = arr[j];
        arr[j] = temp;
      }
    }
  }
  return arr;
}
