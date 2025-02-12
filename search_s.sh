#!/bin/bash
echo "$0 [filename(s)] [string] [timeout] [out]"

if [[ $4 == "" ]]; then
exit
elif [[ -e $4 ]]; then
echo $4 exist
exit
elif [[ -e $4.tmp ]]; then
echo $4.tmp exist
exit
fi

while read line
do

echo $line
timeout $3 cat $line | grep -a -n -e $2 > $4.tmp
if [[ $? != 0 ]]; then
echo skip.
else
echo in $line: >> $4
cat $4.tmp >> $4
fi

done < $1
rm $4.tmp
echo done.
