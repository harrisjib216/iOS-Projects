//
//  Logger.h
//  callbacks
//
//  Created by development on 1/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Logger : NSObject {
    NSMutableData *incomingData;
}
- (void) sayOuch:(NSTimer *)t;
- (void) zoneChange: (NSNotification *)note;
@end

NS_ASSUME_NONNULL_END
