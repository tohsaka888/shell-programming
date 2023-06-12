#!/bin/sh

echo "Please talk to me:...."

while :
do
    read INPUT_STRING
    case $INPUT_STRING in
        hello)
            echo "Hello,yourself."
        ;;
        bye)
            echo "Bye!"
            # break is jump out the loop
            # if you want finish immediately,use `exit` instead.
            break
        ;;
        # same as default in c
        *)
            echo "Sorry,i can't understand!"
        ;;
    esac
done

echo
echo "That's all folks!"