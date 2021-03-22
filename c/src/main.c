#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>

#define data_t uint8_t

size_t number_of_set_bits(data_t n) 
{ 
    size_t result = 0; 
    while (n) { 
        n &= (n - 1); 
        ++result; 
    } 
    return result; 
} 

size_t hamming_distance(data_t* x, data_t* y, size_t size){
  size_t result;
  size_t i;
  data_t tmp;
  result = 0;
  for (i=0; i < size; ++i){
    if (i>0) {
      x[i]=1;
      y[i]=1;
    } else {
      x[i]=1;
      y[i]=2;
    }
    tmp = x[i] ^ y[i];
    result += number_of_set_bits(tmp);
  }
  return(result);
}


data_t** allocate_array(size_t n_row, size_t n_col){
  size_t i;
  size_t j;
  data_t** result;
  result = (data_t **) malloc(n_row * sizeof(data_t *));
  for (i=0; i < n_row; ++i){
    result[i] = (data_t *) malloc(n_col * sizeof(data_t));
    for (j=0; j < n_col; ++j){
      result[i][j] = (data_t) 0;
    }
  }
  return(result);
}


data_t* find_nearest_neighbour(data_t* hash, size_t size, data_t** hashes, size_t n_row){
  data_t* result;
  size_t i;
  size_t distance;
  size_t best_distance;
  result = hashes[0];
  best_distance = hamming_distance(hashes[0], hash, size);
  for (i=1; i < n_row; ++i){
    distance = hamming_distance(hashes[i], hash, size);
    if (distance < best_distance) {
      result = hashes[i];
      best_distance = distance;
    }
  }
  return(result);
}


int main(int argc, char* argv[]){
  size_t size = 32;
  size_t n_hashes = 5000;
  size_t n_lookups = 100;
  size_t i;
  size_t j;
  data_t** nearest_neighbour;
  
  data_t** hashes;
  data_t** lookups;
  
  hashes = allocate_array(n_hashes, size);
  lookups = allocate_array(n_lookups, size);
  nearest_neighbour = allocate_array(n_lookups, size);
  
  #pragma omp parallel for private(i)
  for (i=0; i < n_lookups; ++i){
    nearest_neighbour[i] = find_nearest_neighbour(lookups[i], size, hashes, n_hashes);
    printf("Neighbour %i\n", (int) i);
    for (j=0; j < size; ++j){
      printf("%i", (int) nearest_neighbour[i][j]);
    }
    printf("\n");
  }
  
  free(nearest_neighbour);
  free(lookups);
  free(hashes);
  
  return 0;
}