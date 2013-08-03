//
//  AppDelegate.m
//  HostApplication
//
//  Created by Tanaka Katsuma on 2013/08/03.
//  Copyright (c) 2013年 Tanaka Katsuma. All rights reserved.
//

#import "AppDelegate.h"

// Protocols
#import "GreetingPlugIn.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Get application bundle
    NSBundle *appBundle = [NSBundle mainBundle];
    
    // Get a path for plug-ins directory
    NSString *plugInsPath = [appBundle builtInPlugInsPath];
    
    // Load and use plug-ins
    NSError *error = nil;
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:plugInsPath error:&error];
    
    for (NSString *content in contents) {
        NSLog(@"Loading bundle: %@", content);
        
        // Create a NSBundle object representing a plug-in
        NSString *plugInPath = [plugInsPath stringByAppendingPathComponent:content];
        NSBundle *plugIn = [NSBundle bundleWithPath:plugInPath];
        
        // Load
        if (![plugIn load]) {
            NSLog(@"Failed to load plug-in.");
            break;
        }
        
        // Retrieving the principal class
        Class principalClass = [plugIn principalClass];
        
        // Validation
        if (![self plugInIsValid:principalClass]) {
            NSLog(@"Invalid plug-in.");
            break;
        }
        
        // Instantiating the principal class
        id<GreetingPlugIn> instance = [[principalClass alloc] init];
        
        // Greet
        NSLog(@"Greet: %@", [instance greet:@"questbeat"]);
    }
}

- (BOOL)plugInIsValid:(Class)plugInClass
{
    if ([plugInClass conformsToProtocol:@protocol(GreetingPlugIn)]) {
        if ([plugInClass instancesRespondToSelector:@selector(greet:)]) {
            return YES;
        }
    }
    
    return NO;
}

@end
