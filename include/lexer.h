#ifndef LEXER_H
#define LEXER_H

#include <ctype.h>
#include <stdio.h>
#include <string.h>

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
   char *type;
}Token;

static int parse_space(char v) {
   switch (v) {
      case '\n':
         return 0x0a;
      case ' ':
         return 0x20;
      case '\f':
         return 0x0c;
      case '\r':
         return 0x0d;
      case '\t':
         return 0x09;
      case '\v':
         return 0x0b;
      default:
         return 0x00;
   }
}

static const char* rmwhitespaces(const char *code) {
   char result[1024];
   const char* cp = &result;
   const char *empty_string = "";

   strncpy(result, code, sizeof(result));

   for (int i = 0; i < strlen(result); i++) {
      char* vp = &result[i];
      const int spc = isspace(parse_space(result[i]));

      if (spc != 0x00) {
         *vp = (char)empty_string;
      }
   }

   return cp;
}

static Token tokenize(char *code) {
   const char* code_transformed = rmwhitespaces(code);

   Token t = {NUMBER, "keyword"};

   return t;
}

#endif //LEXER_H