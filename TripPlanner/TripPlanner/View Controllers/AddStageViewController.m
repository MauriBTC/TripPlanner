//
//  AddStageViewController.m
//  TripPlanner
//
//  Created by user928728 on 7/13/21.
//

#import "AddStageViewController.h"
#import "Stage.h"

@interface AddStageViewController ()

@property (weak, nonatomic) IBOutlet UITextField *fromTextField;
@property (weak, nonatomic) IBOutlet UITextField *toTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *shiftDate;
@property (weak, nonatomic) IBOutlet UITextField *placeTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *arrivalDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *departureDate;
@property (weak, nonatomic) IBOutlet UITextField *meanTextField;
@property (weak, nonatomic) IBOutlet UITextField *hotelTextField;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) UITextField *activeField;

@end

@implementation AddStageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)confirm:(UIButton *)sender {
    if([self.fromTextField.text isEqual:@""] ||  [self.toTextField.text isEqual:@""] ||  [self.placeTextField.text isEqual:@""] || [self.arrivalDate isEqual:nil] || [self.departureDate isEqual:nil]){
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Attenzione"
                                       message:@"Compila tutti i campi obbligatori"
                                       preferredStyle:UIAlertControllerStyleAlert];
         
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
           handler:^(UIAlertAction * action) {}];
         
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else{
        Stage *stage = [[Stage alloc] initWithFrom:self.fromTextField.text to:self.toTextField.text date:self.shiftDate.date place:self.placeTextField.text arrival:self.arrivalDate.date departure:self.departureDate.date];
         
        [self.trip.stageList addStage:stage];
        
        NSArray *completeList = self.trip.stageList.getAll;
    
        for (Stage *s in completeList) {
            NSLog(@"%@", s.displayName);
        }
        
        //uscita dalla view dopo la conferma
        [self performSegueWithIdentifier:@"unwindToAddTrip" sender:self];
    }
}

- (IBAction)cancel:(UIButton *)sender {
    [self performSegueWithIdentifier:@"unwindToAddTrip" sender:self];
}

- (IBAction)dismissKeyboard:(UIControl *)sender {
    //vedi se mettere anche la resign per le date
    [self.fromTextField resignFirstResponder];
    [self.toTextField resignFirstResponder];
    [self.placeTextField resignFirstResponder];
    [self.meanTextField resignFirstResponder];
    [self.hotelTextField resignFirstResponder];
}


//*** scroll della view quando esce la tastiera ***//

- (void)registerForKeyboardNotifications{
    [[NSNotificationCenter defaultCenter] addObserver:self
            selector:@selector(keyboardWasShown:)
            name:UIKeyboardDidShowNotification object:nil];

   [[NSNotificationCenter defaultCenter] addObserver:self
             selector:@selector(keyboardWillBeHidden:)
             name:UIKeyboardWillHideNotification object:nil];
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;

    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;

    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {

        [self.scrollView scrollRectToVisible:self.activeField.frame animated:YES];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.activeField = nil;
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

@end
