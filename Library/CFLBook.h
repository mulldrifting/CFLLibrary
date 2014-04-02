//
//  CFLBook.h
//  Library
//
//  Created by Lauren Lee on 4/2/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CFLShelf;

@interface CFLBook : NSObject

@property NSString *title;

- (id)initWithTitle:(NSString*)title;
- (void)enshelf:(CFLShelf*)shelf;
- (void)unshelf:(CFLShelf*)shelf index:(int)index;

@end
