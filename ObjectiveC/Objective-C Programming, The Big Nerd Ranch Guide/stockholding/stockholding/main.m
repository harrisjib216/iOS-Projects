//
//  main.m
//  stockholding
//
//  Created by development on 1/6/25.
//

#import <Foundation/Foundation.h>
#import "Portfolio.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Portfolio *p = [[Portfolio alloc] init];
        [p makePortfolio];
        [p printPortfolio];
        [p printBalance];
    }
    
    return 0;
}
