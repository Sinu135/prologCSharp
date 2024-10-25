% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que determina los factores primos con su multiplicidad.
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

%     // Codifica los factores primos con su multiplicidad
%     static List<Tuple<int, int>> Encode(List<int> factors)
%     {
%         List<Tuple<int, int>> encoded = new List<Tuple<int, int>>();
%         int count = 1;
%         for (int i = 0; i < factors.Count; i++)
%         {
%             if (i < factors.Count - 1 && factors[i] == factors[i + 1])
%             {
%                 count++;
%             }
%             else
%             {
%                 encoded.Add(Tuple.Create(count, factors[i]));
%                 count = 1;
%             }
%         }
%         return encoded;
%     }

%     static void Main(string[] args)
%     {
%         Console.Write("Enter a number to find its prime factors with multiplicity: ");
%         int n = int.Parse(Console.ReadLine());

%         List<int> factors = PrimeFactors(n);
%         List<Tuple<int, int>> result = Encode(factors);

%         Console.WriteLine("Prime factors with multiplicity: ");
%         foreach (var item in result)
%         {
%             Console.WriteLine($"Factor: {item.Item2}, Multiplicity: {item.Item1}");
%         }
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, F, L).
prime_factors(N, F, L) :- N > 1, F * F > N, L = [N]. % Si no hay divisores menores, N es primo.
prime_factors(N, F, L) :- N > 1, F * F =< N, next_factor(F, F1), prime_factors(N, F1, L).

next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.

encode(L, R) :- pack(L, P), transform(P, R).

transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- length([X|Xs], N), transform(Ys, Zs).

pack([], []).
pack([X|Xs], [[X|Ys]|Zs]) :- transfer(X, Xs, Ys, Rest), pack(Rest, Zs).

transfer(X, [], [], []).
transfer(X, [Y|Ys], [], [Y|Ys]) :- X \= Y.
transfer(X, [X|Xs], [X|Ys], Rest) :- transfer(X, Xs, Ys, Rest).

% Determina los factores primos con su multiplicidad.
prime_factors_mult(N, L) :- prime_factors(N, F), encode(F, L).
% ----------------------------------------------

% Ejemplo de uso:
% prime_factors_mult(60, L), write(L), nl.
% ----------------------------------------------
