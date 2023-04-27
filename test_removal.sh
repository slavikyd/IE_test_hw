#!/bin/bash
filename=file

echo "Запущен тест удаления файла"
if [[ ! -f $filename ]]
then
    touch $filename
fi

chmod +x file_remover.sh
./file_remover.sh $filename

if [[ ! -f $filename ]]
then
    echo "$filename успешно удален, тест пройден"
    exit 0
else
    echo "Файл $filename не удален:("
    exit 1
    rm $filename
fi
