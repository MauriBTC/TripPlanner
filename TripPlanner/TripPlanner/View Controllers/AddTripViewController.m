//
//  AddTripViewController.m
//  TripPlanner
//
//  Created by user928728 on 7/11/21.
//

#import "Trip.h"
#import "AddTripViewController.h"
#import "ShowStagesTableViewController.h"
#import "AddStageViewController.h"

NSString *const TripListChangedNotification = @"TripListChangedNotification";

@interface AddTripViewController ()

@property(strong, nonatomic) Trip *trip;

@property (weak, nonatomic) IBOutlet UITextField *tripNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *descTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *startDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *endDate;

@end

@implementation AddTripViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)dismissKeyboard:(UIControl *)sender {
    [self.tripNameTextField resignFirstResponder];
    [self.descTextField resignFirstResponder];
    [self.startDate resignFirstResponder];
    [self.endDate resignFirstResponder];
}

//per nascondere la tastiera anche quando l'utente tocca sul DatePicker *NON FUNZIONA*
- (IBAction)dismissKeyboardWithDate:(UIDatePicker *)sender {
    [self.tripNameTextField resignFirstResponder];
    [self.descTextField resignFirstResponder];
}

- (IBAction)confirm:(UIButton *)sender {
    //se l'utente preme conferma con i textField vuoti viene mostato l'avviso di riempirli, altrimenti aggiunge il trip alla lista, chiude la view e torna a tripList
    if([self.tripNameTextField.text isEqual:@""] ||  [self.descTextField.text isEqual:@""] ||  [self.startDate isEqual:nil] || [self.endDate isEqual:nil]){
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Attenzione"
                                       message:@"Compila tutti i campi"
                                       preferredStyle:UIAlertControllerStyleAlert];
         
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
           handler:^(UIAlertAction * action) {}];
         
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        if(self.trip == nil){
            NSLog(@"hai fatto conferma e ricreo il viaggio");
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyy-MM-dd"];
            NSDate *start = [[NSDate alloc] init];
            start = self.startDate.date;
            NSDate *end = [[NSDate alloc] init];
            end = self.endDate.date;
            NSString *startDate = [dateFormat stringFromDate:start];
            NSString *endDate = [dateFormat stringFromDate:end];
            
            self.trip = [[Trip alloc] initWithTripName:self.tripNameTextField.text desc:self.descTextField.text startDate:startDate endDate:endDate];
        }
        
        [self.trips addTrip:self.trip];
        
        NSArray *completeList = self.trips.getAll;
        
        for (Trip *trip in completeList) {
            NSLog(@"%@", trip.displayName);
        }
        
        //invio notifica per aggiornare i dati in TripList
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TripListChangedNotification"
                                                            object:self
                                                          userInfo:nil];
        
        //uscita dalla view dopo la conferma
        [self performSegueWithIdentifier:@"unwindToTripList" sender:self];
    }
}

- (IBAction)addStage:(UIButton *)sender {
    NSLog(@"AddTripViewController.addStage eseguito");
    
    if([self.tripNameTextField.text isEqual:@""] ||  [self.descTextField.text isEqual:@""] ||  [self.startDate isEqual:nil] || [self.endDate isEqual:nil]){
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Attenzione"
                                       message:@"Compila prima i campi relativi al viaggio"
                                       preferredStyle:UIAlertControllerStyleAlert];
         
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
           handler:^(UIAlertAction * action) {}];
         
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else{
        if(self.trip == nil){
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyy-MM-dd"];
            NSDate *start = [[NSDate alloc] init];
            start = self.startDate.date;
            NSDate *end = [[NSDate alloc] init];
            end = self.endDate.date;
            NSString *startDate = [dateFormat stringFromDate:start];
            NSString *endDate = [dateFormat stringFromDate:end];
        
            self.trip = [[Trip alloc] initWithTripName:self.tripNameTextField.text desc:self.descTextField.text startDate:startDate endDate:endDate];
        
            StageList *stageList = [[StageList alloc] init];
        
            [self.trip addStageList:stageList];
        }
        //creo il viaggio ma lo aggiungo alla lista soltanto quando viene premuto "conferma"
        //uscita dalla view dopo la conferma
    }
}


- (IBAction)cancel:(UIButton *)sender {
    
    //se viene fatto cancel dopo aver cliccato "aggiungi tappa intermedia" il viaggio è già stato creato, ma non essendo stato aggiunto alla lista, viene deallocato assieme al suo record di attivazione dallo stack
    [self performSegueWithIdentifier:@"unwindToTripList" sender:self];
}

- (IBAction)unwindToContainerVC:(UIStoryboardSegue *)segue {

}

#pragma mark - Navigation
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     //passaggio lista trips a AddTripTableViewController
     if([segue.identifier isEqualToString:@"ShowStages"]){
         if([segue.destinationViewController isKindOfClass:[ShowStagesTableViewController class]]){
             ShowStagesTableViewController *vc = (ShowStagesTableViewController *)segue.destinationViewController;
             vc.stages = self.trip.stageList;
         }
     }
     
     if([segue.identifier isEqualToString:@"AddStage"]){
         if([segue.destinationViewController isKindOfClass:[AddStageViewController class]]){
             AddStageViewController *vc = (AddStageViewController *)segue.destinationViewController;
             
             NSLog(@"AddTripViewController segue eseguita");
             vc.trip = self.trip;
         }
     }
 }

@end
