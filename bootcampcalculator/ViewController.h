//
//  ViewController.h
//  bootcampcalculator
//
//  Created by Htain Lin Shwe on 24/3/13.
//  Copyright (c) 2013 comquas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic,weak) IBOutlet UILabel* lblOperator;
@property(nonatomic,weak) IBOutlet UITextField* txtScreen;


-(IBAction)showOnScreen:(id)sender;
-(IBAction)clear;

@end
