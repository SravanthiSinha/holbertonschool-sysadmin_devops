# Shell, init files, variables and expansions

Bash scripts demonstrating aliases and shell initialization.

## Contents

### 0. <o>
Creates an alias.
- name: `ls`
- value: `rm *`

```
sinha@tmp$:ls
0-alias  1  2  3
sinha@tmp$:source ./0-alias
sinha@tmp$:ls
sinha@tmp$:\ls
sinha@tmp$:
```

### 1. Hello you
Prints `hello user`, where user is the current Linux user.

```
sinha@0x03-shell_variables_expansions$:./1-hello_you
hello sinha
sinha@0x03-shell_variables_expansions$:
```

### 2. The path to success is to take massive, determined action
Adds `/action` to the `PATH`. `/action` will be the last directory the shell looks into when looking for a program.

```
sinha@0x03-shell_variables_expansions$:echo $PATH
/home/sinha/torch/install/bin:/home/sinha/torch/install/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
sinha@0x03-shell_variables_expansions$:source ./2-path
sinha@0x03-shell_variables_expansions$:echo $PATH
/home/sinha/torch/install/bin:/home/sinha/torch/install/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/action
sinha@0x03-shell_variables_expansions$:
```

### 3. If the path be beautiful, let us not ask where it leads
Counts and prints the number of directories in the `PATH`.

file: `3-paths`

### 4. Global variables
Lists environmental variables.

file: `4-global_variables`

### 5. Local variables
Lists all local variables, environmental variables and functions.

file: `5-local_variables`

### 6. Local variable
Creates a new local variable `BETTY` with the value `Holberton`.

file: `6-create_local_variable`

### 7. Global variable
Creates a new global variable `HOLBERTON` with the value `Betty`.

file: `7-create_global_variable`

### 8. Every addition to true knowledge is an addition to human power
Prints the result of the addition of 128 with the value stored in the environment variable `TRUEKNOWLEDGE`, followed by a new line.

```
sinha@0x03-shell_variables_expansions$:export TRUEKNOWLEDGE=1209
sinha@0x03-shell_variables_expansions$:./8-true_knowledge | cat -e
1337$
sinha@0x03-shell_variables_expansions$:
```

### 9. Divide and rule
Prints the result of env variable `POWER` divided by env variable `DIVIDE`, followed by a new line.

```
sinha@0x03-shell_variables_expansions$:export POWER=42784
sinha@0x03-shell_variables_expansions$:export DIVIDE=32
sinha@0x03-shell_variables_expansions$:./9-divide_and_rule | cat -e
1337$
sinha@0x03-shell_variables_expansions$:
```

### 10. Love is anterior to life, posterior to death, initial of creation, and the exponent of breath
Displays the result of env variable `BREATH` to the power env variable `LOVE`.

```
sinha@0x03-shell_variables_expansions$:export BREATH=4
sinha@0x03-shell_variables_expansions$:export LOVE=3
sinha@0x03-shell_variables_expansions$:./10-love_exponent_breath
64
sinha@0x03-shell_variables_expansions$:
```

### 11. There are 10 types of people in the world -- Those who understand binary, and those who don't
Converts a number stored in env variable `BINARY` from base 2 to base 10.

```
sinha@0x03-shell_variables_expansions$:export BINARY=10100111001
sinha@0x03-shell_variables_expansions$:./11-binary_to_decimal
1337
sinha@0x03-shell_variables_expansions$:
```

### 12. Combination
Prints all possible combinations of two letters, except `oo`

```
sinha@0x03-shell_variables_expansions$:echo $((26 ** 2 -1))
675
sinha@0x03-shell_variables_expansions$: ./12-combinations | wc -l
675
sinha@0x03-shell_variables_expansions$:./12-combinations | tail -303 | head -10
oi
oj
ok
ol
om
on
op
oq
or
os
sinha@0x03-shell_variables_expansions$:
```

### 13. Floats
Prints a number stored in env var `NUM` as a float with two decimal places.

```
sinha@0x03-shell_variables_expansions$:export NUM=0
sinha@0x03-shell_variables_expansions$:./13-print_float
0.00
sinha@0x03-shell_variables_expansions$:export NUM=98
sinha@0x03-shell_variables_expansions$:./13-print_float
98.00
sinha@0x03-shell_variables_expansions$:export NUM=3.14159265359
sinha@0x03-shell_variables_expansions$:./13-print_float
3.14
sinha@0x03-shell_variables_expansions$:
```

### 14. Decimal to Hexadecimal
Converts a number stored in env var `DECIMAL` from base 10 to base 16.

```
sinha@0x03-shell_variables_expansions$:export DECIMAL=16
sinha@0x03-shell_variables_expansions$:./14-decimal_to_hexadecimal
10
sinha@0x03-shell_variables_expansions$:export DECIMAL=1337
sinha@0x03-shell_variables_expansions$:./14-decimal_to_hexadecimal |cat -e
539$
sinha@0x03-shell_variables_expansions$:export DECIMAL=15
sinha@0x03-shell_variables_expansions$:./14-decimal_to_hexadecimal |cat -e
f$
sinha@0x03-shell_variables_expansions$:
```

### 17. Everyone is a proponent of strong encryption
Encodes and decode the text using the rot13 encryption.

```
sinha@0x03-shell_variables_expansions$:cat quote
"Everyone is a proponent of strong encryption."
- Dorothy E. Denning
sinha@0x03-shell_variables_expansions$:./100-rot13 < quote
"Rirelbar vf n cebcbarag bs fgebat rapelcgvba."
- Qbebgul R. Qraavat
sinha@0x03-shell_variables_expansions$:
```

### 18. The eggs of the brood need to be an odd number
Dispalys every other line from the input, starting with the first line.

```
sinha@0x03-shell_variables_expansions$:\ls -1
0-alias
100-rot13
101-odd
102-water_and_stir
10-love_exponent_breath
11-binary_to_decimal
12-combinations
13-print_float
14-decimal_to_hexadecimal
1-hello_you
2-path
3-paths
4-global_variables
5-local_variables
6-create_local_variable
7-create_global_variable
8-true_knowledge
9-divide_and_rule
quote
README.md
sinha@0x03-shell_variables_expansions$:\ls -1 | ./101-odd
0-alias
101-odd
10-love_exponent_breath
12-combinations
14-decimal_to_hexadecimal
2-path
4-global_variables
6-create_local_variable
8-true_knowledge
quote
sinha@0x03-shell_variables_expansions$:
```
### 19. I'm an instant star. Just add water and stir.

 Add two numbers stored in the environment variables WATER and STIR and display the result
 WATER is in base water
 STIR is in base stir.
 The result should be in base behlnort

```
sinha@0x03-shell_variables_expansions$:export WATER="ewwatratewa"
sinha@0x03-shell_variables_expansions$:export STIR="ti.itirtrtr"
sinha@0x03-shell_variables_expansions$:./102-water_and_stir
holberton
sinha@0x03-shell_variables_expansions$:
```
