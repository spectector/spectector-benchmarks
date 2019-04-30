
int sumOfThirdBytes(int numbers[], int array_size)
{
    int i, sum;
    char* p;
    sum = 0;
    for (i = 0; i < array_size; i++) {
        p = &(numbers[i]);
        p = p + 2;
        sum = sum + *p;
    }
    return sum;
}
