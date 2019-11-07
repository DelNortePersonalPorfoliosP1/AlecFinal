//
//  pythag.c
//  ui.portfolio
//
//  Created by Alec Linyard on 11/7/19.
//  Copyright © 2019 Alec Linyard. All rights reserved.
//

#include "pythag.h"
#include <stdio.h>
#include <math.h>

void pythagorean() {
    
    int sideone;
    int sidetwo;
    
    printf("Enter the First Value\n");
    scanf("%d", &sideone);
    printf("Enter the Second Value\n");
    scanf("%d", &sidetwo);
    
    float sidethree = (sqrt(sideone * sideone + sidetwo * sidetwo));
    
    printf("%f\n", sidethree);
}
