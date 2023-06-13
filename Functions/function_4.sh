#!/bin/sh

factorial()
{
    if [ "$1" -gt "1" ]; then
        i=`expr $1 - 1`
        j=`factorial $i`
        echo `expr $1 \* $j`
    else
        echo 1
    fi
}


while :
do
    echo "Enter a number(Input bye to exit):"
    read x
    if [ $x = "bye" ]; then
        exit
    fi
    factorial $x
done