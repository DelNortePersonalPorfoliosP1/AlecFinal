//
//  Golf.m
//  Uiportfolio
//
//  Created by Alec Linyard on 1/15/20.
//  Copyright © 2020 JM. All rights reserved.
//

#include "control.h"
#import "GolfController.h"

int score = 0;
@implementation GolfController
@synthesize Ball, Hole, firstPoint, lastPoint, resetButton, ballInBunker, initialBallPosition, Shots, Par, golfCounter, parForCurrentHole;


- (void)viewDidLoad {
  [super viewDidLoad];
    if (self.parForCurrentHole == 0) {
        self.parForCurrentHole = 3;
    }
  // changes hole image to be circular
  self.Hole.layer.cornerRadius = .5*self.Hole.layer.frame.size.height;
  self.Hole.layer.masksToBounds = YES;
    self.ballInBunker = false;
    self.ballInHole = false;
    self.initialBallPosition = self.Ball.frame;
    self.nextLevel.alpha = 0;
    self.golfCounter = 0;
    self.score.text = [NSString stringWithFormat:@"Score: %d", score];
    self.Par.text = [NSString stringWithFormat:@"Par: %d", self.parForCurrentHole];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"golf2"]) {
           GolfController *golfController = [segue destinationViewController];
           golfController.parForCurrentHole = 2;
       }
    if ([[segue identifier] isEqualToString:@"golf3"]) {
              GolfController *golfController = [segue destinationViewController];
              golfController.parForCurrentHole = 4;
          }
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
    
    golfCounter++;
    
    self.Shots.text = [NSString stringWithFormat:@"Shots: %d", golfCounter];

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
      self.nextLevel.alpha = 1;
      score += self.golfCounter - self.parForCurrentHole;
      self.score.text = [NSString stringWithFormat:@"Score: %d", score];

  }
    
    if (CGRectIntersectsRect(self.Ball.frame, self.Tree.frame)) {
        self.ballVelocityY = -self.ballVelocityY;
        self.ballVelocityX = -self.ballVelocityX;


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
    if (CGRectIntersectsRect(self.Ball.frame, self.directionalsleft.frame)) {
        // See if it is moving right
        if (self.ballVelocityX > 0) {
            self.ballVelocityX *= 0.6;
            if (self.ballVelocityX < 3) {
                self.ballVelocityX = -3;
            }
            return;
        }
        
        self.ballVelocityX = 1.4 * self.ballVelocityX;
    }
    if (CGRectIntersectsRect(self.Ball.frame, self.pond.frame)) {
        self.Ball.frame = self.initialBallPosition;
        [self.gameTimer invalidate];
        [self.view setUserInteractionEnabled:YES];
    }
    
    if (CGRectIntersectsRect(self.Ball.frame, self.directionalsright.frame)) {
        // See if it is moving right
        if (self.ballVelocityX < 0) {
            self.ballVelocityX *= 0.6;
            if (self.ballVelocityX > 3) {
                self.ballVelocityX = -3;
            }
            return;
        }
        
        self.ballVelocityX = 1.4 * self.ballVelocityX;
    }

    if (CGRectIntersectsRect(self.Ball.frame, self.bluePortal.frame)) {
        self.Ball.center = self.orangePortal.center;
    }
    
   /* if (CGRectIntersectsRect(self.Ball.frame, self.orangePortal.frame)) {
        self.Ball.center = self.bluePortal.center;
    }
    */
}
- (IBAction)resetBallPosition:(id)sender {
     self.Ball.frame = self.initialBallPosition;
    self.ballInHole = false;
    self.Ball.alpha = 1;

    self.nextLevel.alpha = 0;
    self.score.text = [NSString stringWithFormat:@"score: %d", score];


}






@end
