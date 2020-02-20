#include <stdio.h>

int main() {
    char cr, is_n = 0;
    puts(".section .data");
    for (char a = 'a'; a <= 'z'; a++)
        printf("%c:\t.quad 0\n", a);
    puts("");
    puts(".section .text");
    puts(".global main");
    puts("main:");
    puts("\tmovl $0, %eax");
    while ((cr = getchar()) != -1) {
        if (cr >= '0' && cr <= '9') {
            if (is_n)
                printf("%c", cr);
            else {
                printf("\tpush $%c", cr);
                is_n = 1;
            }
            continue;
        }
        if (is_n) {
            is_n = 0;
            puts("");
        }
        if (cr == '.') {
            puts("\tcall getchar");
            puts("\tpush %rax");
        } else if (cr == '!') {
            puts("\tpop %rax");
            puts("\tshl $3, %rax");
            puts("\tadd %rsp, %rax");
            puts("\tpush (%rax)");
        } else if (cr == '&') {
            puts("\tpush (%rsp)");
        } else if (cr == ',') {
            puts("\tpop %rdi");
            puts("\tcall putchar");
        } else if (cr >= 'a' && cr <= 'z')
            printf("\tpush (%c)\n", cr);
        else if (cr >= 'A' && cr <= 'Z')
            printf("\tpop (%c)\n", cr - ('A' - 'a'));
        else if (cr == ' ' || cr == '\t' || cr == '\n' || cr == '\r');
        else if (cr == '#')
            while (getchar() != '\n'); // do nothing
        else if (cr == ':') {
            printf("_%c:", getchar());
        } else if (cr == '@') {
            char lbl = getchar();
            printf("\tcall _%c\n", lbl);
        } else if (cr == '~')
            puts("\tadd $8, %rsp");
        else if (cr == ';')
            puts("\tret");
        else if (cr == '?') {
            puts("\tmov 8(%rsp), %rax");
            puts("\tcmpq (%rsp), %rax");
        } else if (cr == '=') {
            printf("\tje _%c\n", getchar());
        } else if (cr == '+') {
            puts("\tpop %rax");
            puts("\tpop %rbx");
            puts("\tadd %rbx, %rax");
            puts("\tpush %rax");
        } else if (cr == '-') {
            puts("\tpop %rax");
            puts("\tpop %rbx");
            puts("\tsub %rax, %rbx");
            puts("\tpush %rbx");
        } else if (cr == '\\') {
            char c = getchar();
            if (c == '\'' || c == '\\')
                printf("\tpush $'\\%c'\n", c);
            else
                printf("\tpush $'%c'\n", c);
        }
    }
    puts("\tmov $0, %rdi");
    puts("\tcall exit");
}
