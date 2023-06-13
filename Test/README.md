# Test

Test is used by virtually every shell script written. It may not seem that way, because test is not often called directly. test is more frequently called as `[`. `[` is a symbolic link to test, just to make shell programs more readable. It is also normally a shell builtin (which means that the shell itself will interpret `[` as meaning test, even if your Unix environment is set up differently)

```bash
$ type [
[ is a shell builtin
$ which [
/usr/bin/[
$ ls -l /usr/bin/[
lrwxrwxrwx 1 root root 4 Mar 27 2000 /usr/bin/[ -> test
$ ls -l /usr/bin/test
-rwxr-xr-x 1 root root 35368 Mar 27  2000 /usr/bin/test
```

This means that `'['` is **actually a program**, just like `ls` and other programs, so **it must be surrounded by spaces**:

```shell
if [$foo = "bar" ]
```

It will not work.It is interpreted as `if test$foo = "bar" ]`, which is a `']'` without a beginning `'['`. **Put spaces around all your operators**. I've highlighted the mandatory spaces with the word 'SPACE' - replace 'SPACE' with an actual space; if there isn't a space there, it won't work:

```shell
if SPACE [ SPACE "$foo" SPACE = SPACE "bar" SPACE ]
```

```shell
if [ "$foo" = "bar" ]
```

> Note: Some shells also accept `"=="` for string comparison; this is not portable, a single `"="` **should be used for strings**, or "-eq" for integers.

Test is a simple but powerful comparison utility. For full details, run `man test` on your system, but here are some usages and typical examples.

Test is most often invoked indirectly via the `if` and `while` statements. It is also the reason you will come into difficulties if you create a program called test and try to run it, as this shell builtin will be called instead of your program!

> DON'T MAKE ANY PROGRAM NAMED TEST!!!

The syntax for `if...then...else...` is:

```shell
# NOTE SPACES
if [ ... ]
then
  # if-code
else
  # else-code
fi
```

Note that `fi` is `if` backwards! This is used again later with `case` and `esac`.

Also, be aware of the syntax - the `"if [ ... ]"` and the `"then"` commands **must be on different lines**. Alternatively, the semicolon `";"` can separate them:

```shell
if [ ... ]; then
  # do something
fi
```

You can also use the `elif`, like this:

```shell
if  [ something ]; then
 echo "Something"
 elif [ something_else ]; then
   echo "Something else"
 else
   echo "None of the above"
fi
```

This will echo `"Something"` if the `[ something ]` test succeeds, otherwise it will test `[ something_else ]`, and echo `"Something else"` if that succeeds. If all else fails, it will echo `"None of the above"`.

## 补充

在 `shell` 中，中括号 `[ ]` 用于测试表达式的真假值。在 `if` 语句中，需要测试多个表达式的真假值，因此需要使用逻辑运算符，如 `&&` 或 `-a`，将多个表达式连接起来。

使用中括号的原因是，中括号内的表达式会被解析为一个整体，然后返回一个真或假的值。因此，需要将每个表达式都放在中括号内，然后使用逻辑运算符连接它们。

当然，也可以使用双中括号 `[[ ]]` 来代替单中括号，它也可以进行逻辑运算。但是，双中括号有一些特殊的语法和行为，例如可以进行模式匹配和字符串比较，因此在某些情况下可能会更加方便。但是在本例中，使用单中括号即可。

```shell
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

judge_your_grade 99
```
