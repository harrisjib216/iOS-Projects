//
//  ViewController.m
//  ObjSwe
//
//  Created by development on 12/21/24.
//

#import "ViewController.h"
#import "ObjSwe-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create and configure the boatView
    UIViewController *boatView = [[BoatInterface new] returnBoatUI:@"Ahoy!"];
    [self addChildViewController:boatView];

    // Add the boatView's view as a subview
    boatView.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:boatView.view];

    // Set up constraints for full width and height of the safe area
    [NSLayoutConstraint activateConstraints:@[
        [boatView.view.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [boatView.view.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
        [boatView.view.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
        [boatView.view.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
    ]];

    // Notify the child view controller
    [boatView didMoveToParentViewController:self];
}


@end
