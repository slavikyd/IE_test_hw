#!/bin/bash

function help_message {
    echo "-i: Файл с числами"
    echo "-o: Файл, в который будет записан результат"
    echo "--"
    echo "1/0: проверить все четные/нечетные числа."
    exit 1
}

if [[ ! -n $1 ]]
then
    help_message
fi

output_file=""
input_file=""

while [[ -n $1 ]]
do
    case $1 in
        -i) input_file=$2
            shift;;
        -o) output_file=$2
            shift;;
        --) shift
            break;;
        *) help_message
           exit 1;;
    esac
    shift
done
if [[ ! -f $input_file || $output_file == "" ]] || [[ ! -n $1 || $1 -ne 1 && $1 -ne 0 ]]
then
    help_message
fi

if [[ $1 -eq 1 ]]
then
    echo "Четные числа" > $output_file
else
    echo "Нечетные числа" > $output_file
fi

for num in `cat $input_file`
do
    res=$(($num%2))
    if [[ $1 -eq 1 && res -eq 0 ]] || [[ $1 -eq 0 && res -ne 0 ]]
    then
        echo $num
    fi
done >> $output_file
