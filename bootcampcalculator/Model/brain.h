//
//  brain.h
//  bootcampcalculator
//
//  Created by Htain Lin Shwe on 24/3/13.
//  Copyright (c) 2013 comquas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface brain : NSObject

-(NSString*)push:(NSString*)digitAndNumber;

//checking opeator or not
-(BOOL)isOperator:(NSString*)numberAndOperator;
-(void)clear;
@end
