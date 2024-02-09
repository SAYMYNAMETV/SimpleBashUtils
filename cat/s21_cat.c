#include "s21_cat.h"

int main(int argc, char *argv[]) {
  options flags = {0};
  int error = 0;

  parser(argc, argv, &flags, &error);

  if (error == 1) {
    fprintf(stderr, "OK");
  } else {
    while (optind < argc) {
      char *path = argv[optind];
      file_reader(path, flags);
      optind++;
    }
  }

  return 0;
}

int parser(int argc, char *argv[], options *flag, int *error) {
  int c = 0;

  while ((c = getopt_long(argc, argv, "beEnstTv", long_options, NULL)) != -1) {
    switch (c) {
      case 'b':
        flag->b = 1;
        break;
      case 'e':
        flag->e = 1;
        flag->v = 1;
        break;
      case 'E':
        flag->e = 1;
        break;
      case 'n':
        flag->n = 1;
        break;
      case 's':
        flag->s = 1;
        break;
      case 't':
        flag->t = 1;
        flag->v = 1;
        break;
      case 'T':
        flag->t = 1;
        break;
      case 'v':
        flag->v = 1;
        break;
      default:
        *error = 1;
        break;
    }
  }
  return optind;
}

void file_reader(char *path, options flag) {
  file_access(path);
  FILE *file;
  file = fopen(path, "r");

  flags_true(file, flag);

  fclose(file);
}

void file_access(char *path) {
  if (access(path, R_OK)) {
    printf("No such file or directory.\n");
    exit(1);
  }
}

void flags_true(FILE *file, options flag) {
  int ch, prev, current_line = 1, squeeze = 0;

  for (prev = '\n'; (ch = getc(file)) != EOF; prev = ch) {
    if (flag.s == 1) {
      if (ch == '\n' && prev == '\n') {
        if (squeeze == 1) {
          continue;
        }
        squeeze++;
      } else
        squeeze = 0;
    }
    if (flag.n == 1 && flag.b == 0 && prev == '\n') {
      printf("%6d\t", current_line);
      current_line++;
    }
    if (flag.b == 1 && (prev == '\n' && ch != '\n')) {
      printf("%6d\t", current_line);
      current_line++;
    }
    if (flag.e == 1 && ch == '\n') putchar('$');
    if (flag.t == 1 && ch == '\t') {
      printf("^");
      ch = 'I';
    }
    if (flag.v == 1) {
      if ((ch >= 0 && ch <= 31) && ch != '\t' && ch != '\n') {
        printf("^");
        ch += 64;
      } else if (ch == 127) {
        printf("^");
        ch = '?';
      } else if ((ch >= 128 && ch < 128 + 32) && ch != '\t' && ch != '\n') {
        printf("M-^");
        ch -= 64;
      }
    }
    putchar(ch);
  }
}