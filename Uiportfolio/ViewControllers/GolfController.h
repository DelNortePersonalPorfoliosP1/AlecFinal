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
@property (strong, nonatomic) IBOutlet UIImageView *Bunker;
@property (strong, nonatomic) IBOutlet UIButton *resetButton;


@property (nonatomic) CGPoint firstPoint;
@property (nonatomic) CGPoint lastPoint;
@property (nonatomic) BOOL ballInBunker;
@property (nonatomic) BOOL ballInHole;
@property (nonatomic) CGRect initialBallPosition;
@property (nonatomic) float ballVelocityX;
@property (nonatomic) float ballVelocityY;
@property (strong, nonatomic) NSTimer *gameTimer;
@end
