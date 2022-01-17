//
//  GeoStage+MapAnnotation.m
//  TripPlanner
//
//  Created by user928728 on 7/14/21.
//

#import "Poi+MapAnnotation.h"

@implementation Poi (MapAnnotation)

- (CLLocationCoordinate2D)coordinate{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = self.latitude;
    coordinate.longitude = self.longitude;
    return coordinate;
}

- (NSString *)title{
    return self.name;
}

- (NSString *)description {
    return [self.sequenceValue stringValue];
}

@end
