//
//  ViewController.m
//  iTahDoodle
//
//  Created by development on 1/14/25.
//

#import "ViewController.h"

NSString *docPath(void)
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathList objectAtIndex:0] stringByAppendingPathComponent:@"data.td"];
}

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Config

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    // listen for background events
    [[NSNotificationCenter defaultCenter] addObserver:self
                                                selector:@selector(handleAppDidEnterBackground:)
                                                    name:@"AppDidEnterBackgroundNotification"
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                                selector:@selector(handleAppWillTerminate:)
                                                    name:@"AppDidWillTerminateNotification"
                                                  object:nil];
    
    // load existing todo list items from the plist or create an empty array
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
        tasks = [plist mutableCopy];
    } else {
        tasks = [NSMutableArray array];
    }
    
    // TODO: REMOVE
//    [self fillTableWithTestData];
    
    
    // get screen size
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat width = screenBounds.size.width;
    CGFloat height = screenBounds.size.height;
    
    
    // make frames for: table, field, and submit btn
    CGRect fieldFrame = CGRectMake(16, 70, width - (32 + 70 + 16), 40);
    CGRect buttonFrame = CGRectMake(width - (70 + 16), 70, 70, 40);
    CGRect tableframe = CGRectMake(0, 110, width, height - 16);
    
    
    // config table
    taskTable = [[UITableView alloc] initWithFrame:tableframe
                                             style:UITableViewStylePlain];
    [taskTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [taskTable setDataSource:self];
    
    
    // config text field
    taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Enter a task, tap insert"];
    
    
    // config insert btn
    insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:buttonFrame];
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    [insertButton setBackgroundColor:[UIColor systemBlueColor]];
    [insertButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[insertButton layer] setCornerRadius: 8.0];
    [insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // add elements
    [[self view] addSubview:taskTable];
    [[self view] addSubview:taskField];
    [[self view] addSubview:insertButton];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)handleAppDidEnterBackground:(NSNotification *)notification {
    [tasks writeToFile:docPath() atomically:YES];
}

- (void)handleAppWillTerminate:(NSNotification *)notification {
    [tasks writeToFile:docPath() atomically:YES];
}

#pragma mark - Screen functionality

- (void)addTask:(id)sender
{
    NSString *t = [taskField text];
    if ([t isEqualToString:@""]) {
        return;
    }
    
    [tasks addObject:t];
    [taskTable reloadData];
    [taskField setText:@""];
    [taskField resignFirstResponder];
}

- (void)fillTableWithTestData
{
    if ([tasks count] == 0) {
        [tasks addObject:@"wall the dogs"];
        [tasks addObject:@"feed the hogs"];
        [tasks addObject:@"chop the logs"];
    }
}


#pragma mark - UITableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *c = [taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    if (!c) {
        c = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    NSString *item = [tasks objectAtIndex:[indexPath row]];
    [[c textLabel] setText:item];
    
    return c;
}

@end
