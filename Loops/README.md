# Loops

## For loops

`for` loops iterate through a **set** of values until the list is exhausted.

```shell
#!/bin/sh
for i in 1 2 3 4 5
do
  echo "Looping ... number $i"
done
```

## While Loops

When the conditions set by the developer are met,the `while` loop breaks.

```shell
#!/bin/sh
INPUT_STRING=hello
while [ "$INPUT_STRING" != "bye" ]
do
  echo "Please type something in (bye to quit)"
  read INPUT_STRING
  echo "You typed: $INPUT_STRING"
done
```

In this case,when `INPUT_STRING` equals `"bye"` or the user press `Ctrl + C`,it breaks.Otherwise,it will be run forever.

Another situation is that use `:` behind `while`.`:` represent that the condition is always equals `true`.

```shell
#!/bin/sh
while :
do
  echo "Please type something in (^C to quit)"
  read INPUT_STRING
  echo "You typed: $INPUT_STRING"
done
```

