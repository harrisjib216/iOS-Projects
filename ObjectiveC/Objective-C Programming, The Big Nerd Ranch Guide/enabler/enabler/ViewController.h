//
//  ViewController.h
//  enabler
//
//  Created by development on 12/2/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)enableObjects:(id)sender;
- (IBAction)disableObjects:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segCtrl;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UITextField *field;
@property (weak, nonatomic) IBOutlet UISwitch *toggler;

@end

