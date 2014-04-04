//
//  CFLShelf.h
//  Library
//
//  Created by Lauren Lee on 4/2/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFLShelf : NSObject

@property (weak, nonatomic) NSString *title;
@property (strong, nonatomic) NSMutableArray *books;

- (id)initWithTitle:(NSString*)title;

@end
