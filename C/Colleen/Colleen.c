#include <stdio.h>
/*
    A
*/

void quine()
{
    char *s = "#include <stdio.h>%c/*%c    A%c*/%c%cvoid quine()%c{%c    char *s = %c%s%c;%c    printf(s, 10, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);%c}%c%cint main()%c{%c    /*%c        B%c    */%c    quine();%c    return 0;%c}%c";
    printf(s, 10, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);
}

int main()
{
    /*
        B
    */
    quine();
    return 0;
}
