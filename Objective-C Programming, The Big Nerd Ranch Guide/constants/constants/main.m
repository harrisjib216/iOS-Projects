//
//  main.m
//  constants
//
//  Created by development on 1/12/25.
//

#import <Foundation/Foundation.h>

#define MYMAX(A, B) ((A) > (B) ? (A) : (B))

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"\u03c0 is %f", M_PI);
        NSLog(@"%d is larger", MAX(10, 12));
        
        NSLocale *here = [NSLocale currentLocale];
        NSString *currency = [here objectForKey: @"currency"];
        NSLog(@"Currency is %@", currency);
        NSLog(@"Currency is %@", [here objectForKey: NSLocaleCurrencyCode]);
    }
    return 0;
}
