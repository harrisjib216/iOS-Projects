//
//  Person.m
//  MemoryTesting
//
//  Created by development on 1/9/25.
//

#import "Person.h"

@implementation Person

//- (void)dealloc
//{
//    NSLog(@"Deallocating: %@", self);
//}

- (NSString *)description
{
    return [self name];
}

// STRONG version
//@synthesize name, assets;
//- (void)addAsset:(Asset *)a
//{
//    [assets addObject:a];
//}


// WEAK version
@synthesize name;

- (Asset *)assets
{
    return [self assets];
}

- (void)addAsset:(Asset *)a
{
    if (assets == nil) {
        assets = [[NSMutableArray alloc] init];
    }

    [assets addObject:a];
}

@end
