//
//  calc.h
//  ui.portfolio
//
//  Created by Alec Linyard on 11/7/19.
//  Copyright © 2019 Alec Linyard. All rights reserved.
//

#define calc_h

#include <stdio.h>

double calc(double arg1 ,int mathOp,double arg2);

// Classic C style defines for Operator control
#define PLUS 0
#define MINUS 1
#define MULTIPLY 2
#define DIVIDE 3
#define MODULO 4
#define NEGATIVE 5
#define SQUARE 6
