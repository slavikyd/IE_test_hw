#!/bin/bash
input_file=tests/data/input.txt
output_file=output.txt

echo "---Запущен тест поиска четных чисел---"

chmod +x HW_1.sh
./HW_1.sh -i $input_file -o $output_file -- 1 > /dev/null

if [[ `grep -w Четные $output_file` != "" ]]
then
    echo "Тест №1 пройден!"
else
    echo "Тест №1 провален :("
    echo "Строка - 'Четные числа' не найдена"
    exit 1
fi

all_nums=0

for num in `awk 'NR!=1' $output_file`
do
    res=$(($num%2))
    if [[ $res -ne 0 ]]
    then
        echo "Тест №2 провален :("
        echo "$num - нечетное число"
        exit 1
    fi
    all_nums=$(($all_nums+1))
done

if [[ $all_nums -ne 5 ]]
then
    echo "Тест №2 провален :("
    echo "$all_nums - всего чисел в $output_file, хотя должно быть 5"
else
    echo "Тест №2 пройден!"
fi

rm -rf $output_file
