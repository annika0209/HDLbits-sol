#include <stdio.h>
#define SIZE 20
void printing(int a[][SIZE]);
void copy1(int ori[][SIZE],int cpy[][SIZE]);
void birth(int ori[][SIZE],int cpy[][SIZE]);
void death(int ori[][SIZE],int cpy[][SIZE]);
int main(void)
{        int ori[SIZE][SIZE]={
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
        };
        int copy[SIZE][SIZE]={0,};
    int check=0;
    while(1){
        check=0;
        printf("계속하려면 1 종료하려면 2\n");
        printing(ori);
        birth(ori,copy);
        death(ori,copy);
        copy1(ori,copy);
        scanf("%d", &check);
        if(check==2)
            break;
        }
    return 0;}
void birth(int ori[][SIZE],int cpy[][SIZE])
{    int count=0;
    int *p= &ori[0][0];
    int *endp= &ori[SIZE-1][SIZE-1];
    int *cp=&cpy[0][0];
    while(p<=endp){
    if(*(p-SIZE-1)==1)
        count++;
    if(*(p-SIZE)==1)
        count++;
    if(*(p-SIZE+1)==1)
        count++;
    if(*(p+1)==1)
        count++;
    if(*(p-1)==1)
        count++;
    if(*(p+SIZE-1)==1)
        count++;
    if(*(p+SIZE)==1)
        count++;
    if(*(p+SIZE+1)==1)
        count++;
    if(*p==0&&count==3)
        *cp=1;
    count=0;
    p++;cp++;
    }}
void printing(int a[][SIZE])
{    int i,j;
    for(i=0;i<SIZE;i++)
    {for(j=0;j<SIZE;j++)
    {printf("%d ", a[i][j]);}
    printf("\n");}}
void copy1(int ori[][SIZE],int cpy[][SIZE])
{    int *p= &ori[0][0];
    int *endp= &ori[SIZE-1][SIZE-1];
    int *cp=&cpy[0][0];
    while(p<=endp)
    {
        *p=*cp;
        p++;
        cp++;
    }
}

void death(int ori[][SIZE],int cpy[][SIZE])
{    int count=0;
    int *p= &ori[0][0];
    int *endp= &ori[SIZE-1][SIZE-1];
    int *cp=&cpy[0][0];
    while(p<=endp){
    if(*(p-SIZE-1)==1)
        count++;
    if(*(p-SIZE)==1)
        count++;
    if(*(p-SIZE+1)==1)
        count++;
    if(*(p+1)==1)
        count++;
    if(*(p-1)==1)
        count++;
	    if(*(p+SIZE-1)==1)
	        count++;
	    if(*(p+SIZE)==1)
	        count++;
	    if(*(p+SIZE+1)==1)
	        count++;
	    if(*p==1&&((count>=4)||(count<2)))
	        *cp=0;
	    else if(*p==1&&(count==2||count==3))
	        *cp=1;
	    count=0;
	    p++;cp++;}}
