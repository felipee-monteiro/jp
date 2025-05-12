#ifndef LEXER_H
#define LEXER_H

#include <ctype.h>
#include <stdio.h>
#include <regex.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <limits.h>

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

static int validate_open_and_close_ident(char o, char c) {
   return (o == '{' && c == '}' || (o == '[' && c == ']'));
}

static const char* rmwhitespaces(const char *code) {
   if (strlen(code) >= CHAR_MAX) {
      perror("Erro while trying to allocate string. Please verify the length");
      exit(EXIT_FAILURE);
   }

   char result[1024];

   strncpy(result, code, sizeof(result));

   int is_valid = validate_open_and_close_ident(result[0], result[strlen(result) - 1]);

   if (!is_valid) {
      perror("Please specify a valid JSON string");
      exit(EXIT_FAILURE);
   }

   for (int i = 0; i < strlen(result); i++) {
      const static char* empty_string = "";
      char* vp = &result[i];

      char* value = (char*)result[i];
      const int spc = isspace((int)result[i]);

      if (spc == 0x00) {
         if ((char)value == '\"') {
            regex_t regex;
            int ret;
            const char *padrao = "\\b\"\\b";

            regcomp(&regex, padrao, REG_NOSUB);

            ret = regexec(&regex, code, 0, NULL, 0);

            if (!ret) {
               printf("A string corresponde\n");
            } else {
               printf("A string NÃO corresponde.\n");
            }

            regfree(&regex);
         }

         continue;
      }

      *vp = (char)empty_string;
   }

   return result;
}

static void tokenize(char *code) {
   rmwhitespaces(code);
}

#endif //LEXER_H