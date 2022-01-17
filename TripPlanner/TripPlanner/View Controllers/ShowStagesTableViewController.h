//
//  ShowStagesTableViewController.h
//  TripPlanner
//
//  Created by user928728 on 7/13/21.
//

#import <UIKit/UIKit.h>
#import "StageList.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShowStagesTableViewController : UITableViewController

@property(nonatomic, weak) StageList *stages;

@end

NS_ASSUME_NONNULL_END
