//
//  ViewController.m
//  a calendar and clock
//
//  Created by development on 12/2/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateDisplay];
    timer = [NSTimer
            scheduledTimerWithTimeInterval: 1.0
            target: self
            selector: @selector(updateDisplay)
            userInfo:nil
            repeats: true];
    // Do any additional setup after loading the view.
}

- (void) updateDisplay {
    // get date and time
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat: @"EEEE, MMMM d, YYYY"];
    self.calendar.text = [dateFormat stringFromDate:[NSDate date]];
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat: @"HH:mm:ss a"];
    self.clock.text = [timeFormat stringFromDate:[NSDate date]];
}


@end
