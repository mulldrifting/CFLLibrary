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

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *whichShelf;

- (id)initWithTitle:(NSString*)title whichShelf:(NSString*)whichShelf;

@end
