# SimpleBashUtils

This repository contains simple implementations of Unix utilities written in C.

## Projects

* `cat` – Implementation of the `cat` command with support for common flags.
* `grep` – Implementation of the `grep` command with a subset of options.

## Building

Run `make` inside the `cat` or `grep` directories to build each utility.

```bash
cd cat && make
cd ../grep && make
```

## Testing

Each project includes a simple test script:

```bash
cd cat && bash test_for_s21_cat.sh
cd ../grep && bash grep_test.sh
```

These tests compare program output with the system `cat` or `grep`.
