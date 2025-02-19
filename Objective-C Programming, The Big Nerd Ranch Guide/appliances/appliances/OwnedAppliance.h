//
//  OwnedAppliance.h
//  appliances
//
//  Created by development on 1/18/25.
//

#import <Foundation/Foundation.h>
#import "Appliance.h"

NS_ASSUME_NONNULL_BEGIN

@interface OwnedAppliance : Appliance
{
    NSMutableSet *owners;
}

// The designated initializer
- (id)initWithProductName:(NSString *)pn
           firstOwnerName:(NSString *)n;
- (void)addOwner:(NSString *)n;
- (void)removeOwner:(NSString *)n;

@end

NS_ASSUME_NONNULL_END
