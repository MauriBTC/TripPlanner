//
//  AddTripViewController.h
//  TripPlanner
//
//  Created by user928728 on 7/11/21.
//

#import <UIKit/UIKit.h>
#import "TripList.h"

NS_ASSUME_NONNULL_BEGIN

// define global constants (for notifications)
extern NSNotificationName const TripListChangedNotification;

@interface AddTripViewController : UIViewController

@property(nonatomic, strong) TripList *trips;

@end

NS_ASSUME_NONNULL_END
