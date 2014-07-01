//
//  MainViewController.m
//  FBLogin
//
//  Created by diannas on 6/22/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "MainViewController.h"
#import "FeedViewController.h"
#import "RequestViewController.h"
#import "MessageViewController.h"
#import "NotificationViewController.h"
#import "MoreViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *signUpLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

//Login button
- (IBAction)onTouchUp:(id)sender;
- (IBAction)onTap:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loginActivityIndicator;

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
    //Transition for Feed Screen
    NSLog(@"On touch up inside");
    
    
    // Responde to label text
    [self.view endEditing:YES];
    //[self.loginActivityIndicator startAnimating];
    self.loginButton.enabled = NO;
    self.emailTextField.enabled = NO;
    self.passwordTextField.enabled = NO;
    self.loginButton.alpha=.75;
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"logging_in_button"] forState:UIControlStateDisabled];
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"logging_in_button"] forState:UIControlStateNormal];

    
    [UIView
     animateWithDuration:8
     delay:5
     options:UIViewAnimationOptionCurveLinear
     animations:^{
     }
     completion:^(BOOL finished) {       
         if ([self.passwordTextField.text isEqualToString:@"password"] && [self.emailTextField.text isEqualToString:@"username"])
             [self loginSucess];
      else
             [self loginFail];
     }];

    
    
}
     
     - (void)loginSucess {
         
         [self.loginActivityIndicator startAnimating];
         
         // View Controllers
         FeedViewController *feedVC = [[FeedViewController alloc] init];
         UINavigationController *feedNC = [[UINavigationController alloc] initWithRootViewController:feedVC];
         feedNC.tabBarItem.title = @"News Feed";
         //firstNavigationController.tabBarItem.image = [UIImage imageNamed:@"House"];
         
         RequestViewController *requestVC = [[RequestViewController alloc] init];
         UINavigationController *requestNC = [[UINavigationController alloc] initWithRootViewController:requestVC];
         requestNC.tabBarItem.title = @"Requests";
         
         MessageViewController *messageVC = [[MessageViewController alloc] init];
         UINavigationController *messageNC = [[UINavigationController alloc] initWithRootViewController:messageVC];
         messageNC.tabBarItem.title = @"Messages";
         
         NotificationViewController *notificationVC = [[NotificationViewController alloc] init];
         UINavigationController *notificationNC = [[UINavigationController alloc] initWithRootViewController:notificationVC];
         notificationNC.tabBarItem.title = @"Notifications";
         
         MoreViewController *moreVC = [[MoreViewController alloc] init];
         UINavigationController *moreNC = [[UINavigationController alloc] initWithRootViewController:moreVC];
         moreNC.tabBarItem.title = @"More";
         
         // Configure the tab bar controller as a modal
         UITabBarController *tabBarController = [[UITabBarController alloc] init];
         tabBarController.viewControllers = @[feedNC, requestNC, messageNC, notificationNC, moreNC];
         tabBarController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
         
         [self presentViewController:tabBarController animated:YES completion:nil];
         //[self performSelector:@selector(loading) withObject:nil afterDelay:1];
         
         
         //Navigation Bar
         //feedNC.tabBarItem.title = @"News Feed";
         //feedNC.tabBarItem.image = [UIImage imageNamed:@"tab_main"];
         feedNC.navigationBar.barTintColor = [UIColor colorWithRed:(73/255.0) green:(100/255.0) blue:(159/255.0) alpha:1];
         feedNC.navigationBar.translucent = NO;
         feedNC.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
         
         requestNC.navigationBar.barTintColor = [UIColor colorWithRed:(73/255.0) green:(100/255.0) blue:(159/255.0) alpha:1];
         requestNC.navigationBar.translucent = NO;
         requestNC.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
         
         messageNC.navigationBar.barTintColor = [UIColor colorWithRed:(73/255.0) green:(100/255.0) blue:(159/255.0) alpha:1];
         messageNC.navigationBar.translucent = NO;
         messageNC.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
         
         notificationNC.navigationBar.barTintColor = [UIColor colorWithRed:(73/255.0) green:(100/255.0) blue:(159/255.0) alpha:1];
         notificationNC.navigationBar.translucent = NO;
         notificationNC.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
         
         moreNC.navigationBar.barTintColor = [UIColor colorWithRed:(73/255.0) green:(100/255.0) blue:(159/255.0) alpha:1];
         moreNC.navigationBar.translucent = NO;
         moreNC.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
         
         [self.navigationController pushViewController:feedNC animated:YES];
         
        
         
         
        
     }


- (void)loginFail {
    
    [self.loginActivityIndicator stopAnimating];
    self.loginButton.enabled = YES;
    self.emailTextField.enabled = YES;
    self.passwordTextField.enabled = YES;


    //Alert
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"Re-enter the correct password." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertView show];
    
}



- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}



- (IBAction)emailEditingEnd:(id)sender {

    
}

- (IBAction)passwordEditingEnd:(id)sender {
}
@end
