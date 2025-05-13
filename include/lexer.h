#ifndef LEXER_H
#define LEXER_H

#include <ctype.h>
#include <stdio.h>
#include <regex.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <limits.h>

#define VALIDATION_ERROR "Please verify your JSON and try again"

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
}Token;

static int validate_open_and_close_ident(char o, char c) {
   return (o == '{' && c == '}') || (o == '[' && c == ']');
}

__attribute__((hot, always_inline))
static inline const char* rmwhitespaces(const char *code) {
   if (strlen(code) >= CHAR_MAX) {
      perror("Erro while trying to allocate string. Please verify the length");
      exit(EXIT_FAILURE);
   }

   char result[1024];

   strncpy(result, code, sizeof(result));

   int is_valid = validate_open_and_close_ident(result[0], result[strlen(result) - 1]);

   if (!is_valid) {
      perror(VALIDATION_ERROR);
      exit(EXIT_FAILURE);
   }

   for (int i = 0; i < strlen(result); i++) {
      const char* empty_string = "";
      char* vp = &result[i];
      const int spc = isspace((int)result[i]);

      if (spc == 0x00) {
         regex_t regex;

         static int ret;
         const char *padrao = "^:$";

         regcomp(&regex, padrao, REG_EXTENDED);

         ret = regexec(&regex, code, 0, NULL, 0);

         if (ret != 0) {
            if (ret == REG_NOMATCH) {
               perror(VALIDATION_ERROR);
               exit(EXIT_FAILURE);
            }
         }

         regfree(&regex);

         continue;
      }

      *vp = (char)empty_string;
   }

   return result;
}

static inline void tokenize(char *code) {
   rmwhitespaces(code);
}

#endif //LEXER_H