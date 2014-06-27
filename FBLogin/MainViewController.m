//
//  MainViewController.m
//  FBLogin
//
//  Created by diannas on 6/22/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "MainViewController.h"
#import "FeedViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *signUpLabel;

//Login button
- (IBAction)onTouchUp:(id)sender;
- (IBAction)onTap:(id)sender;

//Text fields
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


//Text fields actions
- (IBAction)emailEditingEnd:(id)sender;
- (IBAction)passwordEditingEnd:(id)sender;

// Declare some methods that will be called when the keyboard is about to be shown or hidden
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // Register the methods for the keyboard hide/show events
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         //self.containerView.frame = CGRectMake(0, 550 - kbSize.height - self.containerView.frame.size.height, self.containerView.frame.size.width, self.containerView.frame.size.height);
                         self.containerView.center = CGPointMake(self.containerView.center.x, self.containerView.center.y -60);
                         self.signUpLabel.center = CGPointMake(self.signUpLabel.center.x, self.signUpLabel.center.y -150);
                     }
                     completion:nil];
    
    
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.containerView.center = CGPointMake(self.containerView.center.x, self.containerView.center.y +60);
                         self.signUpLabel.center = CGPointMake(self.signUpLabel.center.x, self.signUpLabel.center.y +150);
                     }
                     completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTouchUp:(id)sender {
    
    //Alert
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"No Password" message:@"You did not enter your password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertView show];

    
    //Transition for Feed Screen
    NSLog(@"On touch up inside");
    
    UIViewController *vc = [[FeedViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}



- (IBAction)emailEditingEnd:(id)sender {
}

- (IBAction)passwordEditingEnd:(id)sender {
}
@end
