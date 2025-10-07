//
//  Employee.h
//  bmitime
//
//  Created by development on 1/8/25.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@class Asset;

NS_ASSUME_NONNULL_BEGIN

@interface Employee : Person
{
    int employeeID;
    //    NSMutableArray *assets;
    NSMutableSet *assets;
}

@property int employeeID;

- (void) addAssetsObject:(Asset *)a;
- (unsigned int) valueOfAssets;

// no need to redeclare because it's already defined in Person.h
//- (float) bodyMassIndex;

@end

NS_ASSUME_NONNULL_END
