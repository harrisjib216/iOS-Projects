//
//  ViewController.h
//  a calendar and clock
//
//  Created by development on 12/2/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *timer;
}

@property (weak, nonatomic) IBOutlet UILabel *calendar;
@property (weak, nonatomic) IBOutlet UILabel *clock;


@end

