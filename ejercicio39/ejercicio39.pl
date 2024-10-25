% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que encuentra dos numeros primos que siemn un numero par dado
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main(string[] args)
%     {
%         Console.Write("Enter an even number greater than 2: ");
%         int n = int.Parse(Console.ReadLine());

%         if (n <= 2 || n % 2 != 0)
%         {
%             Console.WriteLine("The number must be even and greater than 2.");
%             return;
%         }

%         List<int> goldbachPair = Goldbach(n);

%         if (goldbachPair != null)
%         {
%             Console.WriteLine($"Goldbach pair for {n}: {goldbachPair[0]} + {goldbachPair[1]} = {n}");
%         }
%         else
%         {
%             Console.WriteLine($"No Goldbach pair found for {n}.");
%         }
%     }

%     // Método para encontrar dos números primos que sumen el número dado (conjetura de Goldbach)
%     static List<int> Goldbach(int n)
%     {
%         List<int> primes = PrimeList(2, n);
%         foreach (int p1 in primes)
%         {
%             int p2 = n - p1;
%             if (IsPrime(p2))
%             {
%                 return new List<int> { p1, p2 };
%             }
%         }
%         return null;
%     }

%     // Método que genera una lista de números primos en un rango dado
%     static List<int> PrimeList(int low, int high)
%     {
%         List<int> primes = new List<int>();
%         for (int i = low; i <= high; i++)
%         {
%             if (IsPrime(i))
%             {
%                 primes.Add(i);
%             }
%         }
%         return primes;
%     }

%     // Método para verificar si un número es primo
%     static bool IsPrime(int num)
%     {
%         if (num < 2) return false;
%         if (num == 2 || num == 3) return true;
%         if (num % 2 == 0) return false;

%         for (int i = 3; i * i <= num; i += 2)
%         {
%             if (num % i == 0)
%             {
%                 return false;
%             }
%         }
%         return true;
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
is_prime(2).
is_prime(3).
is_prime(P) :- P > 3, P mod 2 =\= 0, \+ has_factor(P, 3).

has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- L * L < N, L2 is L + 2, has_factor(N, L2).

prime_list(Low, High, Primes) :- findall(P, (between(Low, High, P), is_prime(P)), Primes).
% Encuentra dos números primos que sumen un número par dado según la conjetura de Goldbach.
% https://es.wikipedia.org/wiki/Conjetura_de_Goldbach
goldbach(N, [P1, P2]) :- N > 2, N mod 2 =:= 0, prime_list(2, N, Primes), member(P1, Primes), P2 is N - P1, is_prime(P2).
% ----------------------------------------------

% Ejemplo de uso:
% goldbach(28, Pair), write(Pair).
% ----------------------------------------------
