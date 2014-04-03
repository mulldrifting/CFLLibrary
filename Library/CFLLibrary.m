//
//  CFLLibrary.m
//  Library
//
//  Created by Lauren Lee on 4/2/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "CFLLibrary.h"
#import "CFLShelf.h"

@implementation CFLLibrary

- (id)initWithTitle:(NSString *)title {
    if ((self = [super init])) {
        self.title = title;
        self.shelves = [NSMutableArray arrayWithObjects:[[CFLShelf alloc] initWithTitle:@"New Shelf"], nil];
    }
    return self;
}

@end
