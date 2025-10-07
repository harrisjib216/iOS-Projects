//
//  ViewController.m
//  repeater
//
//  Created by development on 12/2/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initScreen];
}

- (void) initScreen {
    counter = 0;
    self.timeLabel.text = [NSString stringWithFormat:@"%i", counter];
}

- (void) updateTimer {
    counter += 1;
    self.timeLabel.text = [NSString stringWithFormat:@"%i", counter];
}

- (IBAction)startTimer:(id)sender {
    if (timer.isValid == false) {
        timer = [NSTimer
                 scheduledTimerWithTimeInterval: 1.0
                 target: self
                 selector: @selector(updateTimer)
                 userInfo: nil
                 repeats: true];
    }
}

- (void)pauseOrStopTimer:(id)sender {
    [timer invalidate];
}

- (void)resetOrRestartTimer:(id)sender {
    [timer invalidate];
    [self initScreen];
}

@end
