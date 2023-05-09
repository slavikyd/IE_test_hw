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
./HW_1.sh -i $input_file -o $output_file -- 1 > /dev/null

testOut=`cat output.txt`
if [[ $testOut -eq 5 ]]
then
    echo "Test passed"
else
    echo "Test failed"
    exit 1
fi
