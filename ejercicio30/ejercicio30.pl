% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 22 de octubre de 2024
% Descripción: Verifica si un numero dado tiene factores
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;

% public class PrimeChecker
% {
%     // Método principal para verificar si un número es primo.
%     public static bool IsPrime(int number)
%     {
%         if (number < 2) return false;  // Números menores que 2 no son primos.
%         if (number == 2) return true;   // 2 es primo.
%         if (number == 3) return true;   // 3 es primo.
%         if (number % 2 == 0) return false; // Números pares mayores que 2 no son primos.

%         return !HasFactor(number, 3);   // Verifica factores impares a partir de 3.
%     }

%     // Método para verificar si un número tiene factores.
%     private static bool HasFactor(int number, int divisor)
%     {
%         if (divisor * divisor > number) return false; // Si el cuadrado del divisor es mayor que el número, no hay más factores.

%         if (number % divisor == 0) return true; // Si el divisor es un factor, devuelve true.

%         return HasFactor(number, divisor + 2); // Verifica el siguiente divisor impar.
%     }

%     // Ejemplo de uso
%     public static void Main(string[] args)
%     {
%         Console.WriteLine(IsPrime(2));  // true
%         Console.WriteLine(IsPrime(3));  // true
%         Console.WriteLine(IsPrime(4));  // false
%         Console.WriteLine(IsPrime(29)); // true
%         Console.WriteLine(IsPrime(30)); // false
%     }
% }


% ----------------------------------------------

% -------- Código en Prolog --------------------
% Verifica si un número entero dado es primo.
is_prime(2).
is_prime(3).
is_prime(P) :- P > 3, P mod 2 =\= 0, \+ has_factor(P, 3).

% Verifica si un número tiene factores.
has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- L * L < N, L2 is L + 2, has_factor(N, L2).
% Ejemplo de uso:
% is_prime(29), writeln('29 es primo'), halt; writeln('29 no es primo').
% ----------------------------------------------
