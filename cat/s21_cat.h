#ifndef _S21_CAT_H_
#define _S21_CAT_H_

#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

typedef struct {
  int b;
  int e;
  int n;
  int s;
  int t;
  int v;
} options;

struct option long_options[] = {{"number", no_argument, 0, 'n'},
                                {"number-nonblank", no_argument, 0, 'b'},
                                {"squeeze-blank", no_argument, 0, 's'},
                                {0, 0, 0, 0}};

void file_reader(char *path, options flag);
int parser(int argc, char *argv[], options *flag, int *error);
void file_access(char *path);
void flags_true(FILE *file, options flag);

#endif  // _S21_CAT_H_