% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que calcula la función totiente usando los factores primos con multiplicidad
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     // Método para encontrar los factores primos de un número con su multiplicidad
%     static List<Tuple<int, int>> PrimeFactorsMult(int n)
%     {
%         List<int> factors = PrimeFactors(n);
%         return Encode(factors);
%     }

%     // Método para encontrar los factores primos de un número
%     static List<int> PrimeFactors(int n)
%     {
%         List<int> factors = new List<int>();
%         FindPrimeFactors(n, 2, factors);
%         return factors;
%     }

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

%     static int GetNextFactor(int current)
%     {
%         if (current == 2) return 3;
%         return current + 2;
%     }

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
%                 encoded.Add(Tuple.Create(factors[i], count));
%                 count = 1;
%             }
%         }
%         return encoded;
%     }

%     // Método para calcular la función totiente de Euler mejorada
%     static int TotientImproved(int n)
%     {
%         List<Tuple<int, int>> primeFactors = PrimeFactorsMult(n);
%         return CalculateTotient(primeFactors);
%     }

%     // Calcula el valor totiente utilizando los factores primos y sus multiplicidades
%     static int CalculateTotient(List<Tuple<int, int>> primeFactors)
%     {
%         int phi = 1;
%         foreach (var factor in primeFactors)
%         {
%             int p = factor.Item1;
%             int m = factor.Item2;
%             phi *= (p - 1) * (int)Math.Pow(p, m - 1);
%         }
%         return phi;
%     }

%     static void Main(string[] args)
%     {
%         Console.Write("Enter a number to calculate its Totient (φ): ");
%         int n = int.Parse(Console.ReadLine());
%         int phi = TotientImproved(n);
%         Console.WriteLine($"Totient (φ) of {n} is: {phi}");
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, F, L).
prime_factors(N, F, L) :- N > 1, F * F < N, next_factor(F, F1), prime_factors(N, F1, L).

encode(L, R) :- pack(L, P), transform(P, R).

transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- length([X|Xs], N), transform(Ys, Zs).

pack([], []).
pack([X|Xs], [[X|Ys]|Zs]) :- transfer(X, Xs, Ys, Rest), pack(Rest, Zs).

transfer(X, [], [], []).
transfer(X, [Y|Ys], [], [Y|Ys]) :- X \= Y.
transfer(X, [X|Xs], [X|Ys], Rest) :- transfer(X, Xs, Ys, Rest).

next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.
prime_factors_mult(N, L) :- prime_factors(N, F), encode(F, L).

% Calcula la función totiente usando los factores primos con multiplicidad para mejorar la eficiencia.
% https://es.wikipedia.org/wiki/Función_φ_de_Euler
totient_improved(N, Phi) :- prime_factors_mult(N, F), totient_phi(F, Phi).

totient_phi([], 1).
totient_phi([[P, M]|T], Phi) :- totient_phi(T, Phi1), Phi is Phi1 * (P - 1) * P ** (M - 1).
% ----------------------------------------------

% Ejemplo de uso:
% totient_improved(36, Phi), write(Phi), nl.
% ----------------------------------------------
