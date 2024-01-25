#include <stdio.h>
#include <stdlib.h>

int main()
{
    int i = 5;
    char name[20];
    char cmd[100];
    char *s = "#include <stdio.h>%c#include <stdlib.h>%c%cint main()%c{%c    int i = %d;%c    char name[20];%c    char cmd[100];%c    char *s = %c%s%c;%c    if (i <= 0)%c        return (0);%c    sprintf(name, %cSully_%%c.c%c, i + 48 - 1);%c    FILE *f = fopen(name, %cw%c);%c    fprintf(f, s, 10, 10, 10, 10, 10, i - 1, 10, 10, 10, 34, s, 34, 10, 10, 10, 34, 34, 10, 34, 34, 10, 10, 10, 34, 34, 10, 10, 10, 10);%c    fclose(f);%c    sprintf(cmd, %cclang -Wall -Wextra -Werror -o Sully_%%c Sully_%%c.c && ./Sully_%%c%c, i + 48 - 1, i + 48 - 1, i + 48 - 1);%c    system(cmd);%c    return (0);%c}";
    if (i <= 0)
        return (0);
    sprintf(name, "Sully_%c.c", i + 48 - 1);
    FILE *f = fopen(name, "w");
    fprintf(f, s, 10, 10, 10, 10, 10, i - 1, 10, 10, 10, 34, s, 34, 10, 10, 10, 34, 34, 10, 34, 34, 10, 10, 10, 34, 34, 10, 10, 10, 10);
    fclose(f);
    sprintf(cmd, "clang -Wall -Wextra -Werror -o Sully_%c Sully_%c.c && ./Sully_%c", i + 48 - 1, i + 48 - 1, i + 48 - 1);
    system(cmd);
    return (0);
}