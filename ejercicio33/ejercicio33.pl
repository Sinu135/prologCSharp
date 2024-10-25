% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que calcula la funcion totiente de Euler
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;

% class Program
% {
%     // Método para calcular el MCD usando el algoritmo de Euclides
%     static int GCD(int x, int y)
%     {
%         if (y == 0)
%         {
%             return x;
%         }
%         return GCD(y, x % y);
%     }

%     // Método para verificar si dos números son coprimos
%     static bool AreCoprime(int x, int y)
%     {
%         return GCD(x, y) == 1;
%     }

%     // Método para calcular la función totiente de Euler
%     static int Totient(int m)
%     {
%         if (m == 1) return 1;

%         int count = 0;
%         for (int k = 1; k < m; k++)
%         {
%             if (AreCoprime(m, k))
%             {
%                 count++;
%             }
%         }
%         return count;
%     }

%     static void Main(string[] args)
%     {
%         Console.Write("Enter a number to calculate its Euler's Totient: ");
%         int m = int.Parse(Console.ReadLine());

%         int phi = Totient(m);
%         Console.WriteLine($"The Euler's Totient (phi) of {m} is {phi}");
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).
coprime(X, Y) :- gcd(X, Y, 1).

% Calcula la función totiente de Euler, que cuenta cuántos números menores que M son coprimos con M.
% https://es.wikipedia.org/wiki/Función_φ_de_Euler
totient(1, 1).
totient(M, Phi) :- M > 1, totient_acc(M, M, 0, Phi).

totient_acc(_, 0, Acc, Acc).
totient_acc(M, K, Acc, Phi) :- K > 0, coprime(M, K), Acc1 is Acc + 1, K1 is K - 1, totient_acc(M, K1, Acc1, Phi).
totient_acc(M, K, Acc, Phi) :- K > 0, \+ coprime(M, K), K1 is K - 1, totient_acc(M, K1, Acc, Phi).
% ----------------------------------------------

% Ejemplo de uso:
% totient(10, Phi), write(Phi), nl.
% ----------------------------------------------
