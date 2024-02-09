#!/bin/bash

cat > test.txt << EOF
This is a test file
It contains some lines
Some of them match a pattern
Others do not
EOF

cat > patterns.txt << EOF
test
pattern
EOF

original_grep_output="" 
s21_grep_output="" 
correct_tests=0 
total_tests=0 

mkdir results

compare_outputs () {
  ((total_tests++))
  local test_number=$total_tests 

  echo "$original_grep_output" > "results/original_grep_test_$test_number.txt"
  echo "$s21_grep_output" > "results/s21_grep_test_$test_number.txt"

if diff "results/original_grep_test_$test_number.txt" "results/s21_grep_test_$test_number.txt"; then
    ((correct_tests++))
    echo "Test passed: $@"
    else
    echo "Test failed: $@"
    echo "Diff between outputs:"
    diff "results/original_grep_test_$test_number.txt" "results/s21_grep_test_$test_number.txt"
fi
}

run_test () {
  local param="$1"
  shift

  original_grep_output="$(grep "$param" "$@" test.txt)"
  s21_grep_output="$(./s21_grep "$param" "$@" test.txt)"

  compare_outputs "$param" "$@"
}

run_test -e pattern
run_test -i SOME
run_test -v "match a pattern"
run_test -c pattern
run_test -l pattern
run_test -n pattern

echo "Всего тестов: $total_tests"
echo "\033[92mТесты без ошибок: $correct_tests\033[32m ✅"
