#include<stdio.h>
#include<stdlib.h>
#include<fcntl.h>
#include<unistd.h>
#include<string.h>
#include<math.h>
#include<linux/sched.h>
#include<pthread.h>
#include<time.h>
#include<sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include<linux/sched.h>
#include <time.h>
#include <linux/unistd.h>
#include <linux/kernel.h>
#include <linux/types.h>
#include <sys/syscall.h>
#include <pthread.h>
#include <errno.h>
 
int main(int argc,char *argv[])
{
	
	FILE *cpuset_t;
	FILE *f;
	FILE *f1;
	FILE *f2;
	FILE *f3;
	FILE *f4;
	FILE *f5;
	FILE *f6;
	char wf[100];
	char *line = NULL;
	char *utilline = NULL;
	char *jobId = NULL;
	char *taskId = NULL;
	char *exec_time=NULL;

	size_t len = 0;
	size_t lencpu = 0;
	size_t lenutil = 0;
	size_t lensleep = 0;
	size_t lenjobId = 0;
	size_t lentaskId = 0;
	size_t lenexec=0;

	ssize_t read;

	int flag=0;
	int prev=0;


	int start_time;
	float util;
	char *tcpu=NULL;
	double tcput;
	char *sleep_time = NULL;
	
	int intr;
	int  pid;
	
	
	char cpu_grp[100];
	// sprintf(wf,"sudo cgclassify -g cpuset:job%s %d\n",argv[1],getpid());
	//sprintf(cpu_grp,"sudo cgclassify -g cpu:group2 %d\n",getpid());
	//printf("%s\n",cpu_grp);
	//system(cpu_grp);
	
	f = fopen("../input2.1_32/wl6/starttime.txt", "r");
	f1 = fopen("../input2.1_32/wl6/cpu_time.txt", "r");
	f2 = fopen("../input2.1_32/wl6/core_request.txt","r");
	f3 = fopen("../input2.1_32/wl6/sleep_time.txt","r");
	f4 = fopen("../input2.1_32/wl6/job_id.txt","r");
	f5 = fopen("../input2.1_32/wl6/task_index.txt","r");
		
	f6 = fopen("../input2.1_32/wl6/exec_time.txt","r");
	printf("files opened\n");	
	
	int count =0;
	while(count<350)
	{
		if(!flag)
		{
			getline(&line,&len,f);
			getline(&tcpu,&lencpu,f1);
			getline(&utilline,&lenutil,f2);
			getline(&sleep_time,&lensleep,f3);
			getline(&exec_time,&lenexec,f6);		
			getline(&jobId,&lenjobId,f4);
//			printf("\nJobID %s",jobId);
			getline(&taskId,&lenjobId,f5);
			tcput = atof(tcpu);
			util = atof(utilline);

			intr = 0;
			prev = start_time;
			start_time = atoi(line); 	
			
			flag=1;
		}
		else
		{
			getline(&line,&len,f);
			getline(&tcpu,&lencpu,f1);
			getline(&utilline,&lenutil,f2);
	
			getline(&sleep_time,&lensleep,f3);
	
			getline(&jobId,&lenjobId,f4);
			getline(&taskId,&lenjobId,f5);
			tcput = atof(tcpu);
			util = atof(utilline);

			start_time = atoi(line);
			intr = start_time - prev;
			 sleep(intr);
			
		}
		count++;
			

		char core_request[100];
		char cpu_time[100];
		char taskid[100];
		sprintf(cpu_time,"%f",tcput);
		sprintf(core_request,"%f",util);
		sprintf(taskid,"%d",count);
	//	printf("\nexectime: %s\t starttime :%s\t cycles : %s\t utilization : %s sleep_time : %s\n",exec_time,line,cpu_time,core_request,sleep_time);
		
		pid = fork();
		
		if(pid==0)
		{
						
			 printf("before exec\n");
				
			if(execl("./emulate_job",core_request,cpu_time,taskId,sleep_time,jobId,taskId,line,exec_time,argv[2],argv[3],NULL)==-1)//change
				perror("exec");
			printf("exec failed\n");
			exit(0);
			
		}
		prev = start_time;
	}

	int status;
	int count_lines=0;

	while(1){

		status=wait(-1);
		if(status ==-1 && errno==ECHILD){
			break;
		}

	}
	
	// while(1){

	// 	FILE *fileptr = fopen("wl_resp.txt", "r");
 //   		//extract character from file and store in chr
 //    	char chr = getc(fileptr);
 //    	while (chr != EOF)
 //    	{
 //        	//Count whenever new line is encountered
 //        	if (chr == '\n')
 //        	{
 //            	count_lines = count_lines + 1;
 //        	}
 //        	//take next character from file.
 //        	chr = getc(fileptr);
 //    	}
	// }
	
	printf("\n=======Run completed============\n");
	fclose(f);
	fclose(f1);
	fclose(f2);
	fclose(f3);
	fclose(f4);
	fclose(f5);
	fclose(f6);
	return 0;
}
