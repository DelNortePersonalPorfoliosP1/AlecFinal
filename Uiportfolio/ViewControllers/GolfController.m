//
//  Golf.m
//  Uiportfolio
//
//  Created by Alec Linyard on 1/15/20.
//  Copyright © 2020 JM. All rights reserved.
//

#include "control.h"
#import "GolfController.h"

@implementation GolfController
@synthesize Ball, Hole, firstPoint, lastPoint, resetButton, ballInBunker, initialBallPosition;

- (void)viewDidLoad {
  [super viewDidLoad];
  // changes hole image to be circular
  self.Hole.layer.cornerRadius = .5*self.Hole.layer.frame.size.height;
  self.Hole.layer.masksToBounds = YES;
    self.ballInBunker = false;
    self.ballInHole = false;
    self.initialBallPosition = self.Ball.frame;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.ballInHole) {
        return;
    }
    NSLog(@"touches Began");
  UITouch *touch = [touches anyObject];
    
  // turn user interaction off as swipe begins
  [self.view setUserInteractionEnabled:NO];
   
  // store point a touch began
  self.firstPoint = [touch locationInView:self.view];
   
}
/**
* Automatic action that occus when user releases at end of swipe
*/
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  NSLog(@"touches Ended");
   
  UITouch *touch = [touches anyObject];
   
  // store point a touch end
  self.lastPoint = [touch locationInView:self.view];
   
  // logic to calculate swipevector as distance between touch began and touch end
  CGPoint swipeVector = CGPointMake(self.lastPoint.x - self.firstPoint.x, self.lastPoint.y - self.firstPoint.y);
   
  // velocity of ball based off of swipe
  self.ballVelocityX = speedScale * swipeVector.x;
  self.ballVelocityY = speedScale * swipeVector.y;
   
  // move ball occurs multiple times at this sampling rate, until friction causes ball to stop
  self.gameTimer = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
}

/**
* Changes center of ball, which is connected to outlet, this is called recursively by timer
*/
-(void)moveBall {
  // simulates friction by reducing velocity
  self.ballVelocityX = speedDamping * self.ballVelocityX;
  self.ballVelocityY = speedDamping * self.ballVelocityY;
   
    int x = MIN(MAX(20, self.Ball.center.x + self.ballVelocityX), self.view.frame.size.width-20);
    if (x == 20 || x == self.view.frame.size.width-20) {
        self.ballVelocityX = -self.ballVelocityX;
    }
    int y = MIN(MAX(120, self.Ball.center.y + self.ballVelocityY), self.view.frame.size.height-20);
    if (y == 120 || y == self.view.frame.size.height-20) {
        self.ballVelocityY = -self.ballVelocityY;
    }
  // this is the ball move
  self.Ball.center = CGPointMake(x, y);
   
  // logic to calculate if ball and hole collide
  if (CGRectIntersectsRect(self.Ball.frame, self.Hole.frame)) {
    [self.gameTimer invalidate];
    [self.view setUserInteractionEnabled:YES];
    self.Ball.center = CGPointMake(self.Hole.center.x, self.Hole.center.y);
    self.Ball.alpha = 0.2;
      self.ballInBunker = false;
      self.ballInHole = true;

  }
    if (!self.ballInBunker && CGRectIntersectsRect(self.Ball.frame, self.Bunker.frame)) {
    [self.gameTimer invalidate];
    [self.view setUserInteractionEnabled:YES];
    self.Ball.center = CGPointMake(self.Bunker.center.x, self.Bunker.center.y);
    self.Ball.alpha = 1;
        self.ballInBunker = true;
  }
   
  // if ball slows/stops turn off game timer and turn user interaction back on
  if(fabs(self.ballVelocityX) < stopSpeed && fabs(self.ballVelocityY) < stopSpeed) {
    [self.gameTimer invalidate];
    [self.view setUserInteractionEnabled:YES];
      self.ballInBunker = false;
      
  }
    
}
- (IBAction)resetBallPosition:(id)sender {
     self.Ball.frame = self.initialBallPosition;
    self.ballInHole = false;
    self.Ball.alpha = 1;


}

@end
