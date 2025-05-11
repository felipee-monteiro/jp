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

enum JS_TOKEN {
   JS__OBJECT = 6,
   JS__ARRAY = 5
};

typedef struct {
   enum JsonToken value;
   char *type;
}Token;

static int validate_open_and_close_ident(char o, char c) {
   if (o == '{' && c == '}') {
      return 1;
   }

   if (o == '[' && c == ']') {
      return 1;
   }

   return 0;
}

static const char* rmwhitespaces(const char *code) {
   if (strlen(code) >= CHAR_MAX) {
      perror("Erro while trying to allocate string. Please verify the length");
      exit(EXIT_FAILURE);
   }

   char result[1024];
   const char* cp = &result;
   char* empty_string = "";

   strncpy(result, code, sizeof(result));

   for (int i = 0; i < strlen(result); i++) {
         int is_valid = validate_open_and_close_ident(result[0], result[strlen(result) - 1]);

         if (!is_valid) {
            perror("Please specify a valid JSON string");
            exit(EXIT_FAILURE);
            break;
         }

      char* vp = &result[i];
      const int spc = isspace((int)result[i]);

      if (spc == 0x00) {
         //TODO: integrate tokenizer
         continue;
      }

      *vp = empty_string;
   }

   return cp;
}

static Token tokenize(char *code) {
   const char* code_without_spaces = rmwhitespaces(code);
   const static char* comma_pattern = "^\"+$";
   int exec_comma_regexp_status = 0;
   regex_t comma_regexp;

   regcomp(&comma_regexp, comma_pattern, REG_NOSUB);

   exec_comma_regexp_status = regexec(&comma_regexp, code_without_spaces, 0, NULL, 0);

   if (exec_comma_regexp_status != 0) {
      if (exec_comma_regexp_status == REG_NOMATCH) {
         perror("Please verify your JSON and try again");
         exit(EXIT_FAILURE);
      }

      char error_msg[180];
      regerror(exec_comma_regexp_status, &comma_regexp, error_msg, sizeof(error_msg));
      perror(error_msg);
      exit(EXIT_FAILURE);
   }

   regfree(&comma_regexp);

   Token t = {NUMBER, "keyword"};

   return t;
}

#endif //LEXER_H