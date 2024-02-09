#include "s21_grep.h"

int main(int argc, char* argv[]) {
  Options opt = {0};
  char pattern[BUFF_SIZE] = {0};
  flagsParser(argc, argv, &opt, pattern);
  if (argc >= 3) {
    s21Grep(&opt, argc, argv, pattern);
  }

  return 0;
}

void flagsParser(int argc, char* argv[], Options* opt, char* pattern) {
  int flags;
  while ((flags = getopt(argc, argv, "e:ivcln")) != -1) {
    switch (flags) {
      case 'e':
        opt->e = 1;
        snprintf(pattern, BUFF_SIZE, "%s", optarg);
        break;
      case 'i':
        opt->i = 1;
        break;
      case 'v':
        opt->v = 1;
        break;
      case 'c':
        opt->c = 1;
        break;
      case 'l':
        opt->l = 1;
        break;
      case 'n':
        opt->n = 1;
        break;
      default:
        exit(1);
        break;
    }
  }
}

void s21Grep(Options* opt, int argc, char* argv[], char* buff) {
  char pattern[BUFF_SIZE] = {0};
  if (!opt->e) {
    snprintf(pattern, BUFF_SIZE, "%s", argv[optind++]);
  }
  if (opt->e) {
    snprintf(pattern, BUFF_SIZE, "%s", buff);
  }
  int fileCount = 0;
  if (argc - optind > 1) {
    fileCount = 1;
  }
  for (int i = optind; i < argc; i++) {
    if (fileCount && !opt->l) {
      printf("%s:", argv[i]);
    }
    s21GrepFile(opt, pattern, argv[i]);
  }
}

void s21GrepFile(Options* opt, char* pattern, char* filename) {
  regex_t re;
  int cflags = REG_EXTENDED;
  FILE* file;
  file = fopen(filename, "r");
  if (opt->i) {
    cflags = REG_ICASE;
  }

  if (file != NULL) {
    regcomp(&re, pattern, cflags);
    outline(opt, file, re, filename);
    regfree(&re);
    fclose(file);
  } else {
    fprintf(stderr, "Error opening file: %s\n", filename);
  }
}

void outline(Options* opt, FILE* fp, regex_t re, char* file) {
  char text[BUFF_SIZE] = {0};
  regmatch_t pmatch[1];
  int lineMatches = 0, nline = 1;
  while (fgets(text, BUFF_SIZE - 1, fp) != NULL) {
    int match = 0;
    int result = regexec(&re, text, 1, pmatch, 0);
    if (strchr(text, '\n') == NULL) {
      strcat(text, "\n");
    }
    if (result == 0 && !opt->v) {
      match = 1;
    }
    if (result == REG_NOMATCH && opt->v) {
      match = 1;
    }
    if (match && !opt->l && !opt->c && opt->n) {
      printf("%d:", nline);
    }
    if (match && !opt->l && !opt->c) {
      printf("%s", text);
    }
    lineMatches += match;
    nline++;
  }
  if (opt->c && opt->l) {
    printf("%d\n", lineMatches);
  }
  if (opt->l && lineMatches > 0) {
    printf("%s\n", file);
  }
  if (opt->c && !opt->l) {
    printf("%d\n", lineMatches);
  }
}
