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
#define ALLOC_ERROR "Error while trying to allocate resources, so fuck you :D"
#define DELIMITER " "
#define MAX_PER_LINE_BUFFER_LENGTH 1024

static int validate_open_and_close_ident(char o, char c) {
   return (o == '{' && c == '}') || (o == '[' && c == ']');
}

static void transform(const char *code) {
   int llength = strlen(code);

	if (llength > MAX_PER_LINE_BUFFER_LENGTH || llength >= CHAR_MAX) {
      perror(ALLOC_ERROR);
      exit(EXIT_FAILURE);
   }

   char result[MAX_PER_LINE_BUFFER_LENGTH];

   strncpy(result, code, sizeof(result));

   int is_valid = validate_open_and_close_ident(result[0], result[strlen(result) - 1]);

   if (!is_valid) {
      perror(VALIDATION_ERROR);
      exit(EXIT_FAILURE);
   }

   for (size_t i = 0; i < strlen(result); ++i) {
      char l = result[i];
		const int li = (int)l;
      const int spc = isspace(li);
		const int blk = isblank(li);

      if (!spc && !blk) {		
			Token t = get_one_char_token(l);
					
         if (strcmp(t.kind, "OBJECT") == 0) {
            char* tk;

            tk = strtok(result, DELIMITER);

            while (tk != NULL) {
					printf("Token: %s\n", tk);
					tk = strtok(NULL, DELIMITER);
				}
         }
      }
   }
}

static void tokenize(char *code) {
   transform(code);
}

#endif //LEXER_H
