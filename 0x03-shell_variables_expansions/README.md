# Shell, init files, variables and expansions

Bash scripts demonstrating aliases and shell initialization.

## Contents

### 0. <o>
Creates an alias.
- name: `ls`
- value: `rm *`

file: `0-alias`

### 1. Hello you
Prints `hello user`, where user is the current Linux user.

file: `1-hello_you`

### 2. The path to success is to take massive, determined action
Adds `/action` to the `PATH`. `/action` will be the last directory the shell looks into when looking for a program.

file: `2-path`

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

file: `8-true_knowledge`

### 9. Divide and rule
Prints the result of env variable `POWER` divided by env variable `DIVIDE`, followed by a new line.

file: `9-divide_and_rule`

### 10. Love is anterior to life, posterior to death, initial of creation, and the exponent of breath
Displays the result of env variable `BREATH` to the power env variable `LOVE`.

file: `10-love_exponent_breath`

### 11. There are 10 types of people in the world -- Those who understand binary, and those who don't
Converts a number stored in env variable `BINARY` from base 2 to base 10.

file: `11-binary_to_decimal`

### 12. Combination
Prints all possible combinations of two letters, except `oo`

file: `12-combinations`

### 13. Floats
Prints a number stored in env var `NUM` as a float with two decimal places.

file: `13-print_float`

### 14. Decimal to Hexadecimal
Converts a number stored in env var `DECIMAL` from base 10 to base 16.

file: `14-decimal_to_hexadecimal`
