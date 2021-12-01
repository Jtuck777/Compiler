grammar Interpreter;
//Tokens
AND       :  '&&';
BASE_TYPE :  'int'|'float'|'bool';
BREAK     :  'break';
DO        :  'do';
ELSE      :  'else';
EQ        :  '==';
FALSE     :  'false';
FOR       :  'for';
GE        :  '>=';

IF        :  'if';
LE        :  '<=';
NE        :  '!=';
NUM       :  '0'..'9'+;
OR        :  '||';
ID        : [a-zA-Z_] [a-zA-Z_0-9]*;
REAL      :  ('0'..'9')+('.'('0'..'9')+);
TRUE      :  'true';
WHILE     :  'while';
PLUS      :  '+';
MINUS     :  '-';
WHITESPACE: [ \r\n\t]+ -> skip;

start:
program;

expression
   :
   |   INT
   |   expression (PLUS | MINUS) expression
   ;

INT    :  '0'..'9'+;



program :
     block  EOF
  ;

block :
'{' decls  stmts '}'
;
decls:
/*epsilon*/|decls decl
;

decl:
type ID ';'
;
type:
'int'|'float'|'bool'
;
stmts:
/*epsilon*/|stmts stmt
;

stmt:

  IF'('allexpr')'stmt
| IF'('allexpr')'stmt ELSE stmt
| WHILE '('allexpr')'stmt
| DO stmt WHILE '('allexpr')' ';'
| FOR '('assign allexpr ';' incdecexpr')'  stmt
| BREAK';'
| block
| assign
;
assign:
ID '=' allexpr';'
;
allexpr:
  allexpr OR andexpr
| andexpr
;
andexpr:
  andexpr AND equal
| equal
;
equal:
  equal EQ rel
| equal NE rel
| rel
;
rel:
  expr '<' expr
| expr LE expr
| expr '>' expr
| expr GE expr
| expr
;
expr:
  expr '+' term
| expr '-' term
| term
;
term:
  term '*' factor
| term '/' factor
| factor
;
incdecexpr:
ID'+''+'|ID'-''-'
;
factor:
  '('allexpr')'
| incdecexpr
| ID
| NUM
| REAL
| TRUE
| FALSE
;


