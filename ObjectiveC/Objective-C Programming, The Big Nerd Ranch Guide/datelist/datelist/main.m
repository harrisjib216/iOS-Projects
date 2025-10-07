//
//  main.m
//  datelist
//
//  Created by development on 1/3/25.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"ns array");
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval: 24 * 60 * 60];
        NSDate *yesterday = [now dateByAddingTimeInterval: -24 * 60 * 60];
        
        NSArray *dates = [NSArray arrayWithObjects:now, tomorrow, yesterday, nil];
        
        NSLog(@"There are %lu dates", [dates count]);
        NSLog(@"The first date is %@", [dates objectAtIndex: 0]);
        NSLog(@"The third date is %@", [dates objectAtIndex: 2]);
        
        NSLog(@"index looping");
        NSUInteger dateCount = [dates count];
        for (int i = 0; i < dateCount; i++) {
            NSDate *d = [dates objectAtIndex: i];
            NSLog(@"Date: %@", d);
        }
        
        NSLog(@"fast enumeration looping");
        for (NSDate *date in dates) {
            NSLog(@"Date: %@", date);
        }
        
        
        NSLog(@"ns mutable array");
        NSMutableArray *mutableDates = [NSMutableArray array];
        
        [mutableDates addObject: now];
        [mutableDates addObject: tomorrow];
        [mutableDates insertObject:yesterday atIndex:0];
        
        for (NSDate *date in mutableDates) {
            NSLog(@"Here is a date: %@", date);
        }
        
        [mutableDates removeObjectAtIndex:2];
        NSLog(@"Now the last object is: %@", [mutableDates objectAtIndex: [mutableDates count] - 1]);
        

//         both crash
//        NSLog(@"Too low: %@", [mutableDates objectAtIndex: -1]);
//        NSLog(@"Too high: %@", [mutableDates objectAtIndex: 3]);

    }
    return 0;
}
