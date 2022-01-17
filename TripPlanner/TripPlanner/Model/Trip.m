//
//  Trip.m
//  TripPlanner
//
//  Created by user928728 on 7/2/21.
//

#import "Trip.h"

@implementation Trip

//inizializzatori
- (instancetype) initWithTripName: (NSString *) tripName
                             desc: (NSString *) desc
                        startDate: (NSString *) startDate
                          endDate: (NSString *) endDate
                        stageList: (StageList *) stageList{
    if(self = [super init]){
        _tripName = [tripName copy];
        _desc = [desc copy];
        _startDate = [startDate copy];
        _endDate = [endDate copy];
        _stageList = [stageList copy];
    }
    return self;
}

//potrebbero non esserci tappe intermedie
- (instancetype) initWithTripName: (NSString *) tripName
                             desc: (NSString *) desc
                        startDate: (NSString *) startDate
                          endDate: (NSString *) endDate{
    if(self = [super init]){
        _tripName = [tripName copy];
        _desc = [desc copy];
        _startDate = [startDate copy];
        _endDate = [endDate copy];
    }
    return self;
}

- (NSString *)displayName{
    return self.tripName;
}

- (void)addStageList:(StageList *)stageList{
    self.stageList = stageList;
}

@end
