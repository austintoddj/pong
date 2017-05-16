//
//  Game.m
//  Pong
//
//  Created by Todd Austin on 1/24/14.
//  Copyright (c) 2014 Todd Austin. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)Collision{
    if (CGRectIntersectsRect(Ball.frame, Player.frame)){
        
        Y = arc4random() %5;
        Y= 0-Y;
        
    }
    
    if (CGRectIntersectsRect(Ball.frame, Computer.frame)){
        
        Y = arc4random() %5;
    }
    
}



-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *Drag = [[event allTouches] anyObject];
    Player.center = [Drag locationInView:self.view];
    
    if (Player.center.y > 536) {
        Player.center = CGPointMake(Player.center.x, 536);
    }
    
    if (Player.center.y < 536) {
        Player.center = CGPointMake(Player.center.x, 536);
    }
    
    if (Player.center.x < 37) {
        Player.center = CGPointMake(37, Player.center.y);
    }
    
    if (Player.center.x > 283) {
        Player.center = CGPointMake(283, Player.center.y);
    }
    
}



-(void)ComputerMovement{
    
    if (Computer.center.x > Ball.center.x) {
        Computer.center = CGPointMake(Computer.center.x - 2, Computer.center.y);
    }
    
    if (Computer.center.x < Ball.center.x) {
        Computer.center = CGPointMake(Computer.center.x + 2, Computer.center.y);
    }
    
    if (Computer.center.x < 37) {
        Computer.center = CGPointMake(37, Computer.center.y);
    }
    
    if (Computer.center.x > 283) {
        Computer.center = CGPointMake(283, Computer.center.y);
    }
    
    
}

-(IBAction)StartButton:(id)sender{

    StartButton.hidden = YES;
    Exit.hidden = YES;
    
    Y = arc4random() %11;
    Y = Y - 5;
    
    X = arc4random() %11;
    X = X - 5;
    
    if (Y == 0) {
        Y = 1;
    }
    
    if (X == 0) {
        X = 1;
    }
    
    timer =[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BallMovement) userInfo:nil repeats:YES];
    
}

-(void)BallMovement{
    
    [self ComputerMovement];
    [self Collision];
    
    Ball.center = CGPointMake(Ball.center.x + X, Ball.center.y + Y);
    
    if (Ball.center.x < 15) {
        X = 0 - X;
    }
    
    if (Ball.center.x > 305) {
        X = 0 - X;
    }
    
    if (Ball.center.y < 0) {
        PlayerScoreNumber = PlayerScoreNumber + 1;
        PlayerScore.text = [NSString stringWithFormat:@"%i", PlayerScoreNumber];
        
        [timer invalidate];
        StartButton.hidden = NO;
        
        Ball.center = CGPointMake(160, 285);
        Computer.center = CGPointMake(160, 32);
        
        if (PlayerScoreNumber == 10) {
            StartButton.hidden = YES;
            Exit.hidden = NO;
            WinOrLose.hidden = NO;
            WinOrLose.text = [NSString stringWithFormat:@"You Win!"];
        }
    }
    
    if (Ball.center.y > 580) {
        ComputerScoreNumber = ComputerScoreNumber + 1;
        ComputerScore.text = [NSString stringWithFormat:@"%i", ComputerScoreNumber];
        [timer invalidate];
        StartButton.hidden = NO;
        Ball.center = CGPointMake(160, 285);
        Computer.center = CGPointMake(160, 32);
    
        if (ComputerScoreNumber == 10) {
            StartButton.hidden = YES;
            Exit.hidden = NO;
            WinOrLose.hidden = NO;
            WinOrLose.text = [NSString stringWithFormat:@"You Lose!"];
            
        }
        
    }
    
    
            
        }


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    PlayerScoreNumber = 0;
    ComputerScoreNumber = 0;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
