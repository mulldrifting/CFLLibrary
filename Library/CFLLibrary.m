//
//  CFLLibrary.m
//  Library
//
//  Created by Lauren Lee on 4/2/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "CFLLibrary.h"
#import "CFLShelf.h"
#import "CFLBook.h"

@implementation CFLLibrary

- (id)initWithTitle:(NSString *)title {
    if ((self = [super init])) {
        self.title = title;
        self.shelves = [NSMutableArray arrayWithObjects:[[CFLShelf alloc] initWithTitle:@"Shelf1"], nil];
    }
    return self;
}

-(void)reportBooks {
    for (CFLShelf *currentShelf in self.shelves) {
        for (CFLBook *currentBook in currentShelf.books) {
            NSLog(@"%@", currentBook.title);
        }
    }
}

@end
