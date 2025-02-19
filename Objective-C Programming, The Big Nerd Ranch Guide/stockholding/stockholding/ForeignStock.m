//
//  ForeignStock.m
//  stockholding
//
//  Created by development on 1/8/25.
//

#import "ForeignStock.h"

@implementation ForeignStock

@synthesize conversionRate;

- (float)costInDollars {
    return [super costInDollars] * conversionRate;
}

- (float)valueInDollars {
    return [super valueInDollars] * conversionRate;
}

@end
