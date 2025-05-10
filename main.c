#include "include/lexer.h"

int main(void) {
    Token tokens = tokenize("{\n\n\n\"test\": true}");

    return 0;
}