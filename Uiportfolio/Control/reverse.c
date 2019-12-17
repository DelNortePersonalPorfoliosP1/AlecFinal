//
//  reverse.c
//  Uiportfolio
//
//  Created by Alec Linyard on 12/3/19.
//  Copyright © 2019 JM. All rights reserved.
//
#include <stdio.h>
#include <string.h>
#include "control.h"
// PUT ME IN YOUR .C FILE, BUSINESS LOGIC
// persistent variables used after calling functions
char *isPali = "Is Palindrome";
char *noPali = "Not a Palindrome";
// array reverse function
char revBuffer[LINE_BUFFER_SIZE];

char *revXArray(char* input, long length){
    
  strncpy (revBuffer,input,length);
  char swap;
  for (long begin = 0,end = length - 1; begin < end; begin++, end--)
  {
    // switcheroo: switches two values around
    swap = revBuffer[begin];
    revBuffer[begin] = revBuffer[end];
    revBuffer[end] = swap;
  }
  return revBuffer;
}
// recursion helper, recursive loop function
void recurse(char* input, long begin, long end) {
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
    recurse(input, ++begin, --end);
}
// recursion reverse function
char *revXRecurse(const char* input, long length){
    // copy string to buffer, don't disrupt original
    strncpy(revBuffer, input, length);
    // recursion control variables
    long begin = 0;
    long end = length-1;
    // call recursion function
    recurse(revBuffer, begin, end);
    revBuffer[length] = 0;

    return revBuffer;
}
char *revXPointer(const char* input, long length) {
    // copy string to buffer, don't disrupt original
    strncpy(revBuffer, input, length);
    // initialize pointer control variables
    char *begin = revBuffer;
    char *end = revBuffer;
    end += length - 1;  // pointer math is simple on char as it corresponds to memory
    // reverse char's in buffer by pointer referece
    while ( begin < end ) {
        // pointer address increment/decrement
        char temp = *begin;
        *begin = *end;
        *end = temp;
        begin++;
        end--;
    }
    revBuffer[length] = 0;
    return revBuffer;
}
// pali evaluation


