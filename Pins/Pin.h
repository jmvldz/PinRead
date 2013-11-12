//
//  Pin.h
//  BlogReader
//
//  Created by Joshua Valdez on 11/11/13.
//  Copyright (c) 2013 Amit Bijlani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pin : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *url;

// Designated Initializer
- (id) initWithTitle:(NSString *)title;
+ (id) pinWithTitle:(NSString *)title;

- (NSURL *) thumbnailURL;
- (NSString *) formattedDate;

@end
