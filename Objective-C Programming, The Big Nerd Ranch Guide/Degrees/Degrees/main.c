//
//  main.c
//  Degrees
//
//  Created by development on 12/18/24.
//

#include <stdio.h>
#include <stdlib.h>

static float lastTemperature;

float fahrenheitFromCelsius(float cel) {
    lastTemperature = cel;
    
    float fahr = cel * 1.8 + 32.0;
    printf("%f Celsius is %f Fahrenheit\n", cel, fahr);
    
    return fahr;
}

int main(int argc, const char * argv[]) {
    float freezeInC = 0;
    float freezeInF = fahrenheitFromCelsius(freezeInC);
    printf("Water freezws at %f degrees Fahrenheit\n", freezeInF);
    printf("The last temperature converted was %f\n", lastTemperature);
    return EXIT_SUCCESS;
}
