//
//  Asset.m
//  bmitime
//
//  Created by development on 1/9/25.
//

#import "Asset.h"
#import "Employee.h"

@implementation Asset

@synthesize label, holder, resaleValue;

- (NSString *)description
{
    if ([self holder]) {
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@>", [self label], [self resaleValue], [self holder]];
    } else {
        return [NSString stringWithFormat:@"<%@: $%d unassigned>", [self label], [self resaleValue]];
    }
}

- (void)dealloc
{
    NSLog(@"Deallocating Asset: %@", self);
}

@end
