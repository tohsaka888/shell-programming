# Functions

A function may return a value in one of four different ways:

- Change the state of a variable or variables
- Use the exit command to end the shell script
- Use the return command to end the function, and return the supplied value to the calling section of the shell script
- echo output to stdout, which will be caught by the caller just as c=`expr $a + $b` is caught 

This is rather like C, in that exit stops the program, and return returns control to the caller. The difference is that a shell function cannot change its parameters, though it can change global parameters.

## Scope of Variables

Programmers used to other languages may be surprised at the scope rules for shell functions. Basically, there is no scoping, other than the parameters (`$1`, `$2`, `$@`, etc).

We can't modify the value of function parameters,but we can modify the value of global parameters.

```shell
#!/bin/sh

myfunc()
{
  echo "\$1 is $1"
  echo "\$2 is $2"
  # cannot change $1 - we'd have to say:
  # 1="Goodbye Cruel"
  # which is not a valid syntax. However, we can
  # change $a:
  a="Goodbye Cruel"
}

### Main script starts here 

a=Hello
b=World
myfunc $a $b
echo "a is $a"
echo "b is $b"
```

## Recursion

Functions can be recursive - here's a simple example of a factorial function:

```shell
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
```

## Libary

As promised, we will now briefly discuss using libraries between shell scripts. These can also be used to define common variables, as we shall see.


## Return Codes

return codes must be numeric argument.

## 补充

在 shell 脚本中，反引号或者 `$()` 符号用于命令替换。它们的作用是将一条命令的输出作为字符串返回，然后可以将该字符串赋值给变量或者直接在命令中使用。

例如，下面的命令将当前目录下所有的文件名赋值给变量 `files`：
```shell
files=`ls`
```
或者使用 `$()` 符号：
```shell
files=$(ls)
```
在这个例子中，`ls` 命令列出了当前目录下的所有文件名，反引号或者 `$()` 符号将其输出作为字符串返回，然后赋值给变量 `files`。

需要注意的是，反引号在 `shell` 脚本中的使用已经被 `$()` 符号所取代。因为 `$()` 符号更容易阅读和理解，并且可以嵌套使用。