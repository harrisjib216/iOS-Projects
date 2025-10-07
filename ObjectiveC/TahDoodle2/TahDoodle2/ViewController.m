//
//  ViewController.m
//  TahDoodle2
//
//  Created by development on 1/17/25.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self todoListTable] setDataSource:self];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (void)createNewItem:(id)sender
{
    if (!todoItems) {
        todoItems = [NSMutableArray array];
    }
    
    [todoItems addObject:@"New item"];
    
    [[self todoListTable] reloadData];
}

- (void)deleteSelectedItem:(id)sender
{
    NSInteger row = [[self todoListTable] selectedRow];
        if (row > -1 && row < [todoItems count]) {
        [todoItems removeObjectAtIndex:row];
        [[self todoListTable] reloadData];
    }
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [todoItems count];
}

- (id)tableView:(NSTableView *)tableView
            objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    return [todoItems objectAtIndex:row];
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    [todoItems replaceObjectAtIndex:row withObject:object];
}


@end
