//
//  PlugIn.h
//  PlugIn
//
//  Created by Tanaka Katsuma on 2013/08/03.
//  Copyright (c) 2013年 Tanaka Katsuma. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// Protocols
#import "GreetingPlugIn.h"

@interface PlugIn : NSObject <GreetingPlugIn>

@end
