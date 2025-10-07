//
//  main.m
//  callbacks
//
//  Created by development on 1/12/25.
//

#import <Foundation/Foundation.h>
#import "Logger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Logger *logger = [[Logger alloc] init];
        
//        [[NSNotificationCenter defaultCenter]
//         addObserver:logger selector:@selector(zoneChange:) name:NSSystemTimeZoneDidChangeNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:NSSystemTimeZoneDidChangeNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull notification) {
            [logger zoneChange:notification];
        }];
        
        NSURL *url = [NSURL URLWithString: @"https://www.gutenberg.org/cache/epub/205/pg205.txt"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:logger startImmediately:true];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(sayOuch:) userInfo:nil repeats:true];
        
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"Hello, World!");
    }
    return 0;
}
