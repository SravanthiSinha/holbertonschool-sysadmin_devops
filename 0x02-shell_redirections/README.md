# Shell, I/O Redirections and filters

Bash scripts demonstrating basic I/O redirections andfilters.

## Contents

### 0. Hello World
Prints “Hello, World”, followed by a new line to the standard output.
```
sinha@0x02-shell_redirections$:./0-hello_world 
Hello, World
sinha@0x02-shell_redirections$:./0-hello_world | cat -e
Hello, World$
sinha@0x02-shell_redirections$: 
```


### 1. Confused smiley 
Displays a confused smiley `"(Ôo)'`.
```
sinha@0x02-shell_redirections$:./1-confused_smiley
"(Ôo)'
sinha@0x02-shell_redirections$:
```

### 2. Let's display a file
Displays the content of the `/etc/passwd` file.  

file: `2-hellofile`

### 3. What about 2?
Displays the content of `/etc/passwd` and `/etc/hosts`  

file: `3-twofiles`

### 4. Last lines of a file
Displays the last 10 lines of `/etc/passwd`  

file: `4-lastlines`

### 5. I'd prefer the first ones actually
Displays the first 10 lines of `/etc/passwd`

file: `5-firstlines`

### 6. Line #2
Displays the third line of the file `iacta` in the working directory.
```
sinha@0x02-shell_redirections$:cat iacta 
Alea iacta est

Alea iacta est ("The die is cast") is a Latin phrase attributed by Suetonius
(as iacta alea est) to Julius Caesar on January 10, 49 BC
as he led his army across the Rubicon river in Northern Italy. With this step,
he entered Italy at the head of his army in defiance of the Senate and began
his long civil war against Pompey and the Optimates. The phrase has been
adopted in Italian (Il dado è tratto), Romanian (Zarurile au fost aruncate),
Spanish (La suerte está echada), French (Les dés sont jetés), Portuguese (A
sorte está lançada), Dutch (De teerling is geworpen),
German (Der Würfel ist gefallen), Hungarian (A kocka el van vetve) and many other languages to
indicate that events have passed a point of no return.

Read more: https://en.wikipedia.org/wiki/Alea_iacta_est
sinha@0x02-shell_redirections$:./6-third_line 
Alea iacta est ("The die is cast") is a Latin phrase attributed by Suetonius
sinha@0x02-shell_redirections$:
```

### 7. Save current state of directory
Writes a script that writes into the file `ls_cwd_content` the result of the command `ls -la`. If the file `ls_cwd_content` already exists, it should be overwritten. If the file `ls_cwd_content` does not exist, creates it.

file: `8-cwd_state`

### 8. It is a good file that cuts iron without making a noise
Creates a file named exactly `\*\\'"Holberton School"\'\\*$\?\*\*\*\*\*:)` containing the text `Holberton School` and ending by a new line.
```
sinha@0x02-shell_redirections$:ls && ./7-file && ls -l && cat -e \\*
8-cwd_state 9-duplicate_last_line iacta ls_cwd_content
total 4
-rwxrwxr-x 1 sinha sinha   38 Apr 18 15:06 8-cwd_state
-rwxrwxr-x 1 sinha sinha   37 Apr 18 15:06 9-duplicate_last_line
-rw-rw-r-- 1 sinha sinha   17 Apr 18 15:29 \*\\'"Holberton School"\'\\*$\?\*\*\*\*\*:)
-rw-rw-r-- 1 sinha sinha  801 Apr 18 15:25 iacta
-rw-rw-r-- 1 sinha sinha 1856 Apr 18 15:26 ls_cwd_content
Holberton School$
sinha@0x02-shell_redirections$:
```

### 9. Duplicate last line 
Duplicates the last line of the file `iacta` in the working directory

file: `9-duplicate_last_line`

### 10. No more javascript
Deletes all the regular files (not the directories) with a .js extension that are present in the current directory and all its subfolders.

file: `10-no_more_js`

### 11. Don't just count your directories, make your directories count 
Counts the number of directories and sub-directories in the current directory.
- The current and parent directories are taken into account
- Hidden directories are counted

```
sinha@tmp$:ls -lRa
.:
total 24
drwxrwxr-x 5 sinha sinha 4096 Apr 18 15:33 .
drwxrwxr-x 3 sinha sinha 4096 Apr 18 15:32 ..
-rwxrwxr-x 1 sinha sinha   47 Apr 18 15:33 11-directories
drwxrwxr-x 2 sinha sinha 4096 Apr 18 15:33 test
drwxrwxr-x 2 sinha sinha 4096 Apr 18 15:33 test2
drwxrwxr-x 2 sinha sinha 4096 Apr 18 15:33 test3

./test:
total 8
drwxrwxr-x 2 sinha sinha 4096 Apr 18 15:33 .
drwxrwxr-x 5 sinha sinha 4096 Apr 18 15:33 ..

./test2:
total 8
drwxrwxr-x 2 sinha sinha 4096 Apr 18 15:33 .
drwxrwxr-x 5 sinha sinha 4096 Apr 18 15:33 ..

./test3:
total 8
drwxrwxr-x 2 sinha sinha 4096 Apr 18 15:33 .
drwxrwxr-x 5 sinha sinha 4096 Apr 18 15:33 ..
sinha@tmp$:./11-directories 
3
```

