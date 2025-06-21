#include "include/lexer.h"

int main(void) {
    tokenize("{\"test\": true, \"dev\": false, \"runTests\": {\"files\": [\"*.json\"]}}");
    return 0;
}
