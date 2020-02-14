//
//  Header.h
//  Projects
//
//  Created by John Mortensen on 9/21/19.
//  Copyright © 2019 Vo, Anthony. All rights reserved.
//


#ifndef portfolio_h
#define portfolio_h
// Classic C style defines for Operator control
#define BUFFER_SIZE 80
#define FILE_BUFFER_SIZE 1024
#define LINE_BUFFER_SIZE 256
#define WORDS_TO_LINE_SIZE 64
// Math operations
#define PLUS 0
#define MINUS 1
#define MULTIPLY 2
#define DIVIDE 3
#define MODULO 4
#define SQRT 5


// C Function Name and Line number
typedef struct candidatesFuncs {
    char name[LINE_BUFFER_SIZE];
    unsigned int functionStartLine;
} CANDIDATE_FUNCS;
CANDIDATE_FUNCS* fileParse(char *fn);

// Programming Languages Data Definition
typedef enum {JIT, JVM, ByteCode, Native} EXE_TYPE;
typedef enum {OOP, MP, Iterative} LANG_TYPE;
typedef struct language {
    char name[20];
    char yob[10];
    char creator[80];
    EXE_TYPE exetype;
    LANG_TYPE langtype;
} LANGUAGES;
LANGUAGES* progLanguages(void);
LANGUAGES* searchLanguages(char *searchTerm);

// Classic C style prototype for portfolio
int jumpers(char *message);
int histogram(char *message);
int zeroTest(double value);
double calculateIt(double arg1, int mathOp, double arg2);
double hyptoneuse (double side1, double side2);

char *revXArray(char* input, long length);
char *revXRecurse(const char* input, long length);
char *revXPointer(const char* input, long length);
char *paliEval(char* input, char* output, long length);

char *removeVowels(const char *input, long length);

char *revRecurse(const char* input, long length);

// Definition of structure
// Tokenizing Helper Structure
typedef struct words {
  char word[BUFFER_SIZE];
  char reversed[BUFFER_SIZE];
  char pigged[BUFFER_SIZE];
  char shorted[BUFFER_SIZE];
} WORDS;
typedef struct phrases {
  char original[LINE_BUFFER_SIZE];
  char piglatin[LINE_BUFFER_SIZE];
  char shorthand[LINE_BUFFER_SIZE];
  char reversed[LINE_BUFFER_SIZE];
  WORDS words[WORDS_TO_LINE_SIZE];
} PHRASE;

void pointertest();

#define SUIT_CNT 4
#define SYMBOL_CNT 13
#define DECK_CNT 52
static char *colorStrings[] = {"Red", "Black"};
static char *suitStrings[] = {"Clubs", "Diamonds", "Hearts", "Spades"};
static char *symbolStrings[] = {"Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"};
typedef enum {Red, Black} COLOR_TYPE;
typedef enum {Clubs, Diamonds, Hearts, Spades} SUIT_TYPE;
typedef enum {Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King} SYMBOL_TYPE;
typedef struct card {
    int cID;                        // unique ID of card (1 to 52 on conventional deck)
    int value;                      // 1, 2, ... 13, used to determine rank in games
    COLOR_TYPE color;               // Red or Black
    SUIT_TYPE suit;                 // Clubs, Diamonds, Hearts, Spaces
    SYMBOL_TYPE symbol;             // Ace, Two, ... King
    char cImage[10];
} CARD;
CARD * createdeck(void);
void shuffledeck(CARD *c);
void dealdeck(CARD *c);
void freedeck(CARD *c);

#endif /* portfolio_h */
