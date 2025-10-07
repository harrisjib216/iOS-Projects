//
//  main.m
//  vowel counter
//
//  Created by development on 1/20/25.
//

#import <Foundation/Foundation.h>
#import "NSString+VowelCounting.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%d", [@"Hello, World!" vowelCount]);
    }
    return 0;
}
