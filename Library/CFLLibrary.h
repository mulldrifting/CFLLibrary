//
//  CFLLibrary.h
//  Library
//
//  Created by Lauren Lee on 4/2/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFLLibrary : NSObject

@property (strong) NSString *title;
@property (strong) NSMutableArray *shelves;

- (id)initWithTitle:(NSString*)title;

@end
