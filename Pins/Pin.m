//
//  Pin.m
//  BlogReader
//
//  Created by Joshua Valdez on 11/11/13.
//  Copyright (c) 2013 Amit Bijlani. All rights reserved.
//

#import "Pin.h"

@implementation Pin

+ (id) pinWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}

- (id) initWithTitle:(NSString *)title {
    self = [super init];
    
    if ( self ){
        self.title = title;
        self.author = nil;
        self.thumbnail = nil;
    }
    
    return self;
}

- (NSURL *) thumbnailURL {
    return [NSURL URLWithString:self.thumbnail];
}

- (NSString *) formattedDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *tempDate = [dateFormatter dateFromString:self.date];
    
    [dateFormatter setDateFormat:@"EE MMM,dd"];
    return [dateFormatter stringFromDate:tempDate];
    
}

@end
