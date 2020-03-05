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

//Declaring Variables for the project
@implementation CardController
@synthesize randomNumber;
int mainDeck[52];
int playerOneDeck[52];
int computerDeck[52];
int playerOneDiscard[52];
int computerDiscard[52];
int numPlayerOneCards;
int numComputerCards;
int numPlayerOneDiscard;
int numComputerDiscard;

//Code for when the storyboard loads
- (void)viewDidLoad {
    time_t t;

    srand((unsigned) time(&t));

    //This shuffles the deck
    for (int i = 0; i < 52; i++) {
        mainDeck[i] = i;
        playerOneDeck[i] = -1;
        computerDeck[i] = -1;
        playerOneDiscard[i] = -1;
        computerDiscard[i] = -1;
    }
    //This assigns the shuffled 52 cards into 2 seperate piles, the player deck and the computer deck
    shuffleCards(mainDeck, 52);
    for (int i = 0; i < 26; i++) {
        playerOneDeck[i] = mainDeck[i];
        computerDeck[i] = mainDeck[i + 26];
    }
    
    //This sets the number of cards in each deck when the game starts. Used later to track number of cards left.
    numPlayerOneCards = 26;
    numComputerCards = 26;
    
    //This sets the number of cards in each discard when the game starts. Used later to track number of cards left.
    numPlayerOneDiscard = 0;
    numComputerDiscard = 0;
    
    //Sets labels to the number of cards in the player and computer
    self.playerDeckCountLabel.text = [NSString stringWithFormat:@"Cards Left: %d", numPlayerOneCards];
    self.computerDeckCountLabel.text = [NSString stringWithFormat:@"Cards Left: %d", numComputerCards];
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

//Adds count to discard
void addDiscard(int cards[], int card, int* pNumCards) {
    cards[*pNumCards] = card;
    *pNumCards = *pNumCards + 1;
}

//Code for card images
- (UIImage *)imageForCard:(int)card {
    NSString * suit;
    char value[3];
    
    //Setting the suit and card number so that I can set the images later
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

//shuffle card code
void shuffleCards(int cards[], int numCards) {
    for (int i = 0; i < numCards; i++) {
        int temp = cards[i];
        int newSlot = rand() % numCards;
        cards[i] = cards[newSlot];
        cards[newSlot] = temp;
    }
}

//gets the top card from the computer deck
int getTopComputerCardFromDeck(int cards[], int * pNumCards) {
    int topCard2 = cards[0];
    for (int i = 0; i < 51; i++) {

        cards[i] = cards[i + 1];
    }
    cards[51] = -1;
    
    *pNumCards = *pNumCards - 1;
    return topCard2;
}

//gets the top card from the player deck
int getTopCardFromDeck(int cards[], int * pNumCards) {
    int topCard = cards[0];
    for (int i = 0; i < 51; i++) {

        cards[i] = cards[i + 1];
    }
    cards[51] = -1;
    
    *pNumCards = *pNumCards - 1;
    return topCard;
}

//This is all the code for the "next" button
- (IBAction)dealNextCard:(id)sender {
    int topPlayerCard = getTopCardFromDeck(playerOneDeck, &numPlayerOneCards);
    self.testImage.image = [self imageForCard: topPlayerCard];
    int topComputerCard = getTopComputerCardFromDeck(computerDeck, &numComputerCards);
    self.testComputerImage.image = [self imageForCard: topComputerCard];

    int playerCardValue = topPlayerCard % 13 + 2;
    int computerCardValue = topComputerCard % 13 + 2;
    bool playerWins = playerCardValue >= computerCardValue;

    self.cardStatus.text = playerWins ? @"Winner >" : @"< Winner";

    //Displaying messages based off who wins
    if (playerWins) {
        self.cardStatus.text = @"Winner >";
        addDiscard(playerOneDiscard, topPlayerCard, &numPlayerOneDiscard);
        addDiscard(playerOneDiscard, topComputerCard, &numPlayerOneDiscard);
    } else {
        self.cardStatus.text = @"< Winner";
        addDiscard(computerDiscard, topPlayerCard, &numComputerDiscard);
        addDiscard(computerDiscard, topComputerCard, &numComputerDiscard);

    }
    
    //Sets deck counts to the number of cards left
    self.playerDeckCountLabel.text = [NSString stringWithFormat:@"Cards Left: %d", numPlayerOneCards];
    self.computerDeckCountLabel.text = [NSString stringWithFormat:@"Cards Left: %d", numComputerCards];

    //Says that the computer is the winner if player has no cards
    if (numPlayerOneCards == 0) {
        if (numPlayerOneDiscard == 0) {
            self.nextButton.hidden = true;
            self.cardStatus.text = @"Computer Is The Winner!";
            self.testImage.hidden = true;
            self.testComputerImage.hidden = true;
            return;
        }
        for (int i = 0; i < 52; i++) {
            playerOneDeck[i] = playerOneDiscard[i];
            playerOneDiscard[i] = -1;
        }
        
        numPlayerOneCards = numPlayerOneDiscard;
        numPlayerOneDiscard = 0;
        
        shuffleCards(playerOneDeck, numPlayerOneCards);
        self.playerDeckCountLabel.text = [NSString stringWithFormat:@"Cards Left: %d", numPlayerOneCards];
        

    }
    
    //Says that the player is the winner if computer has no cards
    if (numComputerCards == 0) {
        if (numComputerDiscard == 0) {
            self.nextButton.hidden = true;
            self.cardStatus.text = @"Player Is The Winner!";
            self.testImage.hidden = true;
            self.testComputerImage.hidden = true;
            return;
        }
        for (int i = 0; i < 52; i++) {
            computerDeck[i] = computerDiscard[i];
            computerDiscard[i] = -1;
        }
        
        numComputerCards = numComputerDiscard;
        numComputerDiscard = 0;
        
        shuffleCards(computerDeck, numComputerCards);
        self.computerDeckCountLabel.text = [NSString stringWithFormat:@"Cards Left: %d", numComputerCards];

    }
    /*
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
    self.testComputerImage.image = [UIImage imageNamed: [NSString stringWithFormat:@"%s", img]];
    */
}


@end
