//
//  main.m
//  MemoryTesting
//
//  Created by development on 1/9/25.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Asset.h"

// test allocating without assigning an owner
//void test(void) {
//    for (int i = 0; i < 5; i++) {
//        Person *p = [[Person alloc] init];
//        [p setName: [NSString stringWithFormat: @"Person %d", i]];
//        
//        NSLog(@"Created person %@", p);
//    }
//    
//    for (int i = 0; i < 3; i++) {
//        Asset *a = [[Asset alloc] init];
//        [a setLabel: [NSString stringWithFormat: @"Asset %d", i]];
//        [a setValue: rand()];
//        
//        NSLog(@"Created asset %@", a);
//    }
//}

// test allocating with an owner
void test(void) {
    NSMutableArray *people = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 5; i++) {
        Person *p = [[Person alloc] init];
        [p setName: [NSString stringWithFormat: @"Person %d", i]];
        
        NSLog(@"Created person %@", p);
        
        [people addObject: p];
        
        NSLog(@"Saved person %@", p);
    }
    
    for (int i = 0; i < 3; i++) {
        Asset *a = [[Asset alloc] init];
        [a setLabel: [NSString stringWithFormat: @"Asset %d", i]];
        [a setValue: rand() % 100];
        
        NSLog(@"Created asset %@", a);
        
        Person *p = [people objectAtIndex: rand() % 3];
        [p addAsset: a];
        
        NSLog(@"Saved asset (%@) to (%@)", a, p);
    }
    
//    for (Person *p in people) {
//        NSLog(@"%@", p);
//        
//        for (Asset *a in [p assets]) {
//            NSLog(@"> %@", a);
//        }
//    }
}

// test allocating without assigning an owner
// but using strong
//void test2(void) {
//    for (int i = 0; i < 5; i++) {
//        Person *p = [[Person alloc] init];
//        [p setName: [NSString stringWithFormat: @"Person %d", i]];
//    }
//}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // todo: make a C macro to call [test + i + 1]()
        test();
    }
    return 0;
}
