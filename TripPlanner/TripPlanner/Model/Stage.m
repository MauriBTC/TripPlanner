//
//  Stage.m
//  TripPlanner
//
//  Created by user928728 on 7/2/21.
//

#import "Stage.h"

@implementation Stage

//inizializzatori
- (instancetype) initWithFrom: (NSString *) from
                           to: (NSString *) to
                         date: (NSDate *) date
                        place: (NSString *) place
                      arrival: (NSDate *) arrival
                    departure: (NSDate *) departure{
    if(self = [super init]){
        _from = [from copy];
        _to = [to copy];
        _date = [date copy];
        _place = [place copy];
        _arrival = [arrival copy];
        _departure = [departure copy];
        _location = [[Poi alloc] initWithName:place];
    }
    return self;
}

- (instancetype) initWithFrom: (NSString *) from
                           to: (NSString *) to
                         date: (NSDate *) date
                        means: (NSString *) means
                        place: (NSString *) place
                      arrival: (NSDate *) arrival
                    departure: (NSDate *) departure{
    if(self = [super init]){
        _from = [from copy];
        _to = [to copy];
        _date = [date copy];
        _means = [means copy];
        _place = [place copy];
        _arrival = [arrival copy];
        _departure = [departure copy];
        _location = [[Poi alloc] initWithName:place];
    }
    return self;
}

- (instancetype) initWithFrom: (NSString *) from
                           to: (NSString *) to
                         date: (NSDate *) date
                        place: (NSString *) place
                      arrival: (NSDate *) arrival
                    departure: (NSDate *) departure
                        hotel: (NSString *) hotel{
    if(self = [super init]){
        _from = [from copy];
        _to = [to copy];
        _date = [date copy];
        _place = [place copy];
        _arrival = [arrival copy];
        _departure = [departure copy];
        _hotel = [hotel copy];
        _location = [[Poi alloc] initWithName:place];
    }
    return self;
}

- (instancetype) initWithFrom: (NSString *) from
                           to: (NSString *) to
                         date: (NSDate *) date
                        means: (NSString *) means
                        place: (NSString *) place
                      arrival: (NSDate *) arrival
                    departure: (NSDate *) departure
                        hotel: (NSString *) hotel{
    if(self = [super init]){
        _from = [from copy];
        _to = [to copy];
        _date = [date copy];
        _means = [means copy];
        _place = [place copy];
        _arrival = [arrival copy];
        _departure = [departure copy];
        _hotel = [hotel copy];
        _location = [[Poi alloc] initWithName:place];
    }
    return self;
}

- (NSString *)displayName{
    return self.place;
}

@end
