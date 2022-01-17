//
//  Trip.h
//  TripPlanner
//
//  Created by user928728 on 7/2/21.
//

#import <Foundation/Foundation.h>
#import "Stage.h"
#import "StageList.h"

NS_ASSUME_NONNULL_BEGIN

@interface Trip : NSObject

//inizializzatori
- (instancetype) initWithTripName: (NSString *) tripName
                             desc: (NSString *) desc
                        startDate: (NSString *) startDate
                          endDate: (NSString *) endDate
                        stageList: (StageList *) stageList;

//potrebbero non esserci tappe intermedie
- (instancetype) initWithTripName: (NSString *) tripName
                             desc: (NSString *) desc
                        startDate: (NSString *) startDate
                          endDate: (NSString *) endDate;

@property (nonatomic, strong) NSString *tripName;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, strong) NSString *endDate;
@property (nonatomic, strong) StageList *stageList;

@property (nonatomic, readonly) NSString *displayName;

- (void)addStageList:(StageList *)stageList;

@end

NS_ASSUME_NONNULL_END
