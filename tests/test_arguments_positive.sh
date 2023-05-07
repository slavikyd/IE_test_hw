#!/bin/bash

input_file=tests/data/input.txt
output_file=output

echo "---Запущен тест Аргументов(+) ---"

chmod +x HW_1.sh
./HW_1.sh -i $input_file -o $output_file -- 1 > /dev/null

if [[ -f $output_file ]]
then
    echo "Тест №1 пройден!"
    rm -rf output
else
    echo "Тест №1 провален :("
    echo "Входные данные: -i $input_file -o $output_file -- 1"
    exit 1
fi

./HW_1.sh -o $output_file -i $input_file -- 1 > /dev/null

if [[ -f $output_file ]]
then
    echo "Тест №2 пройден!"
    rm -rf output
else
    echo "Тест №2 провален :("
    echo "Входные данные: -o $output_file -i $input_file -- 1"
    exit 1
fi
