//
//  Test.h
//  appliances
//
//  Created by development on 1/20/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Test : NSObject

@property (readonly) NSString *v1;
@property (readwrite) NSString *v2;
@property (unsafe_unretained) NSString *v3;
@property (strong) NSString *v4;
@property (weak) NSString *v5;
@property (copy) NSString *v6;

@end

NS_ASSUME_NONNULL_END
