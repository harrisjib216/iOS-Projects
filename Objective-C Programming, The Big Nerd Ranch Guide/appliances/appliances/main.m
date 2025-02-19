//
//  main.m
//  appliances
//
//  Created by development on 1/18/25.
//

#import <Foundation/Foundation.h>
#import "Appliance.h"
#import "Test.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Appliance *a = [[Appliance alloc] init];
        NSLog(@"a is %@", a);
        [a setProductName:@"washing machine"];
        [a setVoltage:240];
        [a setValue:[NSNumber numberWithInt:241] forKey:@"voltage"];
        NSLog(@"a is %@", a);
        [a setValue:@"washing machine" forKey:@"productName"];
        NSLog(@"the product name is %@", [a valueForKey:@"productName"]);
        
        
        NSMutableString *x = [[NSMutableString alloc] initWithString:@"hey"];
        Test *t = [[Test alloc] init];
        
        NSLog(@"\n\nreadonly");
//          [t setV1:x]; -> No visible @interface for 'Test' declares the selector 'setV1:'
        NSLog(@"%@, %@", x, [t v1]);
        NSLog(@"%p, %p", &x, [t v2]);
        
        // everything below makes a pointer to point to x
        [x appendString:@"2"];
        NSLog(@"\n\nreadwrite");
        NSLog(@"%@, %@", x, [t v2]);
        NSLog(@"%p, %p", &x, [t v2]);
        [t setV2:x];
        NSLog(@"%@, %@", x, [t v2]);
        NSLog(@"%p, %p", &x, [t v2]);
        
        
        [x appendString:@"3"];
        // only used for non-objects
        NSLog(@"\n\nunsafe_unretained");
        NSLog(@"%@, %@", x, [t v3]);
        NSLog(@"%p, %p", &x, [t v3]);
        [t setV3:x];
        NSLog(@"%@, %@", x, [t v3]);
        NSLog(@"%p, %p", &x, [t v3]);


        [x appendString:@"4"];
        NSLog(@"\n\nstrong");
        NSLog(@"%@, %@", x, [t v4]);
        NSLog(@"%p, %p", &x, [t v4]);
        [t setV4:x];
        NSLog(@"%@, %@", x, [t v4]);
        NSLog(@"%p, %p", &x, [t v4]);

        
        [x appendString:@"5"];
        NSLog(@"\n\nweak");
        NSLog(@"%@, %@", x, [t v5]);
        NSLog(@"%p, %p", &x, [t v5]);
        [t setV5:x];
        NSLog(@"%@, %@", x, [t v5]);
        NSLog(@"%p, %p", &x, [t v5]);

        
        // this makes a true copy and places the copy into its own
        // memory address
        [x appendString:@"6"];
        NSLog(@"\n\ncopy");
        NSLog(@"%@, %@", x, [t v6]);
        NSLog(@"%p, %p", &x, [t v6]);
        [t setV6:x];
        NSLog(@"%@, %@", x, [t v6]);
        NSLog(@"%p, %p", &x, [t v6]);

        [x appendString:@" there!"];
        NSLog(@"\n\all after appending ' there!'");
        NSLog(@"%@, %@", x, [t v1]);
        NSLog(@"%@, %@", x, [t v2]);
        NSLog(@"%@, %@", x, [t v3]);
        NSLog(@"%@, %@", x, [t v4]);
        NSLog(@"%@, %@", x, [t v5]);
        NSLog(@"%@, %@", x, [t v6]);
        

    }
    return 0;
}
