//
//  main.m
//  grocery and name finder
//
//  Created by development on 1/4/25.
//

#import <Foundation/Foundation.h>

void groceryChallenge_c15(void) {
    NSMutableArray *groceries = [NSMutableArray array];
    [groceries addObject: @"Carrots"];
    [groceries addObject: @"Apples"];
    [groceries addObject: @"Beets"];
    
    for (NSString *item in groceries) {
        NSLog(@"Item to buy: %@", item);
    }
}

void nameCallenge_c15(void) {
    NSString *namesFile = [NSString
                           stringWithContentsOfFile: @"/usr/share/dict/propernames"
                           encoding: NSUTF8StringEncoding
                           error: NULL];
    NSArray *names = [namesFile componentsSeparatedByString: @"\n"];
    
    NSString *wordsFile = [NSString
                           stringWithContentsOfFile: @"/usr/share/dict/words"
                           encoding: NSUTF8StringEncoding
                           error: NULL];
    NSArray *words = [wordsFile componentsSeparatedByString: @"\n"];
    
    for (NSString *a in names) {
        if (a.length < 1) {
            continue;
        }
        
        unichar firstCharA = [a characterAtIndex:0];
        
        for (NSString *b in words) {
            if (b.length < 1) {
                continue;
            }

            unichar firstCharB = [b characterAtIndex:0];
            
            if (
                firstCharA != firstCharB &&
                [a caseInsensitiveCompare:b] == NSOrderedSame
            ) {
                NSLog(@"This common proper name is also a word: %@, %@", a, b);
            }
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        groceryChallenge_c15();
        nameCallenge_c15();
    }
    
    return 0;
}

//
//In words
//    for each word
//        compare against each other word
//            if the indices are diff and the words match (case insensitive)
//                found a common proper name that is also a regular word
//Time: W * W * L (w = word list length, l = shortest word length), Space: 1 (max space is longest words in list)
//
//
//In proper names
//    for each name
//        compare against each word
//            if the word and name equate
//                log it
//Time: N * W * L (n = names list size, w = words list size, l = longest word in list), Space: 1
//
//
//Cache
//    place each word from Names into a dictionary
//        time: n, space: n
//    print each word from Words that is found in that dictionary
//        time: w, space: 1
//time: n + w, space: n
//
//    
