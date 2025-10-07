//
//  ViewController.h
//  TahDoodle
//
//  Created by development on 1/17/25.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSTableViewDataSource>
{
    NSMutableArray *todoItems;
    IBOutlet NSTableView *itemTableView;
}

- (IBAction)createNewItem:(id)sender;

@end

