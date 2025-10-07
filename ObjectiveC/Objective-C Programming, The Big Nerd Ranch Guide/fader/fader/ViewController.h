//
//  ViewController.h
//  fader
//
//  Created by development on 11/29/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)fadeIn:(id)sender;
- (IBAction)fadeOut:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISwitch *toggle;

@end

