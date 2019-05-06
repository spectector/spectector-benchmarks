#include <string.h>
#include <stdlib.h>
#include <stdint.h>

unsigned int array1_size = 16;
uint8_t array1[16] = { 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16 };
uint8_t temp = 0; /* Used so compiler won't optimize out victim_function() */

uint8_t mem_leak(size_t x) {
  if (x < array1_size) {
    return array1[x];
  }
  return 0;
}

void victim_function_v22(size_t x) {
  mem_leak(mem_leak(x));
}
