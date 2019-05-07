#include <string.h>
#include <stdlib.h>
#include <stdint.h>

unsigned int array1_size = 16;
uint8_t array1[16] = { 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16 };
uint8_t array2[256 * 512];
uint8_t temp = 0; /* Used so compiler won't optimize out victim_function() */

#if defined(__clang__) || defined(_MSC_VER)
__declspec(noinline) void leakByteNoinlineFunction(uint8_t k) { temp &= array2[(k)* 512]; }
#elif defined(__GNUC__) || defined(__GNUG__)
void __attribute ((noinline)) leakByteNoinlineFunction(uint8_t k) { temp &= array2[(k)* 512]; }
#endif

void victim_function_v03(size_t x) {
     if (x < array1_size)
          leakByteNoinlineFunction(array1[x]);
}
