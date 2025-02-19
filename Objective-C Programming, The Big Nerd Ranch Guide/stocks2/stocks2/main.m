//
//  main.m
//  stocks2
//
//  Created by development on 1/14/25.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *stocks = [NSMutableArray array];
        
        // date
        NSDate *date = [NSDate date];
        [stocks addObject:date];
        
        // str
        NSString *documentTitle = @"A program to work with p-list files";
        [stocks addObject:documentTitle];
        
        // data
        NSData *data = [documentTitle dataUsingEncoding:NSUTF8StringEncoding];
        [stocks addObject:data];
        
        // bool
        NSString *question = @"Does this program talk about stocks?";
        [stocks addObject:question];
        
        NSNumber *includeStocks = [NSNumber numberWithBool:YES];
        [stocks addObject:includeStocks];
        
        // int
        NSString *numStocksLabel = @"How many stocks are being added?";
        [stocks addObject:numStocksLabel];
        
        NSNumber *numStocks = [NSNumber numberWithInt:2];
        [stocks addObject:numStocks];
        
        // float
        NSString *q2 = @"What is 1/2?";
        [stocks addObject:q2];
        
        NSNumber *a2 = [NSNumber numberWithFloat:0.5];
        [stocks addObject:a2];
        
        // dict
        NSMutableDictionary *stock;
        
        stock = [NSMutableDictionary dictionary];
        [stock setObject:@"appl" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:200] forKey:@"shares"];
        [stocks addObject: stock];
        
        stock = [NSMutableDictionary dictionary];
        [stock setObject:@"goog" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:160] forKey:@"shares"];
        [stocks addObject: stock];
        
        [stocks writeToFile:@"/tmp/stocks.plist" atomically:YES];
        
        // this will break because of what's above^
        NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/tmp/stocks.plist"];
        for (NSDictionary *d in stockList) {
            NSLog(@"I have %@ shares of %@", [d objectForKey:@"shares"], [d objectForKey:@"symbol"]);
        }
    }
    return 0;
}
