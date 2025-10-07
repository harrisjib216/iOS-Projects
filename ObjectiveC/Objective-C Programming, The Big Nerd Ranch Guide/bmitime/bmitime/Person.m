//
//  Person.m
//  bmitime
//
//  Created by development on 1/6/25.
//

#import "Person.h"

@implementation Person

//- (float) heightInMeters {
//    return heightInMeters;
//}
//
//- (void)setHeightInMeters:(float)h {
//    heightInMeters = h;
//}
//
//- (int) weightInKilos {
//    return weightInKilos;
//}
//
//- (void)setWeightInKilos:(int)w {
//    weightInKilos = w;
//}

@synthesize heightInMeters, weightInKilos;

- (float)bodyMassIndex {
//    return weightInKilos / (heightInMeters * heightInMeters);
    float h = [self heightInMeters];
    return [self weightInKilos] / (h * h);
}

@end
