//
//  Asset.m
//  MemoryTesting
//
//  Created by development on 1/9/25.
//

#import "Asset.h"

@implementation Asset

@synthesize label, value;

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@, $%d", [self label], [self value]];
}

//- (void)dealloc
//{
//    NSLog(@"Deallocating: %@", self);
//}

@end
