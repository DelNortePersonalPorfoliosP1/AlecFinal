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
@synthesize output, inputText, output1Text, input, reverse, piggy, shorty;

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





- (IBAction)tranlate:(id)sender {
    // tokentester shows business logic usage
    tokentester();
    
    // translator function is work horse
    translator(input.text.UTF8String, input.text.length);
    
    // these function return data from data stored by translator
    reverse.text = [NSString stringWithFormat:@"%s" , getreversed() ];
    piggy.text = [NSString stringWithFormat:@"%s" , getpiglatin() ];
    //shorty.text = [NSString stringWithFormat:@"%s" , getshorthand() ];
}

/**
* SMS code, works only on phone
*/
-(void)sendMessage:(NSString*)messageKeeper {
    
    if([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init]; // Create message VC
        messageController.messageComposeDelegate = self; // Set delegate to current instance
​
        NSMutableArray *recipients = [[NSMutableArray alloc] init]; // Create an array to hold the recipients
        [recipients addObject:@"858-775-4956"]; // Append phone number to array
        messageController.recipients = recipients; // Set the recipients of the message to the created array
​
        messageController.body = messageKeeper; // Set initial text to example message
​
        dispatch_async(dispatch_get_main_queue(), ^{ // Present VC when possible
            [self presentViewController:messageController animated:YES completion:NULL];
        });
    } else {
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        UIAlertController *msgFailed = [UIAlertController alertControllerWithTitle:@"Message Failed" message:@"SMS not supported" preferredStyle:UIAlertControllerStyleAlert];
        [msgFailed addAction:cancel];
        [self presentViewController:msgFailed animated:YES completion:nil];
    }
}

/**
* Action to send reverse message
*/
- (IBAction)revSMS:(id)sender {
    [self sendMessage:reverse.text];
}


- (IBAction)pigSMS:(id)sender {
    [self sendMessage:piggy.text];
}

- (void)messageComposeViewController:(nonnull MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //button click event
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertController *msgSent = [UIAlertController alertControllerWithTitle:@"Message Sent" message:@"Your message was sent" preferredStyle:UIAlertControllerStyleAlert];
    [msgSent addAction:ok];
    UIAlertController *msgFailed = [UIAlertController alertControllerWithTitle:@"Message Failed" message:@"Your message did not send" preferredStyle:UIAlertControllerStyleAlert];
    [msgFailed addAction:cancel];
                              
    switch (result) {
        case MessageComposeResultCancelled:
            NSLog(@"user cancelled");
            break;
            
        case MessageComposeResultFailed:
            NSLog(@"message failed");
            [self presentViewController:msgFailed animated:YES completion:nil];
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
            
        case MessageComposeResultSent:
            NSLog(@"message sent");
            [self presentViewController:msgSent animated:YES completion:nil];
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
            
        default:
            break;
    }
}
@end
