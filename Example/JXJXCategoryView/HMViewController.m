//
//  HMViewController.m
//  JXJXCategoryView
//
//  Created by zhmios on 12/28/2018.
//  Copyright (c) 2018 zhmios. All rights reserved.
//

#import "HMViewController.h"
#import "UBOneLessonListViewController.h"

@interface HMViewController ()

@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnPress:(id)sender {
    
    UBOneLessonListViewController *controller = [[UBOneLessonListViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