### 12. What’s new
Displays the 10 newest files in the current directory.
- One file per line
- Sorted from the newest to the oldest
```
sinha@tmp$:ls -l
total 8
-rw-rw-r-- 1 sinha sinha  0 Apr 18 15:38 1
-rwxrwxr-x 1 sinha sinha 47 Apr 18 15:33 11-directories
-rwxrwxr-x 1 sinha sinha 29 Apr 18 15:35 12-newest_files
-rw-rw-r-- 1 sinha sinha  0 Apr 18 15:38 2
-rw-rw-r-- 1 sinha sinha  0 Apr 18 15:38 3
-rw-rw-r-- 1 sinha sinha  0 Apr 18 15:38 4
-rw-rw-r-- 1 sinha sinha  0 Apr 18 15:38 5
-rw-rw-r-- 1 sinha sinha  0 Apr 18 15:38 6
-rw-rw-r-- 1 sinha sinha  0 Apr 18 15:38 7
-rw-rw-r-- 1 sinha sinha  0 Apr 18 15:38 8
-rw-rw-r-- 1 sinha sinha  0 Apr 18 15:38 9
sinha@tmp$:./12-newest_files 
1
2
3
4
5
6
7
8
9
12-newest_files
sinha@tmp$:
``` 

### 13. Being unique is better than being perfect 
Takes a list of words as input and prints only words that appear exactly once.

- Input format: One line, one word
- Output format: One line, one word
- Words should be sorted

```
sinha@0x02-shell_redirections$:cat list 
C#
C
Javascript
Perl
PHP
PHP
ASP
R
Go
C#
C++
R
Perl
Javascript
Javascript
Python
Javascript
Javascript
Javascript
Java
Java
Python
Javascript
Javascript
Javascript
ASP
sinha@0x02-shell_redirections$:cat list | ./13-unique 
C
C++
Go
sinha@0x02-shell_redirections$:
```

### 14. It must be in that file 
Displays lines containing the pattern "root" from the file `/etc/passwd`
```
sinha@0x02-shell_redirections$:./14-findthatword 
root:x:0:0:root:/root:/bin/bash
sinha@0x02-shell_redirections$:

```

### 15. Count that word
Displays the number of lines that contain the pattern "bin" in the file `/etc/passwd`

```
sinha@0x02-shell_redirections$:./15-countthatword 
40
```

### 16. What's next?
Displays lines containing the pattern "root" and 3 lines after them in the file `/etc/passwd.`

file: `16-whatsnext`

### 17. I hate bins
Displays all the lines in the file `/etc/passwd` that do not contain the pattern "bin".

file: `17-hidethisword`

### 18. Letters only please
Displays all lines of the file `/etc/ssh/sshd_config` starting with a letter.
- include capital letters as well

file: `18-letteronly`

### 19. A to Z
Replaces all characters `A` and `c` from input to `Z` and `e` respectively.

file: `19-AZ` 

### 20. Without C, you would live in hiago
Removes all letters c and C from input.

file: `20-hiago`

### 21. esreveR
Reverses the input.

file: '21-reverse'

### 22. DJ Cut Killer
Displays all user and their home directories, sorted by users, based on the `/etc/passwd` file.

file: `22-users_and_homes`

### 23. Empty casks make the most noise
Displays  all empty files and directories in the current directory and all sub-directories.
```
sinha@tmp$:ls -laR
.:
total 28
drwxrwxr-x 4 sinha sinha 4096 Apr 18 15:52 .
drwxrwxr-x 3 sinha sinha 4096 Apr 18 15:41 ..
-rw-rw-r-- 1 sinha sinha    0 Apr 18 15:38 1
-rwxrwxr-x 1 sinha sinha   55 Apr 18 15:52 100-empty_casks
-rwxrwxr-x 1 sinha sinha   47 Apr 18 15:33 11-directories
-rwxrwxr-x 1 sinha sinha   29 Apr 18 15:35 12-newest_files
-rw-rw-r-- 1 sinha sinha    0 Apr 18 15:52 ..asd
-rw-rw-r-- 1 sinha sinha    0 Apr 18 15:50 .js
drwxrwxr-x 2 sinha sinha 4096 Apr 18 15:51 test
drwxrwxr-x 2 sinha sinha 4096 Apr 18 15:50 .ts

./test:
total 8
drwxrwxr-x 2 sinha sinha 4096 Apr 18 15:51 .
drwxrwxr-x 4 sinha sinha 4096 Apr 18 15:52 ..
-rw-rw-r-- 1 sinha sinha    0 Apr 18 15:51 .l

./.ts:
total 8
drwxrwxr-x 2 sinha sinha 4096 Apr 18 15:50 .
drwxrwxr-x 4 sinha sinha 4096 Apr 18 15:52 ..
sinha@tmp$:./100-empty_casks 
.l
..asd
.ts
.js
1
sinha@tmp$:
```
###24 A gif is worth ten thousand words 
Displays list of all the files with a .gif extension in the current directory and all its sub-directories.

