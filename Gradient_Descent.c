#include <stdio.h>
#include <math.h>

double in[]  = {0,2,4,6,8,10,12,14,16};
double out[] = {0,6,10,14,18,22,26,30,34};

 // y =w*x + b
 // b:bias/intercept  w:weight/slope
double y(int x,double w,double b){
    return w*x+b;
}
double cost_function(int m,double w,double b){
    double cost=0;
    for(int i=0;i<m;i++){
        double error=y(in[i],w,b)-out[i];
        cost = cost + pow(error,2);
    }
    return cost/(2*m);
}

int main(int argc,char** argv){
    int m=sizeof(in)/sizeof(in[0]);
    long iterations = (long) 1e7;
    long freq = (long) 1e6;
    double alpha = 0.01; //learning rate
    double w=0;
    double b=0;
    for(int x=1;x<=iterations;x++){
        double curr_w=0;
        double curr_b=0;
        for(int i=0;i<m;++i){
            double curr_error = y(in[i],w,b)-out[i];
            curr_w += curr_error*in[i];
            curr_b += curr_error;
        }
        curr_b = (double) (1.0 /m) * curr_b;
        curr_w = (double) (1.0 /m) * curr_w;

        w = w - alpha*curr_w;
        b = b - alpha*curr_b;
        if(x%freq==0) 
            printf("Iteration %d: Cost = %f , w= %f, b = %f\n",x,cost_function(m,w,b),w,b);

    }
    return 0;
}
