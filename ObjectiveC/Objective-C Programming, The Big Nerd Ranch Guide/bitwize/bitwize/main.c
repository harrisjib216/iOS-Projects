//
//  main.c
//  bitwize
//
//  Created by development on 1/21/25.
//

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    unsigned char a = 0x3c;
    unsigned char b = 0xa9;
    unsigned char c = a | b;
    
    printf("Hex: %x | %x = %x\n", a, b, c);
    printf("Decimal: %d | %d = %d\n", a, b, c);
    
    
    unsigned char d = a & b;
    printf("Hex: %x & %x = %x\n", a, b, d);
    printf("Decimal: %d & %d = %d\n", a, b, d);
    
    
    unsigned char e = a ^ b;
    printf("Hex: %x ^ %x = %x\n", a, b, e);
    printf("Decimal: %d ^ %d = %d\n", a, b, e);
    
    
    unsigned char f = ~b;
    printf("Hex: The complement of %x is %x\n", b, f);
    printf("Decimal: The complement of %d is %d\n", b, f);
    
    
    unsigned char g = a << 2;
    printf("Hex: %x shifted left two places is %x\n", a, g);
    printf("Decimal: %d shifted left two places is %d\n", a, g);
    
    
    unsigned char h = a >> 1;
    printf("Hex: %x shifted right one place is %x\n", a, h);
    printf("Decimal: %d shifted right one place is %d\n", a, h);
    
    
    // challenge: create an unsigned 64 bit int where every other bit is turned on
    // two possible results (odd number and even number)
    // create the odd one
    
    // 1 1 1 1...
    
    uint64_t before = UINT64_MAX;
    uint64_t x = UINT64_MAX;
    bool shouldXor = false;
    int shift = 0;
    
    for (int i = 0; i < 64; i++) {
        if (shouldXor) {
            x = x ^ (1 << shift);
        }
        
        shift += 1;
        shouldXor = !shouldXor;
    }
    
    printf("Before: %lu\n", before);
    printf("After: %lu\n", x);
    
    return 0;
}
