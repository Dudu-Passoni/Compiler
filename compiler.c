#include <stdio.h>
#include <stdlib.h>
#include "analex.h"
#include "pilha.h"


int token;

void E();
void T();
void E_linha();
void T_linha();
void F();
void erro();
void reconhecer(int tok);
void execute(char op);


void execute(char op) {
    printf("%c \n", op);
    a = pop();
    b = pop();
        switch(op)
        {
            case '+': push(b+a);
                      break;

            case '-': push(b-a);
                      break;

            case '*': push(b*a);
                      break;

            case '/': push(b/a);
                      break;
        }
}

void erro() {
    printf("Erro sintatico\n");
    exit(1);
}

void reconhecer(int tok) {
    if (tok == token)
        token = analex();
    else
        erro();
}
void E(){
    T();
    E_linha();
}

void E_linha(){
    if(token == '+'){
        reconhecer('+');
        T();
        execute('+');
        E_linha();
    }
    else if(token == '-'){
        reconhecer('-');
        T();
        execute('-');
        E_linha();
    }
    else ;
}

void T(){
    F();
    T_linha();
}

void T_linha(){
    if(token == '*'){
        reconhecer('*');
        F();
        execute('*');
        T_linha();
    }
    else if(token == '/'){
        reconhecer('/');
        F();
        execute('/');
        T_linha();
    }
    else ;
}

void F(){
    if(token == NUM){
        printf("%d ", tokenval);
        push(tokenval);
        reconhecer(NUM);
    }
    else if(token == '('){
        reconhecer('(');
        E();
        reconhecer(')');
    }
    else erro();

}

// implementar aqui
main() {
    token = analex();
    E();
    if (token != ';')
        erro();
    else
        printf("Sucesso!!\n%d\n", topo());
    }
