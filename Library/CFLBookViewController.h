//
//  CFLBookViewController.h
//  Library
//
//  Created by Lauren Lee on 4/3/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFLBook.h"
#import "CFLShelf.h"

@interface CFLBookViewController : UITableViewController

@property (weak, nonatomic) CFLBook *book;

@end
