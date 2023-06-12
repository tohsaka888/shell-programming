#!/bin/sh

add_user()
{
    USERNAME=$1
    PASSWORD=$2
    shift;shift

    COMMENT=$@
    echo "adduser -u" $USERNAME "-p" $PASSWORD "-c" $COMMENT
    echo "passwd" $USERNAME $PASSWORD
}

echo "Start of Script"
add_user tohsaka888 swy156132264 came from czu
add_user u1 u1 user1
add_user u2 u2 user2
add_user u3 u3 user3
echo "End of Script"