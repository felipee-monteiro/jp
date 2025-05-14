//
// Created by felipe on 14/05/25.
//

#ifndef UTILS_H
#define UTILS_H

#include <stdio.h>

static void printerror(const static char* e, const static int line, const static int col) {
    fprintf(stderr, "%s on line %d column %d\n", e, line, col);
}

#endif //UTILS_H
