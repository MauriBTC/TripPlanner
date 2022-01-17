//
//  TripList.h
//  TripPlanner
//
//  Created by user928728 on 7/2/21.
//

#import <Foundation/Foundation.h>
#import "Trip.h"

NS_ASSUME_NONNULL_BEGIN

@interface TripList : NSObject

- (long)size;
- (NSArray *)getAll;
- (void)addTrip: (Trip *) t;
- (Trip *)getAtIndex: (NSInteger)index;
- (void) updateTrip:(Trip *)trip atIndex:(NSInteger)index;
- (void) removeTrip:(Trip *)trip;

@end

NS_ASSUME_NONNULL_END
