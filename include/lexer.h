#ifndef LEXER_H
#define LEXER_H

#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <limits.h>

#include "tokenizer.h"

#define VALIDATION_ERROR "Please verify your JSON and try again"

static int validate_open_and_close_ident(char o, char c) {
   return (o == '{' && c == '}') || (o == '[' && c == ']');
}

__attribute__((hot, always_inline))
static inline void transform(const char *code) {
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
      char l = result[i];
      const int spc = isspace((int)l);

      if (!spc) {
         Token t = get_one_char_token(l);

         if (t.kind == "OBJECT") {
            char* tk;

            tk = strtok(result, "{}");

            do {
               printf("token: %s\n", tk);
               tk = strtok(NULL, ",");
            } while (tk != NULL);
         }
      }
   }
}

static inline void tokenize(char *code) {
   transform(code);
}

#endif //LEXER_H