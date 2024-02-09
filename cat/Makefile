NAME 			:=s21_cat
CC					:=gcc
CFLAGS			:=-pedantic -Wall -Werror -Wextra -std=c11
SRC					:=$(NAME).c
HEADER			:=$(NAME).h
TESTFILE			:=test_for_s21_cat.sh

all: s21_cat

info:
					@echo "Available make targets:"
					@echo "s21_cat: 	for compilations project"
					@echo "test:		for the test"
					@echo "clean:		for clean test and project"
					@echo "re:		for rebuid project"

s21_cat: $(SRC) $(HEADER)
					$(CC) $(CFLAGS) $(SRC) -o $(NAME)

test:	$(NAME)
					sh $(TESTFILE)

clean:
					rm -rf $(NAME) logs/ sample.txt

re:
					$(MAKE) clean
					$(MAKE) all