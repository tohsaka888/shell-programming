# Variable Part 2

The first set of variables we will look at are `$0 .. $9` and `$#`.
我们要看的第一组变量是`$0 ..$9`和`$#`。

`$1 .. $9` are the first 9 additional parameters the script was called with.
`$1 .. $9`是调用脚本时附加的前9个参数。

The variable `$@` is all parameters.
变量`$@`是指所有参数。

The variable `$*`, is similar, but does not preserve any whitespace, and quoting, so "File with spaces" becomes "File" "with" "spaces".
变量`$*`与此类似，但不保留任何空格和引号，因此"File with spaces"变成"File" "with" "spaces"。

`$#` is the number of parameters the script was called with.
`$#`代表了这个脚本调用了多少个变量。

Note that the value of `$0` changes depending on how the script was called. The external utility basename can help tidy this up.
请注意，`$0`的值根据脚本的调用方式而变化。外部实用程序basename可以帮助整理这一点。

We can take more than 9 parameters by using the `shift` command;look at the script below:
我们可以使用`shift`命令获取9个以上的参数;请看下面的脚本:

```shell
#!/bin/sh
while [ "$#" -gt "0" ]
do
  echo "\$1 is $1"
  shift
done              
```

This script keeps on using shift until $# is down to zero, at which point the list is empty.
该脚本将继续使用`shift`，直到`$#`变为`0`，此时列表为空。

Another special variable is $?. This contains the exit value of the last run command.
另一个特殊变量是`$?`包含上次运行命令的退出值。

It can help us to verify the code whether run correctly.If correct,it should return with the value of 0,otherwise,it may have some error.
它可以帮助我们验证代码是否正确运行。如果正确，它应该返回0，否则，它可能有一些错误。



