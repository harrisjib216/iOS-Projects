//
//  ViewController.m
//  traf lights
//
//  Created by development on 1/11/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetGame];
}

- (void)resetGame {
    [self resetCountdown];
    [self resetScore];
    
    self.scoreLabel.text = [NSString stringWithFormat: @"0"];
    self.trafficLight.image = [UIImage imageNamed: @"trafficLight"];
}

- (void)resetCountdown {
    isRunningCountdown = false;
    countdownInt = 0;
    
    [countdownTimer invalidate];
    countdownTimer = nil;
}

- (void)resetScore {
    isPlaying = false;
    scoreInt = 0;
    
    [scoreTimer invalidate];
    scoreTimer = nil;
}

- (void)updateToRestart {
    [self resetScore];
    [self.startBtn setTitle:@"New game" forState:UIControlStateNormal];
}

- (IBAction)startGameAction:(id)sender {
    // if (isRunningCountdown && !isPlaying)
    //  do nothing
    // if (isRunningCountdown && isPlaying)
    //  do nothing
    
    if (!isRunningCountdown && !isPlaying) {
        // start the count down
        [self startCountdown];
        return;
    }
    
    if (!isRunningCountdown && isPlaying) {
        // reset the variables but keep the screen
        // sp the user can see their current score
        [self updateToRestart];
        NSLog(@"Stopping game");
    }
}

- (void) startCountdown {
    [self.startBtn setTitle:@"Get ready" forState:UIControlStateNormal];
    isRunningCountdown = true;
    countdownInt = 3;
    
    countdownTimer = [NSTimer
                      scheduledTimerWithTimeInterval:1.0
                      repeats:true
                      block:^(NSTimer * _Nonnull timer) {
        self.trafficLight.image = [UIImage imageNamed: [NSString stringWithFormat: @"trafficLight%i", self->countdownInt]];
        self.scoreLabel.text = [NSString stringWithFormat: @"%i", self->countdownInt];
        
        self->countdownInt -= 1;
        
        if (self->countdownInt == 0) {
            [self resetCountdown];
            [self beginScoring];
        }
    }];
}

- (void) beginScoring {
    [self.startBtn setTitle:@"Stop" forState:UIControlStateNormal];
    isPlaying = true;
    scoreInt = 0;
    
    scoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.0001 repeats:true block:^(NSTimer * _Nonnull timer) {
        self->scoreInt += 1;
        self.scoreLabel.text = [NSString stringWithFormat: @"%i", self->scoreInt];
    }];
}

@end
