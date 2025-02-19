//
//  main.m
//  timeaftertime
//
//  Created by development on 1/1/25.
//

#import <Foundation/Foundation.h>

void isDaylightSavingsTime(void) {
    NSTimeZone *stz = [NSTimeZone systemTimeZone];
    BOOL isDaylightSavingTime = [stz isDaylightSavingTime];
    NSLog(@"is it currently daylight savings time? %hhd", isDaylightSavingTime);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        isDaylightSavingsTime();
        
//        NSDate *now = [NSDate date];
        NSDate *now = [[NSDate alloc] init];

        NSLog(@"The new date lives at %p", now);
        NSLog(@"The date is now %@", now);
        
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970", seconds);
        
        double hundredThousand = 100000;
        NSDate *later = [now dateByAddingTimeInterval:hundredThousand];
        
        NSCalendar *currcal = [NSCalendar currentCalendar];
        NSUInteger day = [currcal
                          ordinalityOfUnit:NSDayCalendarUnit
                          inUnit:NSMonthCalendarUnit
                          forDate:now];
        NSLog(@"This day is %lu of the month", day);
        
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:2000];
        [comps setMonth:2];
        [comps setDay:24];
        [comps setHour:0];
        [comps setMinute:0];
        [comps setSecond:0];
        
        NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
        NSDate *dob = [cal dateFromComponents: comps];
        
        double secondssincebirth = [later timeIntervalSinceDate:dob];
        NSLog(@"It has been %f seconds since my birthday", secondssincebirth);

    }
    return 0;
}
