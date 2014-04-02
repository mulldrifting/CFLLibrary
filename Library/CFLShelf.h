//
//  CFLShelf.h
//  Library
//
//  Created by Lauren Lee on 4/2/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFLShelf : NSObject

@property NSString *title;
@property NSMutableArray *books;

- (id)initWithTitle:(NSString*)title books:(NSMutableArray *)books;

@end
