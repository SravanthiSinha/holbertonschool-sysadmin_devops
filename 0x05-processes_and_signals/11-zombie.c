#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

/**
 * infite_while -  Runs infinite loop
 * Return: never returns anaything
 */
int infite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main -  A fucntion that creates 5 zombie processes.
 * Description: A fucntion that creates 5 zombie processes.
 * Return: returns 0 on success
 */
int main(void)
{
	pid_t pid;
	int i;

	for (i = 0; i < 5; i++)
	{
		pid = fork();
		if (pid == 0)
		{
			/* child process: drivel then exit */
			printf("Zombie process created, PID: %d\n", getpid());
			exit(0);
		}
	}
	infite_while();
	return (0);
}
