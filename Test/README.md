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

