#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <float.h>
#include <time.h>

typedef struct {
    double x, y;
} Point;

Point x[] = {{1,2}, {23,45}, {88,32}, {62,37}, {40,23}, {17,23}, {56,10}, {91,39}};

double distance(Point a, Point b) {
    return (a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y);
}

void kmeans(Point *x, int N, int K) {
    Point k[K];
    int cluster[N], count[K];
    Point new_k[K];

    srand(time(NULL));

    k[0] = x[rand() % N];  
    for (int i = 1; i < K; i++) {
        double max_dist = -1;
        for (int j = 0; j < N; j++) {
            double min_dist = DBL_MAX;
            for (int l = 0; l < i; l++) {
                double d = distance(x[j], k[l]);
                if (d < min_dist) min_dist = d;
            }
            if (min_dist > max_dist) {
                max_dist = min_dist;
                k[i] = x[j];
            }
        }
    }

    int changed;
    do {
        changed = 0;
        for (int i = 0; i < N; i++) {
            double min_dist = DBL_MAX;
            int cl = -1;
            for (int j = 0; j < K; j++) {
                double d = distance(x[i], k[j]);
                if (d < min_dist) {
                    min_dist = d;
                    cl = j;
                }
            }
            if (cluster[i] != cl) {
                cluster[i] = cl;
                changed = 1;
            }
        }

        for (int i = 0; i < K; i++) {
            new_k[i] = (Point){0, 0};
            count[i] = 0;
        }

        for (int i = 0; i < N; i++) {
            int cl = cluster[i];
            new_k[cl].x += x[i].x;
            new_k[cl].y += x[i].y;
            count[cl]++;
        }

        for (int i = 0; i < K; i++) {
            if (count[i] > 0) {
                new_k[i].x /= count[i];
                new_k[i].y /= count[i];
            }
        }

        double max_shift = 0;
        for (int i = 0; i < K; i++) {
            double shift = distance(k[i], new_k[i]);
            if (shift > max_shift) max_shift = shift;
            k[i] = new_k[i];
        }
    } while (changed && max_shift > 1e-6);
}

int main(int argv,char** argc) {
    int N = sizeof(x) / sizeof(x[0]);
    int K = N - 2;
    kmeans(x, N, K);
    return 0;
}
