//
//  ViewController.m
//  fader
//
//  Created by development on 11/29/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)fade: (bool) shouldFadeIn {
    const float value = shouldFadeIn ? 1.0 : 0.0;
    
    if (shouldFadeIn) {
        // old animation api for fade in
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:2.0];
        
        self.label.alpha = value;
        self.segmentControl.alpha = value;
        self.textField.alpha = value;
        self.slider.alpha = value;
        self.toggle.alpha = value;
        
        
        [UIView commitAnimations];
    } else {
        // new animation api for fade out
        [UIView
         animateWithDuration:2.0
         animations: ^{
            self.label.alpha = value;
            self.segmentControl.alpha = value;
            self.textField.alpha = value;
            self.slider.alpha = value;
            self.toggle.alpha = value;
        }];
    }
}

- (IBAction)fadeIn:(id)sender {
    [self fade: true];
}

- (IBAction)fadeOut:(id)sender {
    [self fade: false];
}

@end
