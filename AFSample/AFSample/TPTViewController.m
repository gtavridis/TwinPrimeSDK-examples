//
//  Copyright (c) 2013-2015 Twin Prime Inc. <http://www.twinprime.com/>
//  All rights reserved.
//

#import "TPTViewController.h"
#import "../TwinPrimeSDK/TwinPrimeSDK.h"
#import "../AFNetworking-2.3.1/AFNetworking/AFNetworking.h"

@implementation TPTViewController

- (void) updateLabelWithString:(NSString*) str
{
    NSString* labelStr = [NSString stringWithFormat:@"%@\n%@", self.label.text, str];

    [self.label performSelectorOnMainThread:@selector(setText:) withObject:labelStr waitUntilDone:NO];
}

/*
 * Load some data using AFURLConnectionOperation.
 *
 * The request will be intercepted by Twin Prime SDK library because it was initialized with the kTPOptionHTTPSIntercept
 * option.
 */
- (void) loadUsingOperation
{
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://httpbin.org/get" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"HASH: %@", responseObject);
        [self updateLabelWithString:[NSString stringWithFormat:@"Read %@ bytes from AFRequest", @([[operation responseData] length])]];
        [self performSelector:@selector(loadUsingSession) withObject:nil afterDelay:1.0];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

/*
 * Load some data using AFURLSessionManager
 *
 * The AFHTTPSessionManager is initialized with a NSURLSessionConfiguration configured for acceleration by pass it to
 * +[TwinPrimeSDK sessionConfigurationWithConfiguration:]
 *
 * HTTP and HTTPS requests send using this Session Manager object will be accelerated.
 */
- (void) loadUsingSession
{
    NSURLSessionConfiguration* cfg = [NSURLSessionConfiguration defaultSessionConfiguration];
    cfg = [TwinPrimeSDK sessionConfigurationWithConfiguration:cfg];

    AFHTTPSessionManager* manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:cfg];

    [manager GET:@"http://httpbin.org/get" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"HASH: %@", responseObject);
        [self updateLabelWithString:[NSString stringWithFormat:@"Read %@ bytes from AFSession", @([task countOfBytesReceived])]];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performSelector:@selector(loadUsingOperation) withObject:nil afterDelay:1.0];
}

@end
