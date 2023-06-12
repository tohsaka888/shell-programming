# #!/bin/sh
# echo -en "What is your name [ `whoami` ] "
# read myname
# # -z 检查字符串是否为空
# if [ -z "$myname" ]; then
#   myname=`whoami`
# fi
# echo "Your name is : $myname"

#!/bin/sh
echo -en "What is your name [ `whoami` ] "
read myname
# Warning: 不能加空格！！！！
echo "Your name is: ${myname:="Hello,World"}"