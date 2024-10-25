% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que checa si dos numeros son primos checando su maximo comun divisor
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

%     static void Main(string[] args)
%     {
%         Console.Write("Enter the first number: ");
%         int x = int.Parse(Console.ReadLine());

%         Console.Write("Enter the second number: ");
%         int y = int.Parse(Console.ReadLine());

%         int gcdResult = GCD(x, y);
%         Console.WriteLine($"The GCD of {x} and {y} is {gcdResult}");

%         bool coprimeResult = AreCoprime(x, y);
%         if (coprimeResult)
%         {
%             Console.WriteLine($"{x} and {y} are coprime.");
%         }
%         else
%         {
%             Console.WriteLine($"{x} and {y} are not coprime.");
%         }
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).
% Dos números son coprimos si su máximo común divisor es 1.
coprime(X, Y) :- gcd(X, Y, 1).
% ----------------------------------------------

% Ejemplo de uso:
% coprime(35, 64), write('Coprime'), nl.
% ----------------------------------------------
