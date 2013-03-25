//http://10.0.1.15:3000/


//
//  brain.m
//  bootcampcalculator
//
//  Created by Htain Lin Shwe on 24/3/13.
//  Copyright (c) 2013 comquas. All rights reserved.
//

#import "brain.h"

@interface brain ()

//for data storage
@property(nonatomic,strong) NSMutableArray* inputData;

-(NSString*)calculateTheResult:(NSString*)digitAndOperator;

@end
@implementation brain

-(NSMutableArray*)inputData
{
    if(_inputData==nil) {
        _inputData = [[NSMutableArray alloc] initWithCapacity:3];
    }
    return _inputData;
}

-(BOOL)isOperator:(NSString*)numberAndOperator {

    if([numberAndOperator isEqualToString:@"+"] || [numberAndOperator isEqualToString:@"-"] || [numberAndOperator isEqualToString:@"x"] ||[numberAndOperator isEqualToString:@"/"] || [numberAndOperator isEqualToString:@"="])
    {
        return YES;
    }
    return NO;
}

-(void)clear {
    [self.inputData removeAllObjects];
}

#pragma mark - main brain function

-(NSString*)push:(NSString*)digitAndNumber {
    
    if(([self.inputData count]==0 || [self.inputData count]==2) && ![self isOperator:digitAndNumber])
    {
        if([digitAndNumber isEqualToString:@"."])
        {
            NSString* res = @"0.";
            [self.inputData addObject:res];
            return res;
        }
        else if(![digitAndNumber isEqualToString:@"0"])
        {
            [self.inputData addObject:digitAndNumber];
        }
        return digitAndNumber;
    }
    else if(([self.inputData count]==1 || [self.inputData count]==3) && ![self isOperator:digitAndNumber])
    {
        int room = [self.inputData count] -1;
        NSString* val = self.inputData[room];
        
        //check . already there or not
        if([digitAndNumber isEqualToString:@"."])
        {
            NSRange range = [val rangeOfString:@"."];
            if (range.location != NSNotFound)
            {
                return nil;
            }
        }
        val = [val stringByAppendingString:digitAndNumber];
        [self.inputData replaceObjectAtIndex:room withObject:val];
        return val;
    }
    else if([self.inputData count]==1 && [self isOperator:digitAndNumber])
    {
        [self.inputData addObject:digitAndNumber];
        return @"";
    }
    else if([self.inputData count]==3 && [self isOperator:digitAndNumber])
    {
        NSString* result = [self calculateTheResult:digitAndNumber];
        return result;
    }
    
    return nil;
}

-(NSString*)calculateTheResult:(NSString*)digitAndOperator {
    
    NSString* first= self.inputData[0];
    NSString* operator = self.inputData[1];
    NSString* second = self.inputData[2];
    
    float val = 0;
    
    if([operator isEqualToString:@"+"])
    {
        val = [first floatValue] + [second floatValue];
    }
    if([operator isEqualToString:@"-"])
    {
        val = [first floatValue] - [second floatValue];
    }
    if([operator isEqualToString:@"x"])
    {
        val = [first floatValue] * [second floatValue];
    }
    if([operator isEqualToString:@"/"])
    {
        val = [first floatValue] / [second floatValue];
    }
    //5.42000 , %g = 5.42
    NSString* result = [NSString stringWithFormat:@"%g",val];
    
    if([digitAndOperator isEqualToString:@"="])
    {
        [self.inputData removeAllObjects];
        [self.inputData addObject:result];
    }
    else {
        [self.inputData replaceObjectAtIndex:0 withObject:result];
        [self.inputData replaceObjectAtIndex:1 withObject:digitAndOperator];
        [self.inputData removeLastObject];
    }
    
    return result;
    
}
@end
