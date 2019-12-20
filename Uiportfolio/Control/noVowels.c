//
//  noVowels.c
//  Uiportfolio
//
//  Created by Alec Linyard on 12/16/19.
//  Copyright © 2019 JM. All rights reserved.
//
#include <stdio.h>
#include <string.h>
#include "control.h"

char revXBuffer[LINE_BUFFER_SIZE];

void tokentest(){
  PHRASE in;               // Phrase is defined in control.h
  char str[LINE_BUFFER_SIZE] = "A Man A Plan A Canal – Panama";
  const char *tokenizer = " ";
   
  strcpy(in.original, str);
  printf( "original phrase: %s\n", in.original );
  long i = 0;
  char *token = strtok(str, tokenizer);  // 1st word
  while( token != NULL ) {        // NULL mean end of phrase
    printf( "word after tokenizing: %s\n", token );
     
    // assignment to struct
    strcpy(in.words[i].word, token);
    printf( "word in structure %li: %s\n", i, in.words[i].word);
     
    // iterate
    i++;
    token = strtok(NULL, tokenizer);  // remaining words, NULL means same str
  }
  return;
}
char revXBuffer[LINE_BUFFER_SIZE];


// recursion helper, recursive loop function
void Xrecurse(char* input, long begin, long end) {
    // recursion terminates
    if (begin >= end)
        return;
    char temp = input[begin];
//    char temp = *(input + begin);
    input[begin] = input[end];
//    *(input + begin) = *(input + end);
    input[end] = temp;
//    *(input + end) = temp;
    // recursion continues
    Xrecurse(input, ++begin, --end);
}
// recursion reverse function
char *revRecurse(const char* input, long length){
    // copy string to buffer, don't disrupt original
    strncpy(revXBuffer, input, length);
    // recursion control variables
    long begin = 0;
    long end = length-1;
    // call recursion function
    Xrecurse(revXBuffer, begin, end);
    revXBuffer[length] = 0;

    return revXBuffer;
}


