//
//  ViewController.m
//  hider
//
//  Created by development on 12/2/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)hideObjects:(id)sender {
    self.label1.hidden = true;
    self.label2.hidden = true;
    self.label3.hidden = true;
}

- (IBAction)showObjects:(id)sender {
    self.label1.hidden = false;
    self.label2.hidden = false;
    self.label3.hidden = false;
}

@end
