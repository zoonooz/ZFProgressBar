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
    //[_progressBar setTintColor:[UIColor orangeColor]];
    [_bar2 setTintColor:[UIColor blueColor]];
    _bar2.progress = 0.6;
    [_bar3 setTintColor:[UIColor redColor]];
    _bar3.progress = 0.4;
    [_bar4 setTintColor:[UIColor greenColor]];
    _bar4.progress = 0.2;
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
