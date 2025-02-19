//
//  Portfolio.m
//  stockholding
//
//  Created by development on 1/9/25.
//

#import "Portfolio.h"
#import "Stock.h"
#import "ForeignStock.h"

@implementation Portfolio

- (NSMutableArray *)stocks {
    return stocks;
}

- (void) makePortfolio {
    stocks = [[NSMutableArray alloc] init];;
    
    Stock *s1 = [[Stock alloc] init];
    [s1 setPurchaseSharePrice: 10.0];
    [s1 setCurrentSharePrice: 14.0];
    [s1 setNumberOfShares: 5.0];
    
    Stock *s2 = [[Stock alloc] init];
    [s2 setPurchaseSharePrice: 61.0];
    [s2 setCurrentSharePrice: 22.0];
    [s2 setNumberOfShares: 7.0];
    
    Stock *s3 = [[Stock alloc] init];
    [s3 setPurchaseSharePrice: 7.0];
    [s3 setCurrentSharePrice: 11.0];
    [s3 setNumberOfShares: 28.0];
    
    ForeignStock *s4 = [[ForeignStock alloc] init];
    [s4 setPurchaseSharePrice: 10.0];
    [s4 setCurrentSharePrice: 10.0];
    [s4 setNumberOfShares: 10.0];
    [s4 setConversionRate: 22.0];
    
    ForeignStock *s5 = [[ForeignStock alloc] init];
    [s5 setPurchaseSharePrice: 25.0];
    [s5 setCurrentSharePrice: 11.0];
    [s5 setNumberOfShares: 19.0];
    [s5 setConversionRate: 32.0];
    
    ForeignStock *s6 = [[ForeignStock alloc] init];
    [s6 setPurchaseSharePrice: 195.0];
    [s6 setCurrentSharePrice: 301.0];
    [s6 setNumberOfShares: 2.0];
    [s6 setConversionRate: 0.45];
    
    ForeignStock *s7 = [[ForeignStock alloc] init];
    [s7 setPurchaseSharePrice: 92.0];
    [s7 setCurrentSharePrice: 81.0];
    [s7 setNumberOfShares: 103.0];
    [s7 setConversionRate: 405.0];
    
    [stocks addObject: s1];
    [stocks addObject: s2];
    [stocks addObject: s3];
    [stocks addObject: s4];
    [stocks addObject: s5];
    [stocks addObject: s6];
    [stocks addObject: s7];
}

- (void) printPortfolio {
    for (Stock *s in stocks) {
        NSLog(@"Stock [name]");
        NSLog(@"Purchase price $%f", [s purchaseSharePrice]);
        NSLog(@"Number of shares %d", [s numberOfShares]);
        NSLog(@"Current price $%f", [s currentSharePrice]);
        NSLog(@"Cost $%f", [s costInDollars]);
        NSLog(@"Value $%f", [s valueInDollars]);
        NSLog(@"");
    }
}

- (void) printBalance {
    float value = 0;
    
    for (Stock *s in stocks) {
        value += [s valueInDollars];
    }
    
    NSLog(@"Current balance $%f", value);
}

@end
