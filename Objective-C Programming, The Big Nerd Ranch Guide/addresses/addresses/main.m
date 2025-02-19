//
//  main.m
//  addresses
//
//  Created by development on 12/23/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("the main function starts at %p\n", main);
        
        int i = 17;
        printf("i equals %d\n", i);
        printf("i stores its value at this address %p\n", &i);
        
        int *addressOfI = &i;
        printf("addressOfI stores the 'address of i' at %p\n", addressOfI);
        printf("dereferencing the variable addressOfI returns %d\n", *addressOfI);
        
        *addressOfI = 89;
        printf("Now i is %d\n", i);
        printf("And its address is %p\n", &i);
        printf("And addressOfI equals %p\n", addressOfI);
        printf("dereferencing the variable addressOfI returns %d\n", *addressOfI);
        
        printf("An int is %zu bytes\n", sizeof(int));
        printf("A pointer is %zu bytes \n", sizeof(int *));
        
        printf(NULL == 0 ? "NULL equals zero\n" : "NULL does not equal zero\n");
        
        float *myPtr;
        myPtr = NULL;
        
        // an address is just a number
        // null equals zero
        // null equals the address of zero
        
        // w/ ptrs to objs, we use nil
        // nil means the address where no object lives
        
        
        // challenge
        printf("How much memory does a float consume? %lu bytes\n", sizeof(float));
        
        printf("How much memory does a short consume? %lu bytes\n", sizeof(short));
        // short = 2 bytes
        //     1 byte = 8 bits, 2 bytes * 8 bits per byte = 16 bits
        //     1 bit is for the sign
        //     15 and bits for the value
        
        printf("Smallest number in a short? %.0f\n", pow(2, 15));
        printf("Or %d\n", SHRT_MIN);
        
        printf("Largest number in a short? %.0f\n", pow(2, 15) - 1);
        printf("Or %d\n", SHRT_MAX);
        
        // unsigned short = 2 ^ 8 (since there's no bit reserved for the sign)
        printf("Largest number of an unsigned short? %.0f \n", pow(2, 16) - 1);
        printf("Or %d\n", USHRT_MAX);
    }
    return 0;
}
