//
//  DeletableObject.m
//  MemoryTesting
//
//  Created by development on 1/9/25.
//

#import "DeletableObject.h"

@implementation DeletableObject

- (void)dealloc
{
    NSLog(@"Deallocating: %@", self);
}

@end
