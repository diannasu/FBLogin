//
//  RequestViewController.m
//  FBLogin
//
//  Created by diannas on 6/27/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "RequestViewController.h"

@interface RequestViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *requestScrollView;

@end

@implementation RequestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"Requests";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.requestScrollView.contentSize = CGSizeMake(320, 1025);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
