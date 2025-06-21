#ifndef TOKENIZER_H
#define TOKENIZER_H

enum JsonToken {
    NUMBER,
    STRING,
    LBRACE,
    RBRACE,
    LBRACK,
    RBRACK,
    TRUE_LITERAL,
    FALSE_LITERAL,
    NULL_LITERAL,
    WHITESPACE,
    COLON,
    COMMA,
    ILLEGAL,
    EOS
 };

typedef struct {
    enum JsonToken value;
    char *kind;
} Token;

static Token get_one_char_token(char c) {
    switch (c) {
        case '{':
            return (Token) {
                LBRACE,
                "OBJECT"
            };
        case '[':
            return (Token){
                LBRACK,
                "ARRAY"
            };
        case 't':
            return (Token){
                TRUE_LITERAL,
                "LITERAL"
            };
        case 'f':
            return (Token){
                FALSE_LITERAL,
                "LITERAL"
            };
        case 'n':
            return (Token){
                NULL_LITERAL,
                "LITERAL"
            };
        default:
            return (Token){
                ILLEGAL,
                "ILLEGAL"
            };
    }
}

#endif //TOKENIZER_H
