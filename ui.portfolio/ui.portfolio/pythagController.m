//
//  ViewController.m
//  Calculator
//
//  Created by John Mortensen on 10/10/19.
//  Copyright © 2019 JM. All rights reserved.
//

#import "pythagController.h"
#include "pythag.h"

//@interface ViewController ()
//@end

@implementation ViewController // beginning of implementation

// syntesize enables getter and setter methods as used in Obj-C
@synthesize initialPythagAreaInputState, pythagAreaDefault, pythagAreaNumber, pythagAreaLabel;

- (void)viewDidLoad {  // acts like a Constructor
    [super viewDidLoad];
    /* Call to method to initialize calculator (set to zero) */
    [self clearCalculator];
    /* Default value for Calculator Area label */
    [self setPythagAreaDefault:@"0.0"];
    /* Call out to method to handle updating Calculator Area Label display */
    [self clearCalcAreaLabel];
}

-(void)calculateAnswer  // method to perform calculation
{
//    int a1 = 0; //to determine which number is a squared function
    // arg2 = [calcAreaNumber doubleValue];  // Obj-C Class method to convert NSSTRING to double
    sidetwo = pythagAreaNumber.doubleValue;  // Alternate Java like syntax to convert NSSTRING to double
    
    pythagAnswer = pythag(sideone, pythagOp, sidetwo);
    
}

/* Section 1: Methods for managing and performing calculation, C style used where practical */


-(void)saveValueOfArg1 { // method to store 1st value in calculation (arg1), C style
    // arg1 = [calcAreaNumber doubleValue];  // Obj-C Class method to convert NSSTRING to double
    sideone = pythagAreaNumber.doubleValue;  // Alternate Java like syntax to convert NSSTRING to double
}

-(void)saveValueofAnswer {  // method to save value of answer after calc to arg1
    pythagOp = -1;          // operator is unassigned after calc
    sideone = pythagAnswer;      // arg1 is current display value
    sidetwo = 0.0;             // arg2 is now unassigned
}

-(void)saveValueOfOperator:(int)opNumber {  // method to retain value of operator
    pythagOp = opNumber;
}

-(void)clearCalculator {                    // method to clear values of calculator
    pythagOp = -1;
    sideone = 0.0;
    sidetwo = 0.0;
    pythagAnswer = 0.0;
}
/* End Section 1 */

/* Section 2:  View Control helper methods to manage Calculation Area */
-(void)setTextCalcAreaLabel {  // helper method to set and thus update text in Calc Area
    [pythagAreaLabel setText:pythagAreaNumber];
}

-(void)concatCalcAreaLabel:(NSString *)keyNumber {  // helper method for handling number being input
    if (initialPythagAreaInputState) {  // sets number vs concat on initial key typed
        [self setPythagAreaNumber:keyNumber];
        [self setInitialPythagAreaInputState:false];
    } else  {                         // concats number ot end on subsequent keys typed
        [self setPythagAreaNumber:[pythagAreaNumber stringByAppendingString:keyNumber]];
    }
    [self setTextCalcAreaLabel];
}

-(void)clearCalcAreaLabel {  // helper method to clear and update text in Calc Area to default
    [self setPythagAreaNumber:pythagAreaDefault];
    [self setInitialPythagAreaInputState:true];  // set calc area state to starting state
    [self setTextCalcAreaLabel];
}
/* End Section 2 */


// Section 3: Interface Builder actions for buttons
-(IBAction)equalButton:(id)sender {  // Interface Builder action for equal (calculation)
    // perform calculation
    [self calculateAnswer];
    
    // set and display result
    [self setPythagAreaNumber:[NSString stringWithFormat:@"%f", pythagAnswer]];  // float (double) to string
    [self setTextCalcAreaLabel];
    
    // set values to support continued calculations, but wipe if you type a number
    [self saveValueofAnswer];                   // answer -> arg1
    [self setInitialPythagAreaInputState:true];   // number key typing will wipe value
    
}

-(IBAction)clearButton:(id)sender { // Interface Builder action for clear (clean calculator)
    [self clearCalculator];          // clear operator
    [self clearCalcAreaLabel];
}

