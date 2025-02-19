//
//  ViewController.h
//  repeater
//
//  Created by development on 12/2/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *timer;
    int counter;
}

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

- (IBAction)startTimer:(id)sender;
- (IBAction)pauseOrStopTimer:(id)sender;
- (IBAction)resetOrRestartTimer:(id)sender;

@end

