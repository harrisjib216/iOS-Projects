//
//  main.m
//  stringz
//
//  Created by development on 1/12/25.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *str = [[NSMutableString alloc] init];
        
        for (int i = 0; i < 10; i++) {
            [str appendString:@"objective c is cool!\n"];
        }
        
        NSError *err = nil;
        
        BOOL success = [str writeToFile:@"/tmp/cool.txt"
            atomically:YES
            encoding:NSUTF8StringEncoding
            error:&err
        ];
        
        if (success) {
            NSLog(@"done writing /tmp/cool.txt");
        } else {
            NSLog(@"failed writing /tmp/cool.txt\n> %@", [err localizedDescription]);
        }
        
        
        str = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf" encoding:NSASCIIStringEncoding error:&err];
        
        if (!str) {
            NSLog(@"failed reading /etc/resolv.conf\n> %@", [err localizedDescription]);
        } else {
            NSLog(@"done reading /etc/resolv.conf\n> %@", str);
        }
    }
    return 0;
}
