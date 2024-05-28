// Exercise 6
// c)n

#include <stdio.h>

int count(int lst[], int size, int x) {
  int count = 0;
  
  for (int i = 0; i < size; i++) {
    if (lst[i] == x) {
      count++;
    }
  }
  return count;
}

int main() {
  int arr[] = {1, 2, 3, 4, 5, 2, 2};
  int size = sizeof(arr) / sizeof(arr[0]);
  int x = 2;
  
  printf("Count of %d is %d\n", x, count(arr, size, x));
  
  return 0;
}