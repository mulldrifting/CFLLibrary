//
//  CFLShelfViewController.h
//  Library
//
//  Created by Lauren Lee on 4/2/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFLShelf.h"

@interface CFLShelfViewController : UITableViewController

@property (weak, nonatomic) CFLShelf *shelf;
@property (strong, nonatomic) NSString *plistCatPath;
@property (strong, nonatomic) NSMutableDictionary *bookDic;

@end
