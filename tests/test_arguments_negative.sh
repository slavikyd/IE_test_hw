#!/bin/bash

input_file=tests/data/input.txt
output_file=fake_output

echo "---Запущен тест Аргументов(-) ---"

chmod +x HW_1.sh
./HW_1.sh > /dev/null

if [[ $? -eq 1 ]]
then
    echo "Тест №1 пройден!"
else
    echo "Тест №1 провален :("
    echo "Входные аргументы: ПУСТО"
    exit 1
fi

./HW_1.sh 1 -- -i aboba -o test_output > /dev/null

if [[ $? -eq 1 ]]
then
    echo "Тест №2 пройден!"
else
    echo "Тест №2 провален :("
    echo "Входные аргументы: -i aboba -o"
    exit 1
fi

for (( i = 2; i < 100; i++ ))
do    
    ./HW_1.sh -i $input_file -o $output_file -- $i > /dev/null
    test_num=$(($i+1))
    if [[ ! -f $output_file ]]
    then
        echo "Тест №$test_num пройден!"
    else
        echo "Тест №$test_num провален :("
        echo "Входные аргументы: -i $input_file -o $output_file -- $i"
        rm -rf $output_file
        exit 1
    fi
done