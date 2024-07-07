# Toy Compiler

This project is a toy compiler implemented using Flex and Bison. It can tokenize and parse a simple custom language defined in `cucu.l` and `cucu.y` files.

## Features

- **Lexical Analysis:** Tokenizes numbers, variables, keywords, and special characters.
- **Syntax Analysis:** Parses the tokenized input using BNF grammar rules.
- **Error Handling:** Displays error messages for any syntax errors.

## Technologies Used

- **Flex:** Used for lexical analysis (tokenization).
- **Bison:** Used for syntax analysis (parsing).
- **C:** Core programming language used for implementing the compiler.

## Installation and Usage

### Instructions for running the toy compiler:

1. **Run Flex to generate the lexical analyzer:**
   ```bash
   flex cucu.l
1. **Run Bison to generate the parser:**
   ```bash
   bison -d cucu.y
1. **Compile the generated files:**
   ```bash
   gcc lex.yy.c cucu.tab.c -o compiler
1. **Run the compiler:**
   ```bash
   ./compiler
## Sample Test Files

### sample1.cu

- **Description:** This is an example test file used for testing the toy compiler.
- **Usage:** It contains sample code snippets written in the custom language defined by the BNF grammar rules in `cucu.y`.

### sample2.cu

- **Description:** Another test file for the toy compiler.
- **Usage:** Similar to `sample1.cu`, it contains additional code examples to validate the compiler's functionality.

These test files are crucial for ensuring the correctness and functionality of the toy compiler across various inputs and scenarios.

