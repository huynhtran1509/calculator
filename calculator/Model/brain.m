//
//  brain.m
//  calculator
//
//  Created by Htain Lin Shwe on 27/2/13.
//  Copyright (c) 2013 comquas. All rights reserved.
//

#import "brain.h"
@interface brain()
@property (nonatomic,strong) NSMutableArray* inputData;
-(BOOL)isOperator:(NSString*)value;
-(NSString*)calculteTheResult:(NSString*)digitAndNumber;
@end

@implementation brain

-(NSMutableArray*)inputData{
    if(_inputData==nil) _inputData = [[NSMutableArray alloc] initWithCapacity:3];
    return _inputData;
}

-(NSString*)push:(NSString*)digitAndNumber {

    if([self.inputData count] == 3 && [self isOperator:digitAndNumber])
    {
        NSString* result = [self calculteTheResult:digitAndNumber];
        return result;
    }
    else if([self.inputData count] == 1 && [self isOperator:digitAndNumber]) {
        [self.inputData addObject:digitAndNumber];
        return @"";
    }
    else if(([self.inputData count]==0 || [self.inputData count]==2) && ![self isOperator:digitAndNumber])
    {
        if([digitAndNumber isEqualToString:@"."])
        {
            NSString* result = [NSString stringWithFormat:@"0%@",digitAndNumber];
            [self.inputData addObject:result];
            return result;
        }
        if(![digitAndNumber isEqualToString:@"0"]) {
            [self.inputData addObject:digitAndNumber];
        }
        return digitAndNumber;
    }
    else if([self.inputData count]==1)
    {
        NSString* val = [self.inputData objectAtIndex:0];
        val = [val stringByAppendingString:digitAndNumber];
        [self.inputData replaceObjectAtIndex:0 withObject:val];
        return val;
    }
    else if([self.inputData count] == 3)
    {
        NSString* val = [self.inputData objectAtIndex:2];
        val = [val stringByAppendingString:digitAndNumber];
        [self.inputData replaceObjectAtIndex:2 withObject:val];
        return val;
    }
    
    return @"";
}


-(void)clear
{
    [self.inputData removeAllObjects];
}

-(BOOL)isOperator:(NSString*)value
{
    if ([value isEqualToString:@"+"] || [value isEqualToString:@"-"] || [value isEqualToString:@"x"] || [value isEqualToString:@"/"] || [value isEqualToString:@"="]) {
        return YES;
    }
    return NO;
    
}


#pragma mark - Cacluation

-(NSString*)calculteTheResult:(NSString*)digitAndNumber
{
    NSString* first = [self.inputData objectAtIndex:0];
    NSString* operator = [self.inputData objectAtIndex:1];
    NSString* second = [self.inputData objectAtIndex:2];
    float val = 0;
    if([operator isEqualToString:@"+"])
    {
        val = [first floatValue] + [second floatValue];
    }
    else if([operator isEqualToString:@"-"])
    {
        val = [first floatValue] - [second floatValue];
    }
    else if([operator isEqualToString:@"x"])
    {
        val = [first floatValue] * [second floatValue];
    }
    else if([operator isEqualToString:@"/"])
    {
        val = [first floatValue] / [second floatValue];
    }
    
    NSString* result = [NSString stringWithFormat:@"%g",val];
    
    //add data
    
    if([digitAndNumber isEqualToString:@"="])
    {
        [self.inputData removeAllObjects];
        [self.inputData addObject:result];
    }
    else {
        [self.inputData replaceObjectAtIndex:0 withObject:result];
        [self.inputData replaceObjectAtIndex:1 withObject:digitAndNumber];
        [self.inputData removeLastObject];
    }
    return result;
}
@end