```
sinha@tmp$:ls -laR
.:
total 32
drwxrwxr-x 4 sinha sinha 4096 Apr 18 15:54 .
drwxrwxr-x 3 sinha sinha 4096 Apr 18 15:41 ..
-rw-rw-r-- 1 sinha sinha    0 Apr 18 15:38 1
-rwxrwxr-x 1 sinha sinha   55 Apr 18 15:52 100-empty_casks
-rwxrwxr-x 1 sinha sinha  100 Apr 18 15:54 101-gifs
-rwxrwxr-x 1 sinha sinha   47 Apr 18 15:33 11-directories
-rwxrwxr-x 1 sinha sinha   29 Apr 18 15:35 12-newest_files
-rw-rw-r-- 1 sinha sinha    0 Apr 18 15:54 a.gif
-rw-rw-r-- 1 sinha sinha    0 Apr 18 15:52 ..asd
-rw-rw-r-- 1 sinha sinha    0 Apr 18 15:54 .r.gif
drwxrwxr-x 2 sinha sinha 4096 Apr 18 15:51 test
drwxrwxr-x 2 sinha sinha 4096 Apr 18 15:50 .ts

./test:
total 8
drwxrwxr-x 2 sinha sinha 4096 Apr 18 15:51 .
drwxrwxr-x 4 sinha sinha 4096 Apr 18 15:54 ..
-rw-rw-r-- 1 sinha sinha    0 Apr 18 15:51 .l

./.ts:
total 8
drwxrwxr-x 2 sinha sinha 4096 Apr 18 15:50 .
drwxrwxr-x 4 sinha sinha 4096 Apr 18 15:54 ..
sinha@tmp$:./101-gifs 
.r
a
sinha@tmp$:
```

### 25. Acrostic
Displays the decoded message of acrostics, that use the first letter of each line.

```
sinha@tmp$:cat An\ Acrostic 
Elizabeth it is in vain you say
Love not"—thou sayest it in so sweet a way:
In vain those words from thee or L.E.L.
Zantippe's talents had enforced so well:
Ah! if that language from thy heart arise,
Breath it less gently forth—and veil thine eyes.
Endymion, recollect, when Luna tried
To cure his love—was cured of all beside—
His follie—pride—and passion—for he died.
sinha@tmp$:./102-acrostic < An\ Acrostic 
ELIZABETH
sinha@tmp$:
```

### 26. The biggest fan
displays the 11 hosts or IP addresses which did the most requests by parsing web servers logs in TSV format as input

```
sinha@tmp$:wget http://indeedeng.github.io/imhotep/files/nasa_19950801.tsv
--2017-04-18 16:01:16--  http://indeedeng.github.io/imhotep/files/nasa_19950801.tsv
Resolving indeedeng.github.io (indeedeng.github.io)... 151.101.24.133
Connecting to indeedeng.github.io (indeedeng.github.io)|151.101.24.133|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://opensource.indeedeng.io/imhotep/files/nasa_19950801.tsv [following]
--2017-04-18 16:01:16--  http://opensource.indeedeng.io/imhotep/files/nasa_19950801.tsv
Resolving opensource.indeedeng.io (opensource.indeedeng.io)... 151.101.24.133
Reusing existing connection to indeedeng.github.io:80.
HTTP request sent, awaiting response... 200 OK
Length: 2339220 (2.2M) [text/tab-separated-values]
Saving to: ‘nasa_19950801.tsv’

nasa_19950801.tsv   100%[===================>]   2.23M  4.57MB/s    in 0.5s    

2017-04-18 16:01:18 (4.57 MB/s) - ‘nasa_19950801.tsv’ saved [2339220/2339220]

sinha@tmp$:./103-the_biggest_fan < nasa_19950801.tsv 
edams.ksc.nasa.gov
130.110.74.81
www-relay.pa-x.dec.com
derec
163.205.16.75
piweba3y.prodigy.com
poppy.hensa.ac.uk
163.206.89.4
gw1.att.com
arc.dental.upenn.edu
131.110.62.74
sinha@tmp$:
```


