#include <stdio.h>
#include <stdlib.h>
#include "awsf1.h"
#include "image.h"
#define CL 1024
#define NI 512*CL

void grayscale(
  unsigned int* image_in,
  unsigned int* image_out,
  unsigned int size)
{
  for (int i = 0; i < size; i++)
  {
    unsigned int r, g, b, gray;

    r = image_in[i] & 0xff;
    g = (image_in[i] >> 8) & 0xff;
    b = (image_in[i] >> 16) & 0xff;

    gray = (((r*66 + g*129 + b*25) + 128) >> 8) + 16;

    image_out[i]  = (gray & 0xff) | (gray & 0xff) << 8 | (gray & 0xff) << 16;
  }
}


int main(){
        int *A;
        int *B;

        A = (int*)malloc(NI*sizeof(int));
        B = (int*)malloc(NI*sizeof(int));
        printf("[GPU] running : Loopback Application\n\n");

        for (int i = 0; i < NI; i++)
        {
                A[i] = i;
                B[i] = 8;
        } 
           
        float G[3][3] =
        {{1.0/16, 1.0/8, 1.0/16},
        {1.0/8, 1.0/4, 1.0/8},
        {1.0/16, 1.0/8, 1.0/16}};
     
        std::string file_input1("input.png");
        std::string file_output1("gaussian.png");
    
        Image image1(file_input1);

        unsigned int size1 = image1.height*image1.width;

        unsigned int* image_in1  = image1.array_in;
        unsigned int* image_out1 = image1.array_out;

        int height = image1.height;
        int width = image1.width; 


        printf("[GPU] offload : Loopback AFU simulation\n\n");

        #pragma omp target device(0) map(to: image_in1[:size1]) map(from: image_out1[:size1])
        #pragma omp parallel for //use(hrw) module(image_i)       
        for (int x = 0; x < height; x++)
        {
            for (int y = 0; y < width; y++)
            {
                bool is_out_of_bounds = false;
                if ((x == 0) |
                    (y == 0) |
                    (x == width - 1) |
                    (y == height - 1)) {
                    is_out_of_bounds = true;
                }

                int r = 0;
                int g = 0;
                int b = 0;
                for (int i = 0; i < 3; i++) {
                    for (int j = 0; j < 3; j++) {
                        if (!is_out_of_bounds) {
                            unsigned int position = (x - 1 + j)*width + (y - 1 + i);
                            r += G[i][j]*(image_in1[position] & 0xff);
                            g += G[i][j]*((image_in1[position] >>  8) & 0xff);
                            b += G[i][j]*((image_in1[position] >> 16) & 0xff);
                        }
                    }
                }
                image_out1[x*width + y] =
                            (r & 0xff) |
                            (g & 0xff) << 8 |
                            (b & 0xff) << 16;
            }
        }    

        image1.map_back();

        image1.write_png_file(file_output1);


        printf("[GPU] finish  : Loopback Application\n");
     
        std::string file_input("gaussian.png");
        std::string file_output("output.png");
    
        Image image(file_input);

        unsigned int size = image.height*image.width;

        unsigned int* image_in  = image.array_in;
        unsigned int* image_out = image.array_out;
        
        unsigned int* tmp = (unsigned int*)malloc(sizeof(unsigned int)*size);

        #pragma omp target device(AWSF1) map(to: image_in[:size]) map(from: image_out[:size])
        #pragma omp parallel use(hrw) module(image_1)
        {
            image_out[0] = image_in[0];
            for(int i = 0; i < size; i ++){
                image_out[i] = image_in[i];
            }       
        }

        image.map_back();

        image.write_png_file(file_output);

        return 0;       

}

