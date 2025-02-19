//
//  ViewController.m
//  text-field
//
//  Created by development on 11/22/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self resetState];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(onTextChange)
     name:UITextFieldTextDidChangeNotification
     object:self.textField
    ];
}

- (void)resetState {
//    self.label.text = @"Hello World";
//    self.textview.text = @"My name is not blake but i'm writing some objective c";
    self.label.text = @"Waiting";
    self.textview.text = @"Waiting for input...";
    self.textField.text = @"";

    self.submitBtn.enabled = false;
}

- (void)onTextChange {
    self.submitBtn.enabled = self.textField.text.length > 0;
}

- (IBAction)submitAction:(id)sender {
    self.label.text = @"Success!";
    self.textview.text = self.textField.text;
    [self dismissKeyboard];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]].location == NSNotFound) {
        return true;
    }
    
    [self dismissKeyboard];
    return false;
}

- (void) dismissKeyboard {
    // this dismisses whatever view is about "self"
    // [self resignFirstResponder];
    [self.view endEditing: true];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:UITextFieldTextDidChangeNotification
     object:self.textField
    ];
}

@end
