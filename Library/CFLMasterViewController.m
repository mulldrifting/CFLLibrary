//
//  CFLMasterViewController.m
//  Library
//
//  Created by Lauren Lee on 4/2/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "CFLMasterViewController.h"
#import "CFLLibrary.h"
#import "CFLShelf.h"
#import "CFLBook.h"
#import "CFLDetailViewController.h"
#import "CFLLibraryViewController.h"
#import "CFLShelfViewController.h"

@interface CFLMasterViewController () 
@end

@implementation CFLMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.title = @"Libraries";
    
    CFLLibrary *library1 = [[CFLLibrary alloc] initWithTitle:@"Library1"];
    _libraries = [NSMutableArray arrayWithObjects:library1, nil];
    
    
    
//    CFLShelf *shelf1 = [[CFLShelf alloc] initWithTitle:@"Shelf1"];
//    CFLBook *book1 = [[CFLBook alloc] initWithTitle:@"Book1"];
//    [shelf1.books addObject:book1];
//    [library1.shelves addObject:shelf1];
//    [self.libraries addObject:library1];

    //self.navigationItem.leftBarButtonItem = self.editButtonItem;
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTapped:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_libraries) {
        _libraries = [[NSMutableArray alloc] init];
    }
    [_libraries insertObject:[[CFLLibrary alloc] initWithTitle:@"New Library"] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _libraries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyBasicCell" forIndexPath:indexPath];
    CFLLibrary *library = [self.libraries objectAtIndex:indexPath.row];
    cell.textLabel.text = library.title;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_libraries removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(void)didMoveToParentViewController:(UIViewController *)parent {
    [self.tableView reloadData];
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showLibrarySegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CFLLibrary *library = _libraries[indexPath.row];
        [[segue destinationViewController] setLibrary:library];
    }
}

@end
