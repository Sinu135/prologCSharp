% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Genera una lista de numeros primos en un rango
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main(string[] args)
%     {
%         Console.Write("Enter the lower bound: ");
%         int low = int.Parse(Console.ReadLine());

%         Console.Write("Enter the upper bound: ");
%         int high = int.Parse(Console.ReadLine());

%         List<int> primes = PrimeList(low, high);

%         Console.WriteLine("Prime numbers in the range:");
%         foreach (int prime in primes)
%         {
%             Console.WriteLine(prime);
%         }
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

% Genera una lista de números primos en un rango dado.
prime_list(Low, High, Primes) :- findall(P, (between(Low, High, P), is_prime(P)), Primes).
% ----------------------------------------------

% Ejemplo de uso:
% prime_list(10, 50, Primes), write(Primes).
% ----------------------------------------------
