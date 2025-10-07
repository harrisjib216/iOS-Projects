//
//  Stock.h
//  stockholding
//
//  Created by development on 1/6/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Stock : NSObject {
    float purchaseSharePrice;
    float currentSharePrice;
    int numberOfShares;
}

@property float purchaseSharePrice;
@property float currentSharePrice;
@property int numberOfShares;

// purchaseSharePrice * numberOfShares
- (float) costInDollars;

// currentSharePrice * numberOfShares
- (float) valueInDollars;

@end

NS_ASSUME_NONNULL_END
