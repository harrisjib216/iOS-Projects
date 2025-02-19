//
//  ViewController.h
//  TahDoodle2
//
//  Created by development on 1/17/25.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSTableViewDataSource>
{
    NSMutableArray *todoItems;
}

@property (weak) IBOutlet NSTableView *todoListTable;
- (IBAction)createNewItem:(id)sender;
- (IBAction)deleteSelectedItem:(id)sender;

@end

