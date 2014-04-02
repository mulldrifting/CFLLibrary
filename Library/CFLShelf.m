//
//  CFLShelf.m
//  Library
//
//  Created by Lauren Lee on 4/2/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "CFLShelf.h"

@implementation CFLShelf

- (id)initWithTitle:(NSString *)title books:(NSMutableArray *)books {
    if ((self = [super init])) {
        self.title = title;
        self.books = [NSMutableArray arrayWithObjects:nil];
    }
    return self;
}

@end
