#include <string.h>
#include <stdlib.h>
#include <stdint.h>

unsigned int array1_size = 16;
uint8_t array1[16] = { 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16 };
uint8_t array2[256 * 512];
uint8_t temp = 0; /* Used so compiler won't optimize out victim_function() */

void victim_function(size_t y) {
     if (y < array1_size) {
          int x = array1[y];
          temp &= array2[x * 64];
     }
}
