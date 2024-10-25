% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que encuentra los factores primos de un numero
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     // Método para encontrar los factores primos de un número
%     static List<int> PrimeFactors(int n)
%     {
%         List<int> factors = new List<int>();
%         FindPrimeFactors(n, 2, factors);
%         return factors;
%     }

%     // Método recursivo para encontrar factores primos
%     static void FindPrimeFactors(int n, int factor, List<int> factors)
%     {
%         while (n % factor == 0)
%         {
%             factors.Add(factor);
%             n /= factor;
%         }

%         if (n > 1)
%         {
%             int nextFactor = GetNextFactor(factor);
%             if (factor * factor <= n)
%             {
%                 FindPrimeFactors(n, nextFactor, factors);
%             }
%             else
%             {
%                 factors.Add(n);  // El resto debe ser primo
%             }
%         }
%     }

%     // Encuentra el siguiente factor potencial
%     static int GetNextFactor(int current)
%     {
%         if (current == 2) return 3;
%         return current + 2;
%     }

%     static void Main(string[] args)
%     {
%         Console.Write("Enter a number to find its prime factors: ");
%         int n = int.Parse(Console.ReadLine());

%         List<int> factors = PrimeFactors(n);

%         Console.WriteLine("Prime factors: " + string.Join(", ", factors));
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Encuentra los factores primos de un número entero positivo.
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, F, L).
prime_factors(N, F, L) :- N > 1, F * F > N, L = [N]. % Si no hay divisores menores, N es primo.
prime_factors(N, F, L) :- N > 1, F * F =< N, next_factor(F, F1), prime_factors(N, F1, L).

next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.

% ----------------------------------------------

% Ejemplo de uso:
% prime_factors(60, L), write(L), nl.
% ----------------------------------------------
