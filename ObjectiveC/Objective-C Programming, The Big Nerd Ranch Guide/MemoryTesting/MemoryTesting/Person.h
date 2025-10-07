//
//  Person.h
//  MemoryTesting
//
//  Created by development on 1/9/25.
//

#import <Foundation/Foundation.h>
#import "DeletableObject.h"
#import "Asset.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : DeletableObject
{
    NSString *name;
    NSMutableArray *assets;
}

// strong
//@property (strong) NSString *name;
//@property (nonatomic, strong) NSMutableArray *assets;
//- (void)addAsset:(Asset *) a;

// weak
@property NSString *name;
- (Asset *)assets;
- (void)addAsset:(Asset *) a;

@end

NS_ASSUME_NONNULL_END
