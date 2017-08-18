#!/bin/bash

input_file="$1"
output_file="$2"
mypath=$(pwd)

function printFile {
	result=$(cat $mypath/$1)
	printf '%s\n' "${result[@]}"
	printf '\n'
}

echo "->Counting words using analyseGrLa"
echo "awk -f $mypath/analyseGrLa $mypath/$input_file > $mypath/$output_file"
echo "->Generating output"
awk -f $mypath/analyseGrLa $mypath/$input_file > $mypath/$output_file
printFile $output_file
