//
//  main.c
//  pbr
//
//  Created by development on 12/27/24.
//

#include <stdio.h>
#include <math.h>

void cartesianToPolar(float x, float y, double *rPtr, double *thetaPtr) {
    if (rPtr) {
        *rPtr = sqrt(x * x + y * y);
    }
    
    if (!thetaPtr) {
        return;
    }
    
    float theta;
    if (x == 0.0) {
        if (y == 0.0) {
            theta = 0.0;
        } else if (y > 0) {
            theta = M_PI_2;
        } else {
            theta = -M_PI_2;
        }
    } else {
        theta = atan(y/x);
    }
    
    *thetaPtr = theta;
}

int main(int argc, const char * argv[]) {
    double pi = 3.14;
    double intpart;
    double fracpart;
    
    fracpart = modf(pi, &intpart);
    
    printf("integer part = %.0f, fraction part = %.2f\n", intpart, fracpart);
    
    double x = 3.0;
    double y = 4.0;
    double radius;
    double angle;
    
    cartesianToPolar(x, y, &radius, &angle);
    printf("(%.2f, %.2f) becomes (%.2f radians, %.2f)\n", x, y, radius, angle);
    
    return 0;
}
