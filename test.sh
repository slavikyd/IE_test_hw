#!/bin/bash
test_file=$1

chmod +x $test_file

echo "Test for arguments started"
./$test_file > /dev/null
testOut=`echo $?`
if [[ $testOut -eq 1 ]]
then
    echo "Test passed"
else
    echo "Test failed"
    exit 1
fi

echo "Main test started"
input_file=test_inp.txt
output_file=output.txt
chmod +x HW_1.sh
 ./HW_1.sh -i test_inp.txt -o output.txt -- 1

testOut=`grep -c "Четные числа" output.txt`
counter=0
if [[ $testOut -ne 0 ]]
then
    for line in $(cat output.txt)
    do
        if [[ $(($line+1)) -eq 0 ]]
        then
            counter=$((counter+1))
        fi
    done
    if [[ $counter -ge 1 ]]
    then
        echo "Main test passed"
        exit 0
    fi


elif [[ $testOut -eq 0 ]]
then
    testOut=`grep -c "Нечетные числа" output.txt`
    if [[ $testOut -ne 0 ]]
    then
    for line in $(cat output.txt)
    do
        if [[ $(($line+1)) % 2 -gt 0 ]]
        then
            counter=$((counter+1))
        fi
    done
    if [[ $counter -ge 1 ]]
    then
        echo "Main test passed"
        exit 0
    fi
    fi
fi

