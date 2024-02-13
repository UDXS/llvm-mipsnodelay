#ifndef CUSTOM_INST_H
#define CUSTOM_INST_H

#define PASS(x) asm ("mtc0 %0, $23\n" : : "r"(x))

#define FAIL(x) asm ("mtc0 %0, $24\n" : : "r"(x))

#define DONE(x) asm ("mtc0 %0, $25\n" : : "r"(x))

#endif