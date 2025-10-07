//
//  ViewController.h
//  text-maker
//
//  Created by development on 11/23/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *font1Btn;
@property (weak, nonatomic) IBOutlet UIButton *font2Btn;
@property (weak, nonatomic) IBOutlet UIButton *font3Btn;
@property (weak, nonatomic) IBOutlet UIButton *font4Btn;

- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)red:(id)sender;
- (IBAction)blue:(id)sender;
- (IBAction)green:(id)sender;
- (IBAction)font1:(id)sender;
- (IBAction)font2:(id)sender;
- (IBAction)font3:(id)sender;
- (IBAction)font4:(id)sender;
- (IBAction)shadow:(id)sender;
- (IBAction)small:(id)sender;
- (IBAction)medium:(id)sender;
- (IBAction)large:(id)sender;

@end

