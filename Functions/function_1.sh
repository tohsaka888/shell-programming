# #!/bin/sh

# add_user()
# {
#     USERNAME=$1
#     PASSWORD=$2
#     shift;shift

#     COMMENT=$@
#     echo "adduser -u" $USERNAME "-p" $PASSWORD "-c" $COMMENT
#     echo "passwd" $USERNAME $PASSWORD
# }

# echo "Start of Script"
# add_user tohsaka888 swy156132264 came from czu
# add_user u1 u1 user1
# add_user u2 u2 user2
# add_user u3 u3 user3
# echo "End of Script"



#!/bin/sh

echo "Script Start!!!"

judge_your_grade()
{
    SCORE=$1
    if [[ $SCORE -ge 90 && $SCORE -le 100 ]]; then
        echo "A"
    elif [[ $SCORE -ge 80 && $SCORE -lt 90 ]]; then
        echo "B"
    elif [[ $SCORE -ge 70 && $SCORE -lt 80 ]]; then
        echo "C"
    elif [[ $SCORE -ge 60 && $SCORE -lt 70 ]]; then
        echo "D"
    else
        echo "Not Pass!"
    fi
}

GRADE=`judge_your_grade 99`
echo $GRADE