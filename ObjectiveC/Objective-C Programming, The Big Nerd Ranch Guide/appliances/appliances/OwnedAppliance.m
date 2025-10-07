//
//  OwnedAppliance.m
//  appliances
//
//  Created by development on 1/18/25.
//

#import "OwnedAppliance.h"

@implementation OwnedAppliance

- (id)initWithProductName:(NSString *)pn
{
    return [self initWithProductName:pn firstOwnerName:nil];
}

- (id)initWithProductName:(NSString *)pn firstOwnerName:(NSString *)n
{
    self = [super init];
    
    if (self) {
        owners = [[NSMutableSet alloc] init];
        
        if (n) {
            [owners addObject:n];
        }
    }
    
    return self;
}

- (void)addOwner:(nonnull NSString *)n {
    [owners addObject:n];
}


- (void)removeOwner:(nonnull NSString *)n {
    [owners removeObject:n];
}

@end
