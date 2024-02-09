#ifndef _SRC_S21_GREP_H_
#define _SRC_S21_GREP_H_

#define BUFF_SIZE 10000

#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  int e, i, v, c, l, n;
} Options;

void flagsParser(int argc, char* argv[], Options* opt, char* patternE);
void s21Grep(Options* opt, int argc, char* argv[], char* buff);
void s21GrepFile(Options* opt, char* pattern, char* filename);
void outline(Options* opt, FILE* fp, regex_t re, char* file);

#endif  // _SRC_S21_GREP_H_
