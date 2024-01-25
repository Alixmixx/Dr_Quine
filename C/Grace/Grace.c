#include <stdio.h>
/*
    A
*/
#define S "#include <stdio.h>%c/*%c    A%c*/%c#define S %c%s%c%c#define F()int main(){FILE *f=fopen(%cGrace_kid.c%c,%cw%c);fprintf(f,S,10,10,10,10,34,S,34,10,34,34,34,34,10,10,10);fclose(f);}%c%cF()%c"
#define F()int main(){FILE *f=fopen("Grace_kid.c","w");fprintf(f,S,10,10,10,10,34,S,34,10,34,34,34,34,10,10,10);fclose(f);}

F()
