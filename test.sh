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

testOut=`cat output.txt`
for line in testOut
do
    if [[ $line == "Четные числа" ]]
    then
        echo "Test passed"
    else
        echo "Test failed"
        exit 1
    fi
done
