//
//  TripDetailsViewController.h
//  TripPlanner
//
//  Created by user928728 on 7/14/21.
//

#import <UIKit/UIKit.h>
#import "Trip.h"
#import "TripList.h"

NS_ASSUME_NONNULL_BEGIN

@interface TripDetailsViewController : UIViewController

@property (strong, nonatomic) TripList *tripList;
@property (strong, nonatomic) Trip *trip;
@property (nonatomic) NSInteger tripIndex;

@end

NS_ASSUME_NONNULL_END
