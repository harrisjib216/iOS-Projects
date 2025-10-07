//
//  Portfolio.h
//  stockholding
//
//  Created by development on 1/9/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Portfolio : NSObject
{
    NSMutableArray *stocks;
}

- (NSMutableArray *) stocks;
- (void) makePortfolio;
- (void) printPortfolio;
- (void) printBalance;

@end

NS_ASSUME_NONNULL_END
