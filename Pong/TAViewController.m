//
//  TAViewController.m
//  Pong
//
//  Created by Todd Austin on 1/24/14.
//  Copyright (c) 2014 Todd Austin. All rights reserved.
//

#import "TAViewController.h"

@interface TAViewController ()

@end

@implementation TAViewController

- (void)viewDidLoad
{
    
    AnimatedBackground.animationImages = [NSArray arrayWithObjects:
                                          [UIImage imageNamed:@"Menu01.png"],
                                          [UIImage imageNamed:@"Menu02.png"],
                                          [UIImage imageNamed:@"Menu03.png"],
                                          [UIImage imageNamed:@"Menu04.png"],
                                          [UIImage imageNamed:@"Menu05.png"], nil];
    
    [AnimatedBackground setAnimationRepeatCount:0];
    AnimatedBackground.animationDuration = 5;
    [AnimatedBackground startAnimating];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
