//
//  ZFViewController.m
//  ZFProgressBar
//
//  Created by Amornchai Kanokpullawad on 8/27/13.
//  Copyright (c) 2013 zoonref. All rights reserved.
//

#import "ZFViewController.h"

@interface ZFViewController ()

@end

@implementation ZFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)valueChanged:(UISlider *)sender {
    self.progressBar.progress = sender.value;
}

@end
