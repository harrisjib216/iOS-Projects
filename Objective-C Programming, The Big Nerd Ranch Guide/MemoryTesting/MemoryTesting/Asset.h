//
//  Asset.h
//  MemoryTesting
//
//  Created by development on 1/9/25.
//

#import <Foundation/Foundation.h>
#import "DeletableObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface Asset : DeletableObject
{
    NSString *label;
    int value;
}

@property int value;

// Strong
//@property (strong) NSString *label;

// Weak
@property NSString *label;


@end

NS_ASSUME_NONNULL_END
