//
//  main.m
//  vowel movement
//
//  Created by development on 1/20/25.
//

#import <Foundation/Foundation.h>

typedef void (^ArrayEnumerationBlock)(id, NSUInteger, BOOL *);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *oldStrings = [NSArray arrayWithObjects:
                               @"Sauerkraut", @"Raygun", @"Macintosh", @"Mississippi", nil];
        NSLog(@"oldStrings: %@", oldStrings);
        
        NSMutableArray *newStrings = [NSMutableArray array];
        
        NSArray *vowels = [NSArray arrayWithObjects:
                           @"a", @"e", @"i", @"o", @"u", @"y", nil];
        
//        void (^devowelizer)(id, NSUInteger, BOOL *);
//        devowelizer = ^(id string, NSUInteger i, BOOL *stop)
//        void (^devowelizer)(id, NSUInteger, BOOL *) = ^(id string, NSUInteger i, BOOL *stop)
        ArrayEnumerationBlock devowelizer = ^(id string, NSUInteger i, BOOL *stop)
        {
            NSMutableString *newString = [NSMutableString stringWithString:string];
            
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
            }
            
            [newStrings addObject:newString];
        };
        [oldStrings enumerateObjectsUsingBlock:devowelizer];
        
//        [oldStrings enumerateObjectsUsingBlock: ^(id string, NSUInteger i, BOOL *stop)
//         {
//             NSMutableString *newString = [NSMutableString stringWithString:string];
//             
//             for (NSString *s in vowels) {
//                 NSRange fullRange = NSMakeRange(0, [newString length]);
//                 [newString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
//             }
//             
//             [newStrings addObject:newString];
//         }];
        
        NSLog(@"new strings: %@", newStrings);
        
        
        __block int counter = 0;
//        int counter = 0; // -> Variable is not assignable (missing __block type specifier)
        void (^incrementer)(void) = ^() {
            counter++;
        };
    }
    return 0;
}
