//
//  PiglatinController.m
//  Uiportfolio
//
//  Created by Alec Linyard on 12/17/19.
//  Copyright © 2019 JM. All rights reserved.
//

#include "control.h"
#import "PiglatinController.h"

@implementation PiglatinController
@synthesize output, inputText, output1Text;

- (void)viewDidLoad {
   [super viewDidLoad];
   [output1Text setText:@""];
}
- (IBAction)tokenPhrase:(id)sender {
    tokentest();
}
- (IBAction)reverse:(id)sender {
    const char * utf = [inputText.text UTF8String];
    NSString* string = [NSString stringWithFormat:@"%s" , revXRecurse((char*)utf, strlen(utf))];
//    NSString* string = [NSString stringWithFormat:@"%s" , revXPointer((char*)utf, strlen(utf))];
    [output1Text setText: string];
}
@end
