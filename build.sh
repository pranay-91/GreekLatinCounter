#!/bin/bash

mydir=$(pwd)

function printFile {
	result=$(cat $mydir/$1)
	printf '%s\n' "${result[@]}"
	printf '\n'
}

function printTail { 
	result=$(tail $mydir/$1)
        printf '%s\n' "${result[@]}"
	printf '\n'
}

echo "->Reading build-awk regular expressions."
printFile build-awk

echo "->Generating analyseGrLa.."
sed -Ef $mydir/build-awk $mydir/roots-in-English-from-Wikipedia-simple.txt > $mydir/analyseGrLa

echo "->Appending END awk commands..."
cat $mydir/end-awk >> $mydir/analyseGrLa
printTail analyseGrLa

echo "->Testing awk using test_english.data..."
awk -f $mydir/analyseGrLa $mydir/test_english.data > $mydir/test_out.data
printFile test_out.data
