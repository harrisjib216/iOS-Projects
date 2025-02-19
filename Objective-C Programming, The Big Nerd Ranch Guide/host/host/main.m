//
//  main.m
//  host
//
//  Created by development on 1/3/25.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSHost *host = [NSHost currentHost];
        NSString *computerName = [host localizedName];
        
        NSLog(@"%@", computerName);
    }
    return 0;
}
