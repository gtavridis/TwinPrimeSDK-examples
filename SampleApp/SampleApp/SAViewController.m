//
//  Copyright (c) 2013-2015 Twin Prime Inc. <http://www.twinprime.com/>
//  All rights reserved.
//

#import "SAViewController.h"


@interface SAViewController ()
@property NSUInteger objSize;
@end

@implementation SAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performSelector:@selector(urlreq) withObject:nil afterDelay:1];
}

- (void)urlreq
{
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://httpbin.org/get"]];
    (void)[[NSURLConnection alloc] initWithRequest:req delegate:self];
}

#pragma mark - NSURLConnectionDataDelegate
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    self.objSize += [data length];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self.resultLabel performSelectorOnMainThread:@selector(setText:) withObject:@"Received Error" waitUntilDone:NO];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString* result = [NSString stringWithFormat:@"Received %@ bytes", @(self.objSize)];
    self.resultLabel.text = result;
}

@end
