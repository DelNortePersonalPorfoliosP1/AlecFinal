//
//  pythagController.h
//  ui.portfolio
//
//  Created by Alec Linyard on 11/7/19.
//  Copyright © 2019 Alec Linyard. All rights reserved.
//

#ifndef pythagController_h
#define pythagController_h


#import <UIKit/UIKit.h>

// Classic C style defines for Operator control
#define PLUS 0
#define MINUS 1
#define MULTIPLY 2
#define DIVIDE 3
#define MODULO 4
#define NEGATIVE 5
#define SQUARE 6

@interface ViewController : UIViewController
/* Section 1: Classic C style variables to support calculation */
{
    double sideone;
    int pythagOp;
    double sidetwo;
    double pythagAnswer;
}

/* Section 2: Obj-C style variables to support Calc area management  */
@property Boolean initialPythagAreaInputState;
// Note: Obj-C helps with string memory management:  1. retention "strong"  2. multi-thread "nonatomic"
@property (strong, nonatomic) NSString *pythagAreaDefault;
@property (strong, nonatomic) NSString *pythagAreaNumber;

/* Section 3: Obj-C style to support Interfacce Builder Outlet for Calc area */
@property (strong, nonatomic) IBOutlet UILabel *pythagAreaLabel;

@end


#endif /* pythagController_h */
