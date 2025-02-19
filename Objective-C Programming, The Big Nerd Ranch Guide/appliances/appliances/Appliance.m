//
//  Appliance.m
//  appliances
//
//  Created by development on 1/18/25.
//

#import "Appliance.h"

@implementation Appliance

@synthesize productName, voltage;

- (instancetype)init
{
    self = [super init];
    if (self) {
        return [self initWithProductName:@"?"];
    }
    return self;
}

- (id)initWithProductName:(NSString *)pn
{
    self = [super init];
    
    if (self) {
        [self setProductName:pn];
        [self setVoltage:120];
    }

    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %d volts>", productName, voltage];
}

@end
