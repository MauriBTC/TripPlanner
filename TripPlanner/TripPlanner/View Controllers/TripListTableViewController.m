//
//  TripListTableViewController.m
//  TripPlanner
//
//  Created by user928728 on 7/2/21.
//

#import "TripListTableViewController.h"
#import "TripList.h"
#import "StageList.h"
#import "TripDetailsViewController.h"
#import "AddTripViewController.h"

@interface TripListTableViewController ()

@property (nonatomic, strong) TripList *trips;

@end

@implementation TripListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"I miei viaggi";
    
    self.trips = [[TripList alloc] init];
    
    Stage *stage1 = [[Stage alloc] initWithFrom:@"Verona" to:@"Catania Fontanarossa" date:[[NSDate alloc] initWithTimeIntervalSinceNow:0] place:@"Catania" arrival:[[NSDate alloc] initWithTimeIntervalSinceNow:300] departure:[[NSDate alloc] initWithTimeIntervalSinceNow:1500]];
    
    Stage *stage2 = [[Stage alloc] initWithFrom:@"Catania" to:@"Siracusa" date:[[NSDate alloc] initWithTimeIntervalSinceNow:1500] place:@"Siracusa" arrival:[[NSDate alloc] initWithTimeIntervalSinceNow:1500] departure:[[NSDate alloc] initWithTimeIntervalSinceNow:2500]];
    
    StageList *stages = [[StageList alloc] init];
    
    [stages addStage:stage1];
    [stages addStage:stage2];
    
    Trip *trip = [[Trip alloc] initWithTripName:@"Porto Empedocle" desc:@"visitiamo posti e facciamo giri in barca" startDate:@"2021-08-15" endDate:@"2021-08-22"];
    
    [trip addStageList:stages];
    
    [self.trips addTrip:trip];
    
    [[NSNotificationCenter defaultCenter] addObserver:self                          // this object is the observer
                                             selector:@selector(updateUI:)          // the method updateUI: will be executed
                                                 name:TripListChangedNotification    // when TripListChangedNotification is received
                                               object:nil];                // the object sending the notification (nil if any object)
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.trips.size;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TripCell" forIndexPath:indexPath];
    
    Trip *t = [self.trips getAtIndex:indexPath.row];
    // Configure the cell...
    cell.textLabel.text = t.displayName;
    return cell;
}

- (void)updateUI:(NSNotification*)notification{
    [self.tableView reloadData];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showTripDetails"]){
        if([segue.destinationViewController isKindOfClass:[TripDetailsViewController class]]){
            TripDetailsViewController *vc = (TripDetailsViewController *)segue.destinationViewController;
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            Trip *t = [self.trips getAtIndex:indexPath.row];
            vc.tripList = self.trips;
            vc.trip = t;
            vc.tripIndex = indexPath.row;
        }
    }
    
    //passaggio lista trips a AddTripTableViewController
    if([segue.identifier isEqualToString:@"AddTrip"]){
        if([segue.destinationViewController isKindOfClass:[AddTripViewController class]]){
            AddTripViewController *vc = (AddTripViewController *)segue.destinationViewController;
            vc.trips = self.trips;
        }
    }
}

- (IBAction)unwindToContainerVC:(UIStoryboardSegue *)segue {
}

@end
