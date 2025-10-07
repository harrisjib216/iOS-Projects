//
//  main.m
//  bmitime
//
//  Created by development on 1/6/25.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Employee.h"
#import "Asset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Person *person = [[Person alloc] init];
        
//        id person = [[Person alloc] init];
        
//        Person *person = [[Employee alloc] init];
//        [person setEmployeeID: 25];

//        Employee *person = [[Employee alloc] init];
//        [person setEmployeeID: 25];
//        
//        [person setWeightInKilos: 96];
//        [person setHeightInMeters: 1.8];
//        
//        float bmi = [person bodyMassIndex];
//        NSLog(@"Person (%d, %f) has a BMI of: %f", [person weightInKilos], [person heightInMeters], bmi);
        
        // trying to send a message it wont understand
        // [person fido]; // No visible @interface for 'Person' declares the selector 'fido'
        
        
        // each nsobject has an isa pointer, pointing to the class that created it
        // so that it can trace a theoretical linked list and find an method when a message is called
        // within a subclass
        
        
        
        
        
        NSMutableArray *employees = [NSMutableArray array];
        NSMutableDictionary *execs = [[NSMutableDictionary alloc] init];
        for (int i = 0; i < 10; i++) {
            Employee *person = [[Employee alloc] init];
            [person setWeightInKilos:90 + i];
            [person setHeightInMeters:1.8 - i/10.0];
            [person setEmployeeID:i];
            
            [employees addObject:person];
            
            if (i == 0) {
                [execs setObject:person forKey:@"ceo"];
            }
            
            if (i == 1) {
                [execs setObject:person forKey:@"cto"];
            }
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];

        for (int i = 0; i < 10; i++) {
            Asset *asset = [[Asset alloc] init];
            [asset setLabel: [NSString stringWithFormat:@"Laptop %d", i]];
            [asset setResaleValue:i*17];
            
            NSUInteger randomIndex = random() % [employees count];
            
            Employee *randomEmployee = [employees objectAtIndex:randomIndex];
            [randomEmployee addAssetsObject:asset];
            
            [allAssets addObject: asset];
        }
        
        // sorting
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
        NSSortDescriptor *ei = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
        [employees sortUsingDescriptors:[NSArray arrayWithObjects:voa, ei, nil]];
        
        NSLog(@"Employees: %@", employees);
        NSLog(@"Giving up ownership of one employee");
        [employees removeObjectAtIndex:5];
        NSLog(@"All assets: %@", allAssets);
        NSLog(@"execs: %@", execs);
        execs = nil;

        
        // filtering
        NSPredicate *predicate = [NSPredicate predicateWithFormat: @"holder.valueOfAssets > 70"];
        NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate];
        toBeReclaimed = nil;
        
        NSLog(@"Giving up ownership of array");
        allAssets = nil;
        employees = nil;
    }
    
    sleep(100);
    return 0;
}
