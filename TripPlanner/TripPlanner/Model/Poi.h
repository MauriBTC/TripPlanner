//
//  Poi.h
//  TripPlanner
//
//  Created by user928728 on 7/14/21.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLGeocoder.h>
#import <CoreLocation/CLPlacemark.h>

NS_ASSUME_NONNULL_BEGIN

@interface Poi : NSObject

@property (nonatomic, strong) CLGeocoder *geocoder;

- (instancetype) initWithName:(NSString *)name;

//name è il place
- (instancetype) initWithName:(NSString *)name
                     latitude:(double)latitude
                    longitude:(double)longitude;

@property (nonatomic, strong) NSString *name;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) NSNumber *sequenceValue;

- (void) setupCoordinates;

@end

NS_ASSUME_NONNULL_END
