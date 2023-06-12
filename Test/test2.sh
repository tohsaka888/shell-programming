#!/bin/sh
X=0
# 当字符串X不为空时
while [ -n "$X" ]
do
  echo "Enter some text (RETURN to quit)"
  read X
  if [ -n "$X" ]
    echo "Exit!"
  else
    echo "You said: $X"
  fi
done