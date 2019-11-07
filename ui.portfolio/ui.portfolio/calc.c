//
//  calc.c
//  ui.portfolio
//
//  Created by Alec Linyard on 11/7/19.
//  Copyright © 2019 Alec Linyard. All rights reserved.
//

#include "calc.h"

double calc(double arg1 ,int mathOp,double arg2) {

double calcAnswer = 0.0;  // method to perform calculation
    
        // arg2 = [calcAreaNumber doubleValue];  // Obj-C Class method to convert NSSTRING to double

switch(mathOp)
        {
            case PLUS:
                calcAnswer = arg1 + arg2;
                break;
            case MINUS:
                calcAnswer = arg1 - arg2;
                break;
            case DIVIDE:
                calcAnswer = arg1 / arg2;
                break;
            case MULTIPLY:
                calcAnswer = arg1 * arg2;
                break;
            case MODULO:
                calcAnswer = arg1/100;
                break;
    //        case NEGATIVE:
    //            calcAnswer = arg1 - (arg1 * 2);
    //            break;
            case SQUARE:
                calcAnswer = arg1 * arg1;
                break;
            case -1:
                calcAnswer = arg1;
        }
    return calcAnswer;
}
