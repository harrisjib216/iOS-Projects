//
//  ViewController.m
//  enabler
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


- (IBAction)enableObjects:(id)sender {
    self.segCtrl.enabled = true;
    self.btn.enabled = true;
    self.field.enabled = true;
    self.toggler.enabled = true;
    
    self.field.selected = true;
}

- (IBAction)disableObjects:(id)sender {
    self.segCtrl.enabled = false;
    self.btn.enabled = false;
    self.field.enabled = false;
    self.toggler.enabled = false;
}

@end
