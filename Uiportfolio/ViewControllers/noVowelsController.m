//
//  noVowels.m
//  Uiportfolio
//
//  Created by Alec Linyard on 12/16/19.
//  Copyright © 2019 JM. All rights reserved.
//

#include "control.h"
#import "noVowelsController.h"

@implementation Piglatin
@synthesize output, inputText;

- (void)viewDidLoad {
   [super viewDidLoad];
   [output setText:@""];
}
- (IBAction)remove:(id)sender {
        const char * utf = [inputText.text UTF8String];
    NSString* string = [NSString stringWithFormat:@"%s" , removeVowels((char*)utf, strlen(utf))];
    //    NSString* string = [NSString stringWithFormat:@"%s" , revXPointer((char*)utf, strlen(utf))];
        [output setText: string];
}
@end
