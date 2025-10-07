//
//  ViewController.h
//  iTahDoodle
//
//  Created by development on 1/14/25.
//

#import <UIKit/UIKit.h>

// a func to return a location on the disk
// where we can save the to-do list
NSString *docPath(void);

@interface ViewController : UIViewController <UITableViewDataSource>
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    
    NSMutableArray *tasks;
}

- (void)addTask:(id)sender;

@end

