//
//  Employee.m
//  bmitime
//
//  Created by development on 1/8/25.
//

#import "Employee.h"
#import "Asset.h"

@implementation Employee

@synthesize employeeID;

- (void) addAssetsObject:(Asset *)a
{
    if (!assets) {
//        assets = [[NSMutableArray alloc] init];
        assets = [[NSMutableSet alloc] init];
    }
    
    [assets addObject:a];
    [a setHolder: self];
}

- (unsigned int) valueOfAssets
{
    unsigned int value = 0;
    for (Asset *a in assets) {
        value += [a resaleValue];
    }
    
    return value;
}

- (float) bodyMassIndex {
    float normalBmi = [super bodyMassIndex];
    return normalBmi * 0.9;
}

- (NSString *) description
{
    return [NSString stringWithFormat: @"<Employee %d: $%d in assets>", [self employeeID], [self valueOfAssets]];
}

@end
