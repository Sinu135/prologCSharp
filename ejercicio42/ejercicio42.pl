% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Genera una tabla de verdad para una expresión lógica en dos variables.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;

% class Program
% {
%     static void Main(string[] args)
%     {
%         // Definir la expresión lógica aquí como una función lambda
%         Func<bool, bool, bool> expr = (a, b) => a && b;  // Puedes cambiar esto para la expresión lógica que desees

%         // Generar la tabla de verdad para la expresión lógica
%         TruthTable(expr);
%     }

%     static void TruthTable(Func<bool, bool, bool> expr)
%     {
%         Console.WriteLine("A B Result");
%         bool[] values = { true, false };

%         foreach (bool a in values)
%         {
%             foreach (bool b in values)
%             {
%                 bool result = expr(a, b);
%                 Console.WriteLine($"{a} {b} {result}");
%             }
%         }
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Genera una tabla de verdad para una expresión lógica en dos variables.
% A y B son las variables lógicas y Expr es la expresión lógica que se evalúa.
table(A, B, Expr) :- write(A), write(' '), write(B), write(' '), call(Expr), nl, fail.
table(_, _, _).

and(A, B) :- A, B.
or(A, _) :- A.
or(_, B) :- B.
nand(A, B) :- \+ (A, B).
nor(A, B) :- \+ (A; B).
xor(A, B) :- A, \+ B; \+ A, B.
impl(A, B) :- \+ A; B.
equ(A, B) :- A, B; \+ A, \+ B.
% ----------------------------------------------

% Ejemplo de uso:
% table(true, true, and(true, true)), table(true, false, and(true, false)), table(false, true, and(false, true)), table(false, false, and(false, false)), halt.
% ----------------------------------------------
