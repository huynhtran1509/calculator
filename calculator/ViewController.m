//
//  ViewController.m
//  calculator
//
//  Created by Htain Lin Shwe on 27/2/13.
//  Copyright (c) 2013 comquas. All rights reserved.
//

#import "ViewController.h"
#import "brain.h"

@interface ViewController ()
@property(nonatomic,strong) brain* brain;
@end

@implementation ViewController
@synthesize txtScreen = _txtScreen;

-(brain*)brain
{
    if(_brain==nil) _brain = [[brain alloc] init];
    return _brain;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showOnScreen:(UIButton*)sender {
    NSString* screen = [self.brain push:sender.titleLabel.text];
    if(![screen isEqualToString:@""])
    {
        self.txtScreen.text = screen;
    }
    if([sender.titleLabel.text isEqualToString:@"+"] || [sender.titleLabel.text isEqualToString:@"-"] || [sender.titleLabel.text isEqualToString:@"x"] || [sender.titleLabel.text isEqualToString:@"/"] || [sender.titleLabel.text isEqualToString:@"="])
    {
        self.lblOperator.text = sender.titleLabel.text;
    }
    
}

-(IBAction)clear {
    [self.brain clear];
    self.txtScreen.text = @"0";
    self.lblOperator.text = @"=";
}
@end
