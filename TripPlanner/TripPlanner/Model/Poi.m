//
//  Poi.m
//  TripPlanner
//
//  Created by user928728 on 7/14/21.
//

#import "Poi.h"

@implementation Poi

- (instancetype) initWithName:(NSString *)name{
    if(self = [super init]){
        self.name = name;
        [self setupCoordinates];
    }
    return self;
}

- (instancetype) initWithName:(NSString *)name
                     latitude:(double)latitude
                    longitude:(double)longitude{
    if(self = [super init]){
        _name = [name copy];
        _latitude = latitude;
        _longitude = longitude;
    }
    return self;
}

- (void) setupCoordinates {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:self.name completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        [placemarks enumerateObjectsUsingBlock:^(CLPlacemark * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isKindOfClass: [CLPlacemark class]]) {
                CLPlacemark *pm = (CLPlacemark*) obj;
                self.latitude = pm.location.coordinate.latitude;
                self.longitude = pm.location.coordinate.longitude;
                *stop = YES;
            }
        }];
    }];
}

@end
