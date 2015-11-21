//
//  Copyright (c) 2013-2015 Twin Prime Inc. <http://www.twinprime.com/>
//  All rights reserved.
//

#import "TPTAppDelegate.h"
#import "../TwinPrimeSDK/TwinPrimeSDK.h"

@implementation TPTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*
     * AFURLConnectionOperation uses NSURLConnection "under the covers"
     * to accelerate these requests you need to start TwinPrimeSDK with
     * the following option:
     * kTPOptionHTTPIntercept: @"enable"
     */
    NSMutableDictionary *options = [[NSMutableDictionary alloc] init] ;
    [options setObject:@YES forKey:kTPOptionHTTPIntercept];

    [TwinPrimeSDK initWithKey:@"<Your-key-here>" options:options];

    return YES;
}
@end
