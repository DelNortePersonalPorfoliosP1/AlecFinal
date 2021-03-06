//
//  Golf.h
//  Uiportfolio
//
//  Created by Alec Linyard on 1/15/20.
//  Copyright © 2020 JM. All rights reserved.
//

#import <UIKit/UIKit.h>

#define speedScale 0.20
#define speedDamping 0.90  // friction rate
#define stopSpeed 5.0


@interface GolfController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *Ball;
@property (strong, nonatomic) IBOutlet UIImageView *Hole;
@property (strong, nonatomic) IBOutlet UIImageView *pond;
@property (strong, nonatomic) IBOutlet UIImageView *bluePortal;
@property (strong, nonatomic) IBOutlet UIImageView *orangePortal;
@property (strong, nonatomic) IBOutlet UIImageView *Bunker;
@property (strong, nonatomic) IBOutlet UIImageView *directionalsright;
@property (strong, nonatomic) IBOutlet UIImageView *directionalsleft;
@property (strong, nonatomic) IBOutlet UIButton *resetButton;
@property (strong, nonatomic) IBOutlet UIButton *nextLevel;
@property (strong, nonatomic) IBOutlet UILabel *Shots;
@property (strong, nonatomic) IBOutlet UILabel *Par;
@property (strong, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UIImageView *Tree;


@property (nonatomic) CGPoint firstPoint;
@property (nonatomic) CGPoint lastPoint;
@property (nonatomic) BOOL ballInBunker;
@property (nonatomic) BOOL ballInHole;
@property (nonatomic) CGRect initialBallPosition;
@property (nonatomic) float ballVelocityX;
@property (nonatomic) float ballVelocityY;
@property (strong, nonatomic) NSTimer *gameTimer;

@property (nonatomic) int golfCounter;
@property (nonatomic) int parForCurrentHole;

@end
