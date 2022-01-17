//
//  StageList.m
//  TripPlanner
//
//  Created by user928728 on 7/8/21.
//

#import "StageList.h"

@interface StageList()

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation StageList

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

- (void) addStage:(Stage *)s{
    if(s == nil){
        [NSException raise:@"invalid argument" format:@"%@ is invalid", s];
    }
    [self.list addObject:s];
    NSLog(@"StageList.addStage: ho aggiunto alla lista lo stage: %@", self.list.lastObject);
}

- (Stage *) getAtIndex:(NSInteger)index{
    return [self.list objectAtIndex:index];
}

@end
