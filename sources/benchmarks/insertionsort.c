int a[] = {1};
int array_size = 1;

void insertionSort()
{
    int i, j, index;
    for (i = 1; i < array_size; ++i)
    {
        index = a[i];
        for (j = i; j > 0 && a[j-1] > index; j--)
            a[j] = a[j-1];

        a[j] = index;
    }
}
