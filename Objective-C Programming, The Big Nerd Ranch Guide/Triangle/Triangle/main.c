//
//  main.c
//  Triangle
//
//  Created by development on 12/18/24.
//

#include <stdio.h>

int remainingAngle(float a, float b) {
    return 180.0 - (a + b);
}

int main(int argc, const char * argv[]) {
    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = remainingAngle(angleA, angleB);
    
    printf("The third angle is %.2f\n", angleC);
    
    return 0;
}
