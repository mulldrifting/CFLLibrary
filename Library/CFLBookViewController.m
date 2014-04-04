//
//  CFLBookViewController.m
//  Library
//
//  Created by Lauren Lee on 4/3/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "CFLBookViewController.h"
#import "CFLShelfViewController.h"
#import "CFLLibraryViewController.h"
#import "CFLMasterViewController.h"
#import "CFLLibrary.h"
#import "CFLShelf.h"
#import "CFLBook.h"

@interface CFLBookViewController ()

@end

@implementation CFLBookViewController

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
    // Do any additional setup after loading the view.
    
    self.title = _book.title;
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 0;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyBasicCell" forIndexPath:indexPath];
//    
//    cell.textLabel.text = _shelf.books[indexPath.row][@"Title"];
//    
//    return cell;
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
