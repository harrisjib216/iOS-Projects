//
//  Person.h
//  bmitime
//
//  Created by development on 1/6/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    float heightInMeters;
    int weightInKilos;
}

//- (float) heightInMeters;
//- (void) setHeightInMeters: (float) h;
//- (int) weightInKilos;
//- (void) setWeightInKilos: (int) w;
@property float heightInMeters;
@property int weightInKilos;

- (float) bodyMassIndex;

@end

NS_ASSUME_NONNULL_END
