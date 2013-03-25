//
//  ViewController.m
//  bootcampcalculator
//
//  Created by Htain Lin Shwe on 24/3/13.
//  Copyright (c) 2013 comquas. All rights reserved.
//

#import "ViewController.h"
#import "brain.h"

@interface ViewController ()
@property (nonatomic,strong) brain* calBrain;
@end

@implementation ViewController

-(brain*)calBrain
{
    if (_calBrain==nil) {
        _calBrain = [[brain alloc] init];
    }
    
    return _calBrain;
}

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


-(IBAction)showOnScreen:(UIButton*)sender {
    
    NSString* res= [self.calBrain push:sender.titleLabel.text];
    
    if(res!=nil && ![res isEqualToString:@""])
    {
        self.txtScreen.text = res;
    }
    if([self.calBrain isOperator:sender.titleLabel.text])
    {
        self.lblOperator.text = sender.titleLabel.text;
    }

}

-(IBAction)clear {
    
    self.txtScreen.text = @"0";
    self.lblOperator.text = @"=";
    [self.calBrain clear];
}

@end
