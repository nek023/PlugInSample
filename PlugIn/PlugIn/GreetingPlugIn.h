//
//  GreetingPlugIn.h
//  PlugIn
//
//  Created by Tanaka Katsuma on 2013/08/03.
//  Copyright (c) 2013年 Tanaka Katsuma. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GreetingPlugIn <NSObject>

@required
- (NSString *)greet:(NSString *)name;

@end
