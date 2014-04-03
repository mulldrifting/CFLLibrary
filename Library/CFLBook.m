//
//  CFLBook.m
//  Library
//
//  Created by Lauren Lee on 4/2/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "CFLBook.h"
#import "CFLShelf.h"

@implementation CFLBook

- (id)initWithTitle:(NSString *)title {
    if ((self = [super init])) {
        self.title = title;
    }
    return self;
}

- (void)enshelf:(CFLShelf *)shelf {
    [shelf.books addObject:self];
}
- (void)unshelf:(CFLShelf *)shelf index:(int)index {
    [shelf.books removeObjectAtIndex:index];
}
 

@end
