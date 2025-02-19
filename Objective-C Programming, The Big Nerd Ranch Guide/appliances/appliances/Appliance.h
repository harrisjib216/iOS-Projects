//
//  Appliance.h
//  appliances
//
//  Created by development on 1/18/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Appliance : NSObject
{
    NSString *productName;
    int voltage;
}

@property (copy, nonatomic) NSString *productName;
@property (nonatomic) int voltage;

// The designated initializer
- (id)initWithProductName:(NSString *)pn;

@end

NS_ASSUME_NONNULL_END
