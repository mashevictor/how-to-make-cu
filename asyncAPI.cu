#include<stdio.h>
#include <cuda_runtime.h>
#include <helper_cuda.h>
#include <helper_functions.h>

//__device__ int addem( int a, int b ) {
  //  return a + b;
//}

__global__ void add( int a, int b, int *c ) {
    *c = a+b;
    //*c = addem( a, b );
}

int main( void ) {
    int c;
    int *dev_c;
    checkCudaErrors( cudaMalloc( (void**)&dev_c, sizeof(int) ) );

    add<<<1,1>>>( 2000000, 7000000000, dev_c );

    checkCudaErrors( cudaMemcpy( &c, dev_c, sizeof(int),
                              cudaMemcpyDeviceToHost ) );
    printf( "2 + 7 = %d\n", c );
    checkCudaErrors( cudaFree( dev_c ) );

    return 0;
}


