void bubbleSort(int numbers[], int array_size){
    int i, j, temp;
     
    for (i = (array_size - 1); i >= 0; i--) {
        for (j = 1; j <= i; j++) {
            if (numbers[j-1] > numbers[j]) {
                temp = numbers[j-1];
                numbers[j-1] = numbers[j];
                numbers[j] = temp;
            }
        }
    }
}
