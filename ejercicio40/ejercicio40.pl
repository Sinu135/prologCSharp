% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Encuentra las composiciones de Goldbach para todos los números pares dentro de un rango.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main(string[] args)
%     {
%         Console.Write("Enter the lower bound of the range: ");
%         int low = int.Parse(Console.ReadLine());

%         Console.Write("Enter the upper bound of the range: ");
%         int high = int.Parse(Console.ReadLine());

%         List<Tuple<int, int, int>> goldbachList = GoldbachList(low, high);

%         if (goldbachList.Count > 0)
%         {
%             Console.WriteLine("Goldbach compositions for even numbers in the range:");
%             foreach (var tuple in goldbachList)
%             {
%                 Console.WriteLine($"{tuple.Item1} = {tuple.Item2} + {tuple.Item3}");
%             }
%         }
%         else
%         {
%             Console.WriteLine("No even numbers in the specified range have Goldbach compositions.");
%         }
%     }

%     // Método para encontrar la lista de composiciones de Goldbach para todos los números pares en un rango
%     static List<Tuple<int, int, int>> GoldbachList(int low, int high)
%     {
%         List<Tuple<int, int, int>> result = new List<Tuple<int, int, int>>();
%         for (int n = low; n <= high; n += 2)
%         {
%             List<int> pair = Goldbach(n);
%             if (pair != null)
%             {
%                 result.Add(new Tuple<int, int, int>(n, pair[0], pair[1]));
%             }
%         }
%         return result;
%     }

%     // Método para encontrar dos números primos que sumen el número dado (conjetura de Goldbach)
%     static List<int> Goldbach(int n)
%     {
%         if (n <= 2 || n % 2 != 0) return null;

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

goldbach(N, [P1, P2]) :- N > 2, N mod 2 =:= 0, prime_list(2, N, Primes), member(P1, Primes), P2 is N - P1, is_prime(P2).

% Encuentra las composiciones de Goldbach para todos los números pares dentro de un rango.
goldbach_list(Low, High, L) :- findall([N, P1, P2], (between(Low, High, N), N mod 2 =:= 0, goldbach(N, [P1, P2])), L).  
% ----------------------------------------------

% Ejemplo de uso:
% goldbach_list(10, 50, L), write(L).
% ----------------------------------------------
