//
//  CFLBookDatabase.h
//  Library
//
//  Created by Lauren Lee on 4/3/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFLBookDatabase : NSObject

+ (NSMutableArray *)loadBooks;
+ (NSString *)nextBookDocPath;


@end
