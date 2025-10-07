//
//  ViewController.h
//  traf lights
//
//  Created by development on 1/11/25.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *countdownTimer;
    NSTimer *scoreTimer;
    bool isRunningCountdown;
    bool isPlaying;
    int countdownInt;
    int scoreInt;
}

@property (weak, nonatomic) IBOutlet UIImageView *trafficLight;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
- (IBAction)startGameAction:(id)sender;

@end

