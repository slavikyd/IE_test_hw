#!/bin/bash

# скрипт для запуска тестов

for file in `find tests/ -name 'test_*.sh'`
do
    chmod +x $file
    bash $file
done