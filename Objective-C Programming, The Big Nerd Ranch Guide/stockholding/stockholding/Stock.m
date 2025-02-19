//
//  Stock.m
//  stockholding
//
//  Created by development on 1/6/25.
//

#import "Stock.h"

@implementation Stock

@synthesize purchaseSharePrice, currentSharePrice, numberOfShares;

// purchaseSharePrice * numberOfShares
- (float) costInDollars {
    return [self purchaseSharePrice] * [self numberOfShares];
}

// currentSharePrice * numberOfShares
- (float) valueInDollars {
    return [self currentSharePrice] * [self numberOfShares];
}

@end
