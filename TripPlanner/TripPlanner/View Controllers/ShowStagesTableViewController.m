//
//  ShowStagesTableViewController.m
//  TripPlanner
//
//  Created by user928728 on 7/13/21.
//

#import "ShowStagesTableViewController.h"
#import "Stage.h"

@interface ShowStagesTableViewController ()

@end

@implementation ShowStagesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Tappe";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stages.size;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StageCell" forIndexPath:indexPath];
    
    Stage *s = [self.stages getAtIndex:indexPath.row];
    cell.textLabel.text = s.displayName;
    return cell;
}

@end
