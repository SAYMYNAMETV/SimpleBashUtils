NAME 			:=s21_grep
CC					:=gcc
CFLAGS			:=-pedantic -Wall -Werror -Wextra -std=c11
SRC					:=$(NAME).c
HEADER			:=$(NAME).h

all: s21_grep

info:
					@echo "Available make targets:"
					@echo "s21_grep: 	for compilations project"
					@echo "test:		for compilations project and then for the test"
					@echo "clean:		for clean test and project"
					@echo "re:		for rebuid project"

s21_grep: $(NAME).c $(NAME).h
					$(CC) $(CFLAGS) $(SRC) -o $(NAME)

test:
					$(MAKE) s21_grep
					sh grep_test.sh

clean:
					rm -rf $(NAME) test.txt results/ patterns.txt
					clear

re:
					$(MAKE) clean
					$(MAKE) all