// Interface Builder for operators buttons
-(IBAction)plusButton:(id)sender {  // Interface Builder action for plus (+)
    [self saveValueOfOperator:PLUS];
    [self saveValueOfArg1];
    [self clearCalcAreaLabel];
}
-(IBAction)minusButton:(id)sender {  // Interface Builder action for plus (+)
    [self saveValueOfOperator:MINUS];
    [self saveValueOfArg1];
    [self clearCalcAreaLabel];
}
-(IBAction)multiplyButton:(id)sender {  // Interface Builder action for plus (+)
    [self saveValueOfOperator:MULTIPLY];
    [self saveValueOfArg1];
    [self clearCalcAreaLabel];
}
-(IBAction)divideButton:(id)sender {  // Interface Builder action for plus (+)
    [self saveValueOfOperator:DIVIDE];
    [self saveValueOfArg1];
    [self clearCalcAreaLabel];
}-(IBAction)switchButton:(id)sender {  // Interface Builder action for plus (+)
//    [self saveValueOfOperator:NEGATIVE];
//    [self saveValueOfArg1];
//    [self clearCalcAreaLabel];
//    [self calculateAnswer];
    
    // set and display result
//    [self setCalcAreaNumber:[NSString stringWithFormat:@"%f", -calcAreaNumber.doubleValue]];  // float (double) to string
//    [self setTextCalcAreaLabel];
    if ([[pythagAreaLabel text] containsString:@"-"])
    {
        [pythagAreaLabel setText:[[pythagAreaLabel text] substringFromIndex:1]];
    } else {
        [pythagAreaLabel setText:[@"-" stringByAppendingString:pythagAreaNumber]];
    }

    // set values to support continued calculations, but wipe if you type a number
//    [self saveValueofAnswer];
}
-(IBAction)squareButton:(id)sender {  // Interface Builder action for plus (+)
    [self saveValueOfOperator:SQUARE];
    [self saveValueOfArg1];
    //[self clearCalcAreaLabel];
    [self calculateAnswer];
    
    // set and display result
    [self setPythagAreaNumber:[NSString stringWithFormat:@"%f", pythagAnswer]];  // float (double) to string
    [self setTextCalcAreaLabel];
    

    // set values to support continued calculations, but wipe if you type a number
    [self saveValueofAnswer];
    [self setInitialPythagAreaInputState:true];   // number key typing will wipe value
 
}
-(IBAction)percentButton:(id)sender {  // Interface Builder action for plus (+)
    [self saveValueOfOperator:MODULO];
    [self saveValueOfArg1];
    [self calculateAnswer];
    
    // set and display result
    [self setPythagAreaNumber:[NSString stringWithFormat:@"%f", pythagAnswer]];  // float (double) to string
    [self setTextCalcAreaLabel];
    
    // set values to support continued calculations, but wipe if you type a number
    [self saveValueofAnswer];                   // answer -> arg1
    [self setInitialPythagAreaInputState:true];
//    [self clearCalcAreaLabel];
}

// Interface Builder actions  for numbers and decimal
-(IBAction)press9Button:(id)sender {  // Interface Builder action for (9)
NSString *keyNumber = @"9";
[self concatCalcAreaLabel:keyNumber];
}
-(IBAction)press8Button:(id)sender {  // Interface Builder action for (9)
NSString *keyNumber = @"8";
[self concatCalcAreaLabel:keyNumber];
}
-(IBAction)press7Button:(id)sender {  // Interface Builder action for (9)
NSString *keyNumber = @"7";
[self concatCalcAreaLabel:keyNumber];
}
-(IBAction)press6Button:(id)sender {  // Interface Builder action for (9)
NSString *keyNumber = @"6";
[self concatCalcAreaLabel:keyNumber];
}
-(IBAction)press5Button:(id)sender {  // Interface Builder action for (9)
NSString *keyNumber = @"5";
[self concatCalcAreaLabel:keyNumber];
}
-(IBAction)press4Button:(id)sender {  // Interface Builder action for (9)
NSString *keyNumber = @"4";
[self concatCalcAreaLabel:keyNumber];
}
-(IBAction)press3Button:(id)sender {  // Interface Builder action for (9)
NSString *keyNumber = @"3";
[self concatCalcAreaLabel:keyNumber];
}
-(IBAction)press2Button:(id)sender {  // Interface Builder action for (9)
NSString *keyNumber = @"2";
[self concatCalcAreaLabel:keyNumber];
}
-(IBAction)press1Button:(id)sender {  // Interface Builder action for (9)
NSString *keyNumber = @"1";
[self concatCalcAreaLabel:keyNumber];
}
-(IBAction)press0Button:(id)sender {  // Interface Builder action for (9)
NSString *keyNumber = @"0";
[self concatCalcAreaLabel:keyNumber];
}
-(IBAction)pressDecimalButton:(id)sender {  // Interface Builder action for (9)
NSString *keyNumber = @".";
    if ([[pythagAreaLabel text] containsString:@"."]) {
        return;
    }

[self concatCalcAreaLabel:keyNumber];
}
@end
