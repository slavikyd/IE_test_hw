#!/bin/bash
filename=file

chmod +x file_creator.sh
./file_creator.sh $filename

if [[ -f $filename ]]
then
    echo "Файл $filename существует"
    rm $filename
    exit 0
else
    echo "Файл $filename отсутствует в папке"
    exit 1
fi