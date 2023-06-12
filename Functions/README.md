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


