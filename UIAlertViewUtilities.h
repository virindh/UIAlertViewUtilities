//
//  UIAlertViewUtilities.h
//
//  Created by Virindh Borra on 11/19/13.
//  Copyright (c) 2013 Virindh Borra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIAlertViewUtilities : NSString

//Adds an alert to the queue
-(void)addAlertToQueueWithMessage:(NSString *)message Title:(NSString *)title;

//Displays an alert immediately
-(void)displayAlertViewWithMessage:(NSString *)message Title:(NSString *)title;

//Starts the queue with each alert occuring at the specified interval
-(void)beginQueueWithInterval:(NSTimeInterval)interval;

//Begins queue with the default interval
-(void)beginQueue;

//Private variables - MODIFY ONLY IF YOU KNOW WHAT YOU ARE DOING :)

//Array that stores alerts
@property (strong, nonatomic) NSMutableArray *alertQueue;

//Keeps track of the queue
@property (nonatomic) int currentQueueValue;

//Timer for intervals
@property (strong, nonatomic) NSTimer *mainTimer;

@end
