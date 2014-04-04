//
//  CFLShelfViewController.m
//  Library
//
//  Created by Lauren Lee on 4/2/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "CFLShelfViewController.h"
#import "CFLLibraryViewController.h"
#import "CFLMasterViewController.h"
#import "CFLBookViewController.h"
#import "CFLLibrary.h"
#import "CFLShelf.h"
#import "CFLBook.h"

@interface CFLShelfViewController ()

@end

@implementation CFLShelfViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = _shelf.title;
    
    _plistPath = @"/Users/Drifter/Documents/Books.plist";
    _bookDic = [[NSMutableDictionary alloc] initWithContentsOfFile:_plistPath];
    
//    NSLog(@"%@",[[NSBundle mainBundle] resourcePath]);
    
    _shelf.books = _bookDic[_shelf.title];
    
    //[self updateDic:_shelf.books];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_shelf.books) {
        NSLog(@"shelf.books reset");
        _shelf.books = [[NSMutableArray alloc] init];
    }
    CFLBook *book = [[CFLBook alloc] initWithTitle:@"New Book" whichShelf:_shelf.title];
    NSDictionary *entry = [[NSDictionary alloc] initWithObjectsAndKeys: book.title, @"Title", nil];
    [_shelf.books insertObject:entry atIndex:0];
//    NSLog(@"%@",_shelf.books);
    [self updateDic:_shelf.books];
//    [_bookDic setObject:_shelf.books forKey:_shelf.title];
    
//    [_bookDic writeToFile:_plistCatPath atomically:YES];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _shelf.books.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyBasicCell" forIndexPath:indexPath];

    cell.textLabel.text = _shelf.books[indexPath.row][@"Title"];

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UIAlertView *viewCreatureInfo   = nil;
//    NSString    *creatureInfo       = nil;
    
//    creatureInfo = [[NSString alloc] initWithFormat:@"Name:%@ Scientific Name: %@", self.bugArray[indexPath.row][@"Name"], self.bugArray[indexPath.row][@"Scientific Name"]];
//    creatureInfo = [[NSString alloc] initWithFormat:@"Name: Name Scientific Name: SName"];
//    viewCreatureInfo = [[UIAlertView alloc] initWithTitle: @"Creature" message:creatureInfo delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    //[viewCreatureInfo show];
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_shelf.books removeObjectAtIndex:indexPath.row];
        [self updateDic:_shelf.books];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
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


#pragma mark - Navigation

 //In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showBookSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //CFLBook *book = _shelf.books[indexPath.row];
        NSString *title = _shelf.books[indexPath.row][@"Title"];
        CFLBook *book = [[CFLBook alloc] initWithTitle:title whichShelf:_shelf.title];
        [[segue destinationViewController] setBook:book];
    }

}

- (void)updateDic:(NSMutableArray*)books {
    NSString *errorDesc = nil;
//    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString *plistPath = [rootPath stringByAppendingString:@"/Books.plist"];
    //NSLog(@"%@ %@", rootPath,plistPath);
   // NSString *plistPath = @"/Users/Drifter/Documents/Books.plist";
    [_bookDic setObject:books forKey:_shelf.title];
    if (_bookDic)
    {
        NSLog(@"entering write");
        [_bookDic writeToFile:_plistPath atomically:YES];
    } else
    {
        NSLog(@"[Error] Application Did Enter Background {saving file error}: %@", errorDesc);
    }
}


@end
