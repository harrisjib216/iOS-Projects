//
//  ViewController.h
//  hider
//
//  Created by development on 12/2/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

- (IBAction)showObjects:(id)sender;
- (IBAction)hideObjects:(id)sender;

@end

