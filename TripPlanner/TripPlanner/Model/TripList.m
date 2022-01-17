//
//  TripList.m
//  TripPlanner
//
//  Created by user928728 on 7/2/21.
//

#import "TripList.h"

@interface TripList ()

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation TripList

- (instancetype)init{
    if(self = [super init]){
        _list = [[NSMutableArray alloc] init];
    }
    return self;
    
}

- (long)size{
    return self.list.count;
}

- (NSArray *) getAll{
    return self.list;
}

- (void) addTrip:(Trip *)t{
    [self.list addObject:t];
}

- (Trip *) getAtIndex:(NSInteger)index{
    return [self.list objectAtIndex:index];
}

- (void) updateTrip:(Trip *)trip
            atIndex:(NSInteger)index{
    [self.list insertObject:trip atIndex:index];
}

- (void) removeTrip:(Trip *)trip{
    [self.list removeObject:trip];
}

@end
