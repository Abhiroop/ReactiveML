type token =
  | AMPERAMPER
  | AMPERSAND
  | AND
  | AS
  | ASSERT
  | AWAIT
  | BACKQUOTE
  | BACKSLASHSLASH
  | BAR
  | BARBAR
  | BARRBRACKET
  | BARGRATER
  | BEGIN
  | CHAR of (char)
  | CLASS
  | COLON
  | COLONCOLON
  | COLONEQUAL
  | COLONGREATER
  | COMMA
  | CONSTRAINT
  | CONTROL
  | DEFAULT
  | DO
  | DONE
  | DOPAR
  | DOT
  | DOTDOT
  | DOWNTO
  | ELSE
  | EMIT
  | END
  | EOF
  | EQUAL
  | EXCEPTION
  | EXTERNAL
  | FALSE
  | FLOAT of (float)
  | FOR
  | FUN
  | FUNCTION
  | FUNCTOR
  | GATHER
  | GREATER
  | GREATERRBRACE
  | GREATERRBRACKET
  | HALT
  | IF
  | IMMEDIATE
  | IN
  | INCLUDE
  | INFIXOP0 of (string)
  | INFIXOP1 of (string)
  | INFIXOP2 of (string)
  | INFIXOP3 of (string)
  | INFIXOP4 of (string)
  | INHERIT
  | INITIALIZER
  | INT of (int)
  | INT32 of (int32)
  | INT64 of (int64)
  | LABEL of (string)
  | LAST
  | LAZY
  | LBRACE
  | LBRACELESS
  | LBRACKET
  | LBRACKETBAR
  | LBRACKETLESS
  | LESS
  | LESSMINUS
  | LET
  | LIDENT of (string)
  | LOOP
  | LPAREN
  | MATCH
  | MEMORY
  | METHOD
  | MINUS
  | MINUSDOT
  | MINUSGREATER
  | MODULE
  | MUTABLE
  | NATIVEINT of (nativeint)
  | NEW
  | NOTHING
  | OBJECT
  | OF
  | ONE
  | OPEN
  | OPTLABEL of (string)
  | OR
  | PAUSE
  | PLUS
  | PRE
  | PREFIXOP of (string)
  | PRESENT
  | PRIVATE
  | PROC
  | PROCESS
  | QUESTION
  | QUESTIONQUESTION
  | QUOTE
  | RBRACE
  | RBRACKET
  | REC
  | RPAREN
  | RUN
  | SEMI
  | SEMISEMI
  | SHARP
  | SIG
  | SIGNAL
  | SLASHBACKSLASH
  | STAR
  | STRING of (string)
  | STRUCT
  | THEN
  | TILDE
  | TO
  | TRUE
  | TRY
  | TYPE
  | UIDENT of (string)
  | UNDERSCORE
  | UNTIL
  | VAL
  | VIRTUAL
  | WHEN
  | WHILE
  | WITH

val implementation :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Parse_ast.implementation
val interface :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Parse_ast.interface
val interactive :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Parse_ast.implementation
