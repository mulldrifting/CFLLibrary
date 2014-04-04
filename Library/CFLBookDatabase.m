//
//  CFLBookDatabase.m
//  Library
//
//  Created by Lauren Lee on 4/3/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "CFLBookDatabase.h"
#import "CFLBook.h"

@implementation CFLBookDatabase



+ (NSString *)getPrivateDocsDir {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@"Private Documents"];
    
    NSError *error;
    [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    
    return documentsDirectory;
    
}

+ (NSMutableArray *)loadBooks {
    
    // Get private docs dir
    NSString *documentsDirectory = [CFLBookDatabase getPrivateDocsDir];
    NSLog(@"Loading books from %@", documentsDirectory);
    
    // Get contents of documents directory
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:&error];
    if (files == nil) {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
        return nil;
    }
    
    // Create Book for each file
    NSMutableArray *retval = [NSMutableArray arrayWithCapacity:files.count];
    for (NSString *file in files) {
        if ([file.pathExtension compare:@"book" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:file];
            CFLBook *book = [[CFLBook alloc] initWithDocPath:fullPath];
            [retval addObject:book];
        }
    }
    
    return retval;
    
}

+ (NSString *)nextBookDocPath {
    
    // Get private docs dir
    NSString *documentsDirectory = [CFLBookDatabase getPrivateDocsDir];
    
    // Get contents of documents directory
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:&error];
    if (files == nil) {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
        return nil;
    }
    
    // Search for an available name
    int maxNumber = 0;
    for (NSString *file in files) {
        if ([file.pathExtension compare:@"book" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            NSString *fileName = [file stringByDeletingPathExtension];
            maxNumber = MAX(maxNumber, fileName.intValue);
        }
    }
    
    // Get available name
    NSString *availableName = [NSString stringWithFormat:@"%d.book", maxNumber+1];
    return [documentsDirectory stringByAppendingPathComponent:availableName];
    
}

@end
