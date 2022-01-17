//
//  TripDetailsViewController.m
//  TripPlanner
//
//  Created by user928728 on 7/14/21.
//

#import "TripDetailsViewController.h"
#import "StageDetailsTableViewController.h"
#import "MapViewController.h"
#import "Stage.h"

@interface TripDetailsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *descTextField;
@property (weak, nonatomic) IBOutlet UITextField *startDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *endDateTextField;

@end

@implementation TripDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.trip.displayName;
    self.descTextField.text = self.trip.desc;
    self.startDateTextField.text = self.trip.startDate.description;
    self.endDateTextField.text = self.trip.endDate.description;
}

- (IBAction)dismissKeyboard:(UIControl *)sender {
    [self.descTextField resignFirstResponder];
    [self.startDateTextField resignFirstResponder];
    [self.endDateTextField resignFirstResponder];
}

- (IBAction)confirmChanges:(UIButton *)sender {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
    self.trip.desc = self.descTextField.text;
    self.trip.startDate = self.startDateTextField.text;
    self.trip.endDate = self.endDateTextField.text;
    
    [self.tripList updateTrip:self.trip atIndex:self.tripIndex];
    
    [self performSegueWithIdentifier:@"unwindToTripList" sender:self];
}

- (IBAction)delete:(UIButton *)sender {
    [self.tripList removeTrip:self.trip];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TripListChangedNotification"
                                                        object:self
                                                      userInfo:nil];
    
    [self performSegueWithIdentifier:@"unwindToTripList" sender:self];
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showStageDetails"]){
        if([segue.destinationViewController isKindOfClass:[StageDetailsTableViewController class]]){
            StageDetailsTableViewController *vc = (StageDetailsTableViewController *)segue.destinationViewController;
            vc.stageList = self.trip.stageList;
        }
    }
    
    if([segue.identifier isEqualToString:@"ShowMap"]){
        if([segue.destinationViewController isKindOfClass:[MapViewController class]]){
            MapViewController *vc = (MapViewController *)segue.destinationViewController;
            
            NSMutableArray *mArray = [[NSMutableArray alloc] init];
            [[self.trip.stageList getAll] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if([obj isKindOfClass:[Stage class]]){
                    Stage *stage = (Stage*)obj;
                    Poi *poi = stage.location;
                    [mArray addObject:poi];
                }
            }];
            vc.pois = mArray;
        }
    }
}


@end
