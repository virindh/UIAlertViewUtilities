//
//  UIAlertViewUtilities.m
//  ANYTester
//
//  Created by Virindh Borra on 11/19/13.
//  Copyright (c) 2013 Virindh Borra. All rights reserved.
//

#import "UIAlertViewUtilities.h"

@implementation UIAlertViewUtilities
//Synthesize the variables
@synthesize alertQueue;
@synthesize currentQueueValue;
@synthesize mainTimer;

-(void)addAlertToQueueWithMessage:(NSString *)message Title:(NSString *)title
{
    //Initalize alert queue if it dosent exist
    if (alertQueue == nil) {
        alertQueue = [[NSMutableArray alloc] init];
    }
    
    //Create an alert view
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];
    
    //Add alert view to the queue
    [alertQueue addObject:alertView];
    
}
-(void)displayAlertViewWithMessage:(NSString *)message Title:(NSString *)title
{
    //Create an alert for immediate display
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:Nil, nil];

    //Display the alert view
    [alertView show];
}
-(void)displayNextAlertInQueue
{
    //This method displays the next alert in the queue
    if (currentQueueValue < [alertQueue count]) {
        //Get the alert view
        [[alertQueue objectAtIndex:currentQueueValue] show];
        
        //Increase the tracker
        currentQueueValue++;
    }else
    {
        //Queue is done, cancel the timer
        [mainTimer invalidate];
        
        //Set the tracker back to zero
        currentQueueValue = 0;
    }
}
-(void)beginQueueWithInterval:(NSTimeInterval)interval
{
    //Sets the racker to zero for queue tracking
    currentQueueValue = 0;
    
    //initalize the timer with the specified interval
    mainTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(displayNextAlertInQueue) userInfo:nil repeats:YES];
    
    //Start the timer
    [mainTimer fire];
    
}
-(void)beginQueue
{
    if (alertQueue != nil) {
        
        //begins queue witht the default interval of 3.0 seconds
        [self beginQueueWithInterval:3.0];

    }
}
@end
