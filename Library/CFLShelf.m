//
//  CFLShelf.m
//  Library
//
//  Created by Lauren Lee on 4/2/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "CFLShelf.h"
#import "CFLBook.h"

@implementation CFLShelf

- (id)initWithTitle:(NSString *)title {
    if ((self = [super init])) {
        self.title = title;
        self.books = [NSMutableArray arrayWithObjects:[[CFLBook alloc] initWithTitle:@"New Book"], nil];
    }
    return self;
}

@end
