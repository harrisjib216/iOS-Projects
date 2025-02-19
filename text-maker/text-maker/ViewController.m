//
//  ViewController.m
//  text-maker
//
//  Created by development on 11/23/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

CGFloat fontSize = 30.0;
NSString *fontName = @"";

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)dismissKeyboard:(id)sender {
    self.label.text = self.textField.text;
    [self resignFirstResponder];
}

- (IBAction)red:(id)sender {
    self.label.textColor = [UIColor redColor];
}

- (IBAction)blue:(id)sender {
    self.label.textColor = [UIColor blueColor];
}

- (IBAction)green:(id)sender {
    self.label.textColor = [
        UIColor
        colorWithRed: 0.0
        green: 1.0
        blue: 0.0
        alpha: 1.0
    ];
}

- (IBAction)font1:(id)sender {
    fontName = @"Helvetica Neue";
    self.label.font = [UIFont fontWithName: fontName size: fontSize];
}

- (IBAction)font2:(id)sender {
    fontName = @"Menlo";
    self.label.font = [UIFont fontWithName: fontName size: fontSize];
}

- (IBAction)font3:(id)sender {
    fontName = @"Noteworthy";
    self.label.font = [UIFont fontWithName: fontName size: fontSize];
}

- (IBAction)font4:(id)sender {
    fontName = @"Impact";
    self.label.font = [UIFont fontWithName: fontName size: fontSize];
}

- (IBAction)shadow:(id)sender {
    self.label.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.label.layer.shadowOpacity = 0.25;
    self.label.layer.shadowRadius = 2.0f;
    self.label.layer.shadowOffset = CGSizeMake(2, 2);
}

- (IBAction)small:(id)sender {
    fontSize = 15.0;
    self.label.font = [self.label.font fontWithSize: fontSize];
}

- (IBAction)medium:(id)sender {
    fontSize = 30.0;
    self.label.font = [self.label.font fontWithSize: fontSize];
}

- (IBAction)large:(id)sender {
    fontSize = 45.0;
    self.label.font = [self.label.font fontWithSize: fontSize];
}


@end
