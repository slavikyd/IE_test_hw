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
./$test_file test_inp.txt output.txt > /dev/null
echo "1"
testOut=`cat output.txt`
if [[ $testOut -eq 5 ]]
then
    echo "Test passed"
else
    echo "Test failed"
    exit 1
fi
