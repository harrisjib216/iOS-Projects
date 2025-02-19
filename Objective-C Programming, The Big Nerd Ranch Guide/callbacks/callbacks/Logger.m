//
//  Logger.m
//  callbacks
//
//  Created by development on 1/12/25.
//

#import "Logger.h"

@implementation Logger
- (void) sayOuch:(NSTimer *)t {
    NSLog(@"ouch");
}

- (void) connection:(NSURLConnection *)connection
     didReceiveData:(nonnull NSData *)data
{
    NSLog(@"Received %lu bytes", [data length]);
    
    if (!incomingData) {
        incomingData = [NSMutableData data];
    }
    
    [incomingData appendData:data];
}

- (void) connectionDidFinishLOading:(NSURLConnection *)connection
{
    NSLog(@"Got it all!");
    NSString *string = [[NSString alloc] initWithData:incomingData encoding:NSUTF8StringEncoding];
    incomingData = nil;
    
    NSLog(@"string has %lu characters", [string length]);
}

- (void) connection:(NSURLConnection *)connection
   didFailWithError:(nonnull NSError *)error
{
    NSLog(@"Connection failed %@", [error localizedDescription]);
    incomingData = nil;
}

- (void) zoneChange: (NSNotification *)note
{
    NSLog(@" the system time zone has changed");
}
@end
