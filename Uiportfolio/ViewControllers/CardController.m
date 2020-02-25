//
//  CardController.m
//  Uiportfolio
//
//  Created by Alec Linyard on 2/7/20.
//  Copyright © 2020 JM. All rights reserved.
//

#include "control.h"
#import "CardController.h"
#include <stdio.h>
#include <stdlib.h>
@implementation CardController
@synthesize randomNumber;
int mainDeck[52];
int playerOneDeck[52];
int playerTwoDeck[52];
int playerOneDiscard[52];
int playerTwoDiscard[52];
int numPlayerOneCards;
int numPlayerTwoCards;
int numPlayerOneDiscard;
int numPlayerTwoDiscard;
int test;


- (void)viewDidLoad {
    time_t t;

    srand((unsigned) time(&t));

    
    for (int i = 0; i < 52; i++) {
        mainDeck[i] = i;
        playerOneDeck[i] = -1;
        playerTwoDeck[i] = -1;
        playerOneDiscard[i] = -1;
        playerTwoDiscard[i] = -1;
    }
    shuffleCards(mainDeck, 52);
    for (int i = 0; i < 26; i++) {
        playerOneDeck[i] = mainDeck[i];
        playerTwoDeck[i] = mainDeck[i + 26];
    }
    
    numPlayerOneCards = 26;
    numPlayerTwoCards = 26;
    
    numPlayerOneDiscard = 0;
    numPlayerTwoDiscard = 0;
    
    int topPlayerCard = getTopCardFromDeck(playerOneDeck, &numPlayerOneCards);
    self.testImage.image = [self imageForCard: topPlayerCard];
    
}
/*

- (void)viewDidLoad {
    time_t t;

    srand((unsigned) time(&t));

    for (int i = 1; i <= 52; i++) {
        mainDeck[i - 1] = i;
    }
    
    for (int i = 0; i < 52; i++) {
        int temp = mainDeck[i];
        int newSlot = rand() % 52;
        mainDeck[i] = mainDeck[newSlot];
        mainDeck[newSlot] = temp;
    }
    
    int card = rand() % 13 + 2;
    int suit = rand() % 4;
    char c[3];
    if (card <= 10) {
        sprintf(c, "%d", card);
    } else if (card == 11) {
        sprintf(c, "J");
    } else if (card == 12) {
        sprintf(c, "Q");
    }  else if (card == 13) {
        sprintf(c, "K");
    } else if (card == 14) {
        sprintf(c, "A");
    }
    
    char s[2];
    if (suit == 0) {
        sprintf(s, "C");
    } else if (suit == 1) {
        sprintf(s, "D");
    } else if (suit == 2) {
        sprintf(s, "S");
    }  else if (suit == 3) {
        sprintf(s, "H");
    }

    char img[10];
    sprintf(img, "%s%s.png", c, s);
    
    self.testImage.image = [UIImage imageNamed: [NSString stringWithFormat:@"%s", img]];
}
*/

- (UIImage *)imageForCard:(int)card {
    NSString * suit;
    char value[3];
    
    if (card <= 12) {
        suit = @"H";
    } else if (card <= 25) {
        suit = @"S";
    } else if (card <= 38) {
        suit = @"C";
    } else {
        suit = @"D";
    }
    
    int cardValue = card % 13 + 2;
    if (cardValue <= 10) {
        sprintf(value, "%d", cardValue);
    } else if (cardValue == 11) {
        sprintf(value, "J");
    } else if (cardValue == 12) {
        sprintf(value, "Q");
    }  else if (cardValue == 13) {
        sprintf(value, "K");
    } else if (cardValue == 14) {
        sprintf(value, "A");
    }
    
    return [UIImage imageNamed: [NSString stringWithFormat:@"%s%@.png", value, suit]];
}

void shuffleCards(int cards[], int numCards) {
    for (int i = 0; i < numCards; i++) {
        int temp = cards[i];
        int newSlot = rand() % numCards;
        cards[i] = cards[newSlot];
        cards[newSlot] = temp;
    }
}

int getTopCardFromDeck(int cards[], int * pNumCards) {
    int topCard = cards[0];
    for (int i = 0; i < 51; i++) {

        cards[i] = cards[i + 1];
    }
    cards[51] = -1;
    
    *pNumCards = *pNumCards - 1;
    return topCard;
}

- (IBAction)showNumber:(id)sender {
    time_t t;

    srand((unsigned) time(&t));

    
    for (int i = 0; i < 52; i++) {
        int temp = mainDeck[i];
        int newSlot = rand() % 52;
        mainDeck[i] = mainDeck[newSlot];
        mainDeck[newSlot] = temp;
    }
    
        int card = rand() % 13 + 2;
        int suit = rand() % 4;
        char c[3];
        if (card <= 10) {
            sprintf(c, "%d", card);
        } else if (card == 11) {
            sprintf(c, "J");
        } else if (card == 12) {
            sprintf(c, "Q");
        }  else if (card == 13) {
            sprintf(c, "K");
        } else if (card == 14) {
            sprintf(c, "A");
        }
        
        char s[2];
        if (suit == 0) {
            sprintf(s, "C");
        } else if (suit == 1) {
            sprintf(s, "D");
        } else if (suit == 2) {
            sprintf(s, "S");
        }  else if (suit == 3) {
            sprintf(s, "H");
        }

        char img[10];
        sprintf(img, "%s%s.png", c, s);
        
        self.testImage.image = [UIImage imageNamed: [NSString stringWithFormat:@"%s", img]];
    
}


@end
