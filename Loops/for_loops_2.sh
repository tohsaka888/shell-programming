#!/bin/sh
# \是必须的，如果这里不添加转义字符，通配符将会匹配当前路径下的所有文件并输出
for i in hello 1 \* 2 goodbye 
do
  echo "Looping ... i is set to $i"
done