//
//  CFLLibrary.h
//  Library
//
//  Created by Lauren Lee on 4/2/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFLLibrary : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSMutableArray *shelves;

- (id)initWithTitle:(NSString*)title;

@end
