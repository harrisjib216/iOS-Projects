//
//  ForeignStock.h
//  stockholding
//
//  Created by development on 1/8/25.
//

#import <Foundation/Foundation.h>
#import "Stock.h"

NS_ASSUME_NONNULL_BEGIN

@interface ForeignStock : Stock {
    float conversionRate;
}

@property float conversionRate;

@end

NS_ASSUME_NONNULL_END
