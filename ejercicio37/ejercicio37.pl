% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que compara los dos métodos para calcular la función totiente.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main(string[] args)
%     {
%         Console.Write("Enter a number to calculate its Totient: ");
%         int n = int.Parse(Console.ReadLine());

%         int phi1 = TotientBasic(n);
%         int phi2 = TotientImproved(n);

%         Console.WriteLine($"Phi (basic method): {phi1}");
%         Console.WriteLine($"Phi (improved method): {phi2}");
%     }

%     // Método básico para calcular la función totiente
%     static int TotientBasic(int n)
%     {
%         if (n == 1) return 1;
%         int phi = 0;
%         for (int i = 1; i < n; i++)
%         {
%             if (Coprime(n, i))
%             {
%                 phi++;
%             }
%         }
%         return phi;
%     }

%     // Método para comprobar si dos números son coprimos
%     static bool Coprime(int x, int y)
%     {
%         return Gcd(x, y) == 1;
%     }

%     // Método para calcular el máximo común divisor (GCD) usando el algoritmo de Euclides
%     static int Gcd(int x, int y)
%     {
%         while (y != 0)
%         {
%             int temp = y;
%             y = x % y;
%             x = temp;
%         }
%         return x;
%     }

%     // Método mejorado para calcular la función totiente usando factores primos
%     static int TotientImproved(int n)
%     {
%         var primeFactors = PrimeFactorsMult(n);
%         return CalculateTotient(primeFactors);
%     }

%     // Método para encontrar los factores primos de un número con su multiplicidad
%     static List<Tuple<int, int>> PrimeFactorsMult(int n)
%     {
%         List<int> factors = PrimeFactors(n);
%         return Encode(factors);
%     }

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
%                 factors.Add(n);
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
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
totient(1, 1).
totient(M, Phi) :- M > 1, totient_acc(M, M, 0, Phi).

totient_acc(_, 0, Acc, Acc).
totient_acc(M, K, Acc, Phi) :- K > 0, coprime(M, K), Acc1 is Acc + 1, K1 is K - 1, totient_acc(M, K1, Acc1, Phi).
totient_acc(M, K, Acc, Phi) :- K > 0, \+ coprime(M, K), K1 is K - 1, totient_acc(M, K1, Acc, Phi).

coprime(X, Y) :- gcd(X, Y, 1).

gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

totient_improved(N, Phi) :- prime_factors_mult(N, F), totient_phi(F, Phi).

totient_phi([], 1).
totient_phi([[P, M]|T], Phi) :- totient_phi(T, Phi1), Phi is Phi1 * (P - 1) * P ** (M - 1).

% Determina los factores primos con su multiplicidad.
prime_factors_mult(N, L) :- prime_factors(N, F), encode(F, L).

% Encuentra los factores primos de un número entero positivo.
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, F, L).
prime_factors(N, F, L) :- N > 1, F * F < N, next_factor(F, F1), prime_factors(N, F1, L).

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

% Compara los dos métodos para calcular la función totiente.
compare_totient(N) :- totient(N, Phi1), totient_improved(N, Phi2), write('Phi (método básico): '), write(Phi1), nl, write('Phi (método mejorado): '), write(Phi2), nl.
% ----------------------------------------------

% Ejemplo de uso:
% compare_totient(36).
% ----------------------------------------------
