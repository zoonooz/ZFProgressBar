//
//  ZFViewController.h
//  ZFProgressBar
//
//  Created by Amornchai Kanokpullawad on 8/27/13.
//  Copyright (c) 2013 zoonref. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFProgressBar.h"

@interface ZFViewController : UIViewController
@property (weak, nonatomic) IBOutlet ZFProgressBar *progressBar;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end
