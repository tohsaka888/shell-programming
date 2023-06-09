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