//
//  StageDetailsTableViewController.m
//  TripPlanner
//
//  Created by user928728 on 7/14/21.
//

#import "StageDetailsTableViewController.h"
#import "StageChangeViewController.h"

@interface StageDetailsTableViewController ()

@end

@implementation StageDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stageList.size;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StageCell" forIndexPath:indexPath];
    Stage *s = [self.stageList getAtIndex:indexPath.row];
    cell.textLabel.text = s.displayName;
    return cell;
}

/*
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showStageChange"]){
        if([segue.destinationViewController isKindOfClass:[StageChangeViewController class]]){
            StageChangeViewController *vc = (StageChangeViewController *)segue.destinationViewController;
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            Stage *s = [self.stageList getAtIndex:indexPath.row];
            vc.stage = s;
        }
    }
}
*/

@end
