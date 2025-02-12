#!/bin/bash
echo $0 [dir] [out]

if [[ $2 == "" ]]; then
exit
elif [[ -e $2 ]]; then
echo $2 exist
exit
fi

abs_p=$(realpath $1)

find $abs_p > $2
