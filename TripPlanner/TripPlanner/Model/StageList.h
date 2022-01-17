//
//  StageList.h
//  TripPlanner
//
//  Created by user928728 on 7/8/21.
//

#import <Foundation/Foundation.h>
#import "Stage.h"

NS_ASSUME_NONNULL_BEGIN

@interface StageList : NSObject

- (long)size;
- (NSArray *)getAll;
- (void)addStage: (Stage *) s;
- (Stage *)getAtIndex: (NSInteger)index;

@end

NS_ASSUME_NONNULL_END
