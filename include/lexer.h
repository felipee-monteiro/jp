#ifndef LEXER_H
#define LEXER_H

#include <ctype.h>
#include <stdio.h>
#include <regex.h>
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

static const char* rmwhitespaces(const char *code) {
   char result[1024];
   const char* cp = &result;

   strncpy(result, code, sizeof(result));

   for (int i = 0; i < strlen(result); i++) {
      char* vp = &result[i];
      const int spc = isspace((int)result[i]);

      if (spc == 0x00) {
         //TODO: integrate tokenizer
         continue;
      }

      *vp = '\\';
   }

   return cp;
}

static Token tokenize(char *code) {
   const char* code_without_spaces = rmwhitespaces(code);
   regex_t regexp;

   printf("%s", code_without_spaces);

   Token t = {NUMBER, "keyword"};

   return t;
}

#endif //LEXER_H