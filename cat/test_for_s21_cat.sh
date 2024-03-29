#!/bin/bash

echo "


first
second



 
	 seven

" > sample.txt

failed_tests=0
passed_tests=0

mkdir -p logs

# Тесты с флагом -n

for test_file in *.txt; do

  cat -n $test_file > logs/cat_n.txt

  ./s21_cat -n $test_file > logs/s21_cat_n.txt

  diff logs/cat_n.txt logs/s21_cat_n.txt

  if [ $? -ne 0 ]; then
    echo "\033[91m=== Flag: -n ===\033[0m"
    failed_tests=$((failed_tests + 1))
  else
    echo "\033[92mPassed:\033[32m \033[91m-n\033[0m"
    passed_tests=$((passed_tests + 1))
  fi

done

# Тесты с флагом -b

for test_file in *.txt; do

  cat -b $test_file > logs/cat_b.txt

  ./s21_cat -b $test_file > logs/s21_cat_b.txt

  diff logs/cat_b.txt logs/s21_cat_b.txt

  if [ $? -ne 0 ]; then
    echo "\033[91m=== Flag: -b ===\033[0m"
    failed_tests=$((failed_tests + 1))
  else
    echo "\033[92mPassed:\033[32m \033[91m-b\033[0m"
    passed_tests=$((passed_tests + 1))
  fi

done

# Тесты с флагом -e

for test_file in *.txt; do

  cat -e $test_file > logs/cat_e.txt

  ./s21_cat -e $test_file > logs/s21_cat_e.txt

  diff logs/cat_e.txt logs/s21_cat_e.txt

  if [ $? -ne 0 ]; then
    echo "\033[91m=== Flag: -e ===\033[0m"
    failed_tests=$((failed_tests + 1))
  else
    echo "\033[92mPassed:\033[32m \033[91m-e\033[0m"
    passed_tests=$((passed_tests + 1))
  fi

done

# Тесты с флагом -t

for test_file in *.txt; do

  cat -t $test_file > logs/cat_t.txt

  ./s21_cat -t $test_file > logs/s21_cat_t.txt

  diff logs/cat_t.txt logs/s21_cat_t.txt

  if [ $? -ne 0 ]; then
    echo "\033[91m=== Flag: -t ===\033[0m"
    failed_tests=$((failed_tests + 1))
  else
    echo "\033[92mPassed:\033[32m \033[91m-t\033[0m"
    passed_tests=$((passed_tests + 1))
  fi

done

# Тесты с флагом -s

for test_file in *.txt; do

  cat -s $test_file > logs/cat_s.txt

  ./s21_cat -s $test_file > logs/s21_cat_s.txt

  diff logs/cat_s.txt logs/s21_cat_s.txt

  if [ $? -ne 0 ]; then
    echo "\033[91m=== Flag: -s ===\033[0m"
    failed_tests=$((failed_tests + 1))
  else
    echo "\033[92mPassed:\033[32m \033[91m-s\033[0m"
    passed_tests=$((passed_tests + 1))
  fi

done

# Тесты с флагом --number-nonblank

for test_file in *.txt; do

  cat --number-nonblank $test_file > logs/cat_-number-nonblank.txt

  ./s21_cat --number-nonblank $test_file > logs/s21_cat_-number-nonblank.txt

  diff logs/cat_-number-nonblank.txt logs/s21_cat_-number-nonblank.txt

  if [ $? -ne 0 ]; then
    echo "\033[91m=== Flag: --number-nonblank ===\033[0m"
    failed_tests=$((failed_tests + 1))
  else
    echo "\033[92mPassed:\033[32m \033[91m--number-nonblank\033[0m"
    passed_tests=$((passed_tests + 1))
  fi

done

# Тесты с флагом --number

for test_file in *.txt; do

  cat --number $test_file > logs/cat_-number.txt

  ./s21_cat --number $test_file > logs/s21_cat_-number.txt

  diff logs/cat_-number.txt logs/s21_cat_-number.txt

  if [ $? -ne 0 ]; then
    echo "\033[91m=== Flag: --number ===\033[0m"
    failed_tests=$((failed_tests + 1))
  else
    echo "\033[92mPassed:\033[32m \033[91m--number\033[0m"
    passed_tests=$((passed_tests + 1))
  fi

done

# Тесты с флагом --squeeze-blank

for test_file in *.txt; do

  cat --squeeze-blank $test_file > logs/cat_-squeeze-blank.txt

  ./s21_cat --squeeze-blank $test_file > logs/s21_cat_-squeeze-blank.txt

  diff logs/cat_-squeeze-blank.txt logs/s21_cat_-squeeze-blank.txt

  if [ $? -ne 0 ]; then
    echo "\033[91m=== Flag: --squeeze-blank ===\033[0m"
    failed_tests=$((failed_tests + 1))
  else
    echo "\033[92mPassed:\033[32m \033[91m--squeeze-blank\033[0m"
    passed_tests=$((passed_tests + 1))
  fi

done

# Тесты с флагом -bn

for test_file in *.txt; do

  cat -bn $test_file > logs/cat_bn.txt

  ./s21_cat -bn $test_file > logs/s21_cat_bn.txt

  diff logs/cat_bn.txt logs/s21_cat_bn.txt

  if [ $? -ne 0 ]; then
    echo "\033[91m=== Flag: -bn ===\033[0m"
    failed_tests=$((failed_tests + 1))
  else
    echo "\033[92mPassed:\033[32m \033[91m-bn\033[0m"
    passed_tests=$((passed_tests + 1))
  fi

done

# Тесты с флагом -bnest

for test_file in *.txt; do

  cat -bnest $test_file > logs/cat_bnest.txt

  ./s21_cat -bnest $test_file > logs/s21_cat_bnest.txt

  diff logs/cat_bnest.txt logs/s21_cat_bnest.txt

  if [ $? -ne 0 ]; then
    echo "\033[91m=== Flag: -bnest ===\033[0m"
    failed_tests=$((failed_tests + 1))
  else
    echo "\033[92mPassed:\033[32m \033[91m-bnest\033[0m"
    passed_tests=$((passed_tests + 1))
  fi

done

# Тесты с флагом -st

for test_file in *.txt; do

  cat -st $test_file > logs/cat_st.txt

  ./s21_cat -st $test_file > logs/s21_cat_st.txt

  diff logs/cat_st.txt logs/s21_cat_st.txt

  if [ $? -ne 0 ]; then
    echo "\033[91m=== Flag: -st ===\033[0m"
    failed_tests=$((failed_tests + 1))
  else
    echo "\033[92mPassed:\033[32m \033[91m-st\033[0m"
    passed_tests=$((passed_tests + 1))
  fi

done

# Тесты с флагом -et

for test_file in *.txt; do

  cat -et $test_file > logs/cat_et.txt

  ./s21_cat -et $test_file > logs/s21_cat_et.txt

  diff logs/cat_et.txt logs/s21_cat_et.txt

  if [ $? -ne 0 ]; then
    echo "\033[91m=== Flag: -et ===\033[0m"
    failed_tests=$((failed_tests + 1))
  else
    echo "\033[92mPassed:\033[32m \033[91m-et\033[0m"
    passed_tests=$((passed_tests + 1))
  fi

done

echo "\033[92mPassed: $passed_tests\033[32m ✅"
echo "\033[91mFailed: $failed_tests\033[0m ❌"

