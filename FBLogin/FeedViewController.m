//
//  FeedViewController.m
//  FBLogin
//
//  Created by diannas on 6/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "FeedViewController.h"


@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *feedScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *feedView;


@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"News Feed";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.feedScrollView.contentSize = CGSizeMake(320, 1025);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
