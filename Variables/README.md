# Shell Programming Part01 - Variables

## Define a variable

```shell
#!/bin/sh
MY_MESSAGE="Hello World!"
echo $MY_MESSAGE
```

In this case,we defined a variable called `MY_MESSAGE`,it's value is `"Hello World!"`.

- There must be no spaces around the "=" sign: `VAR=value` works; `VAR = value` doesn't work.
- A variable can only hold one value.

## Read a value from shell

We can use the shell-builtin command `read` which reads a line from standard input into the variable supplied.

```shell
#!/bin/sh
echo What is your name?
read MY_NAME
echo "Hello $MY_NAME - hope you're well."
```

## Scope of Variables

When we run `scope_of_variables.sh` from interactive shell, a new shell is spawned to run the script. This is because of the `#!/bin/sh` line at the start of the script.

We need to export the variable for it to be inherited by another program - including a shell script.

```shell
$ MYVAR="Hello"
$ export MYVAR
$ ./scope_of_variables.sh
MYVAR is: hello
MYVAR is: hi there
```

Now look at line 3 of the script: we change the value of `MYVAR`,but when we echo `MYVAR` in the shell,the value of `MYVAR` doesn't change.

```shell
$ echo $MYVAR
Hello
```

Once the shell script exits, its environment is **destroyed**. But `MYVAR` keeps its value of `Hello` within your **interactive** shell.

In order to receive environment changes back from the script, we must source the script - this effectively runs the script within our own interactive shell, instead of spawning another shell to run it.

We can source a script via the `.` (dot) command:

```shell
$ MYVAR=hello
$ echo $MYVAR
hello
$ . ./myvar2.sh
MYVAR is: hello
MYVAR is: hi there
$ echo $MYVAR
hi there
```

This is how our `.profile` or `.bash_profile` works, for example.

## Split a variable from texts

```shell
#!/bin/sh
echo "What is your name?"
read USER_NAME
echo "Hello $USER_NAME"
echo "I will create you a file called $USER_NAME_file"
touch $USER_NAME_file
```

In this case,shell don't know where the variable ends and the rest starts. 

To fix it,we need use `{}` to split a variable from texts.

```shell
#!/bin/sh
echo "What is your name?"
read USER_NAME
echo "Hello $USER_NAME"
echo "I will create you a file called ${USER_NAME}_file"
touch "${USER_NAME}_file"
```

## Array

在 shell 脚本中，可以使用以下语法定义数组：

```
my_array=(element1 element2 element3 ...)
```

其中，`my_array` 是数组名，`element1`、`element2`、`element3` 等是数组元素，可以是字符串、数字或者其他类型的值。如果数组元素中包含空格或其他特殊字符，需要使用引号将其括起来。

例如，下面的代码定义了一个名为 `my_array` 的数组，包含了三个字符串元素：

```
my_array=("apple" "banana" "orange")
```

定义数组后，可以通过 `${my_array[index]}` 的方式获取数组中指定位置的元素，其中 `index` 是元素的索引，从 0 开始计数。例如，`${my_array[0]}` 会返回数组中的第一个元素 `"apple"`。

还可以使用 `${my_array[@]}` 获取数组中的所有元素，`${#my_array[@]}` 获取数组的长度，以及 `${!my_array[@]}` 获取数组中所有元素的索引。