//
//  main.c
//  numbers
//
//  Created by development on 12/20/24.
//

#include <stdio.h>
#include <math.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    unsigned long long num = 255;
    printf("%lld in decimal is %lld \n", num, num);
    printf("%lld in octal is %llo \n", num, num);
    printf("%lld in hexadecimal is %llx \n", num, num);
    printf("%u in hexadecimal is %u \n", num, num);
    
    
    
    // challenge
    printf("%.3f\n", sin(1));

    return 0;
}
