//
//  CFLLibrary.m
//  Library
//
//  Created by Lauren Lee on 4/2/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "CFLLibrary.h"

@implementation CFLLibrary

- (id)initWithTitle:(NSString *)title shelves:(NSMutableArray *)shelves {
    if ((self = [super init])) {
        self.title = title;
        self.shelves = [NSMutableArray arrayWithObjects:nil];
    }
    return self;
}

@end
