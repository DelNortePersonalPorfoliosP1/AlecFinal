//
//  ReverseController.m
//  Uiportfolio
//
//  Created by Alec Linyard on 12/4/19.
//  Copyright © 2019 JM. All rights reserved.
//

#include "control.h"
#import "ReverseController.h"


@implementation ReverseController
@synthesize inputText, output1Text, output2Text, output3Text;

- (void)viewDidLoad {
    [super viewDidLoad];
    [inputText setText:@""];
    [output1Text setText:@""];
    [output2Text setText:@""];
    [output3Text setText:@""];
}

- (IBAction)reverse:(id)sender {
    const char * utf = [inputText.text UTF8String];
    NSString* string = [NSString stringWithFormat:@"%s" , revXRecurse((char*)utf, strlen(utf))];
//    NSString* string = [NSString stringWithFormat:@"%s" , revXPointer((char*)utf, strlen(utf))];
    [output1Text setText: string];
}
- (IBAction)reverse2:(id)sender {
    const char * utf = [inputText.text UTF8String];
    NSString* string = [NSString stringWithFormat:@"%s" , revXPointer((char*)utf, strlen(utf))];
//    NSString* string = [NSString stringWithFormat:@"%s" , revXPointer((char*)utf, strlen(utf))];
    [output2Text setText: string];
}
- (IBAction)reverse3:(id)sender {
    const char * utf = [inputText.text UTF8String];
    NSString* string = [NSString stringWithFormat:@"%s" , revXArray((char*)utf, strlen(utf))];
//    NSString* string = [NSString stringWithFormat:@"%s" , revXPointer((char*)utf, strlen(utf))];
    [output3Text setText: string];
}


@end

