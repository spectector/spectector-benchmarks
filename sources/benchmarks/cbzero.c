#include <stdlib.h>

void cbzero(void *b, size_t length){
	char *p;

	for (p = b; length--;)
		*p++ = '\0';
}
