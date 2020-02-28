//
//  Header.h
//  Uiportfolio
//
//  Created by Alec Linyard on 2/7/20.
//  Copyright © 2020 JM. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface CardController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *randomNumber;

@property (strong, nonatomic) IBOutlet UIImageView *testImage;
@property (strong, nonatomic) IBOutlet UIImageView *testComputerImage;

@property (strong, nonatomic) IBOutlet UIImageView *computerDiscard;
@property (strong, nonatomic) IBOutlet UIImageView *playerDiscard;

@property (weak, nonatomic) IBOutlet UILabel *cardStatus;
@property (weak, nonatomic) IBOutlet UILabel *playerDeckCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *computerDeckCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end
