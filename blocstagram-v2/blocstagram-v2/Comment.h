//
//  Comment.h
//  blocstagram-v2
//
//  Created by Leah Padgett on 5/10/15.
//  Copyright (c) 2015 Leah Padgett. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Comment : NSObject

@property (nonatomic, strong) NSString *idNumber;

@property (nonatomic, strong) User *from;
@property (nonatomic, strong) NSString *text;

- (instancetype) initWithDictionary:(NSDictionary *)commentDictionary;

@end
