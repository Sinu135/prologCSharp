% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que calcula el minimo común divisor con el algoritmo de Euclides.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;

% class Program
% {
%     static int GCD(int x, int y)
%     {
%         if (y == 0)
%         {
%             return x;
%         }
%         return GCD(y, x % y);
%     }

%     static void Main(string[] args)
%     {
%         Console.Write("Enter the first number: ");
%         int x = int.Parse(Console.ReadLine());

%         Console.Write("Enter the second number: ");
%         int y = int.Parse(Console.ReadLine());

%         int result = GCD(x, y);
%         Console.WriteLine($"The GCD of {x} and {y} is {result}");
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).  
% ----------------------------------------------

% Ejemplo de uso:
% gcd(48, 18, G), write(G).
% ----------------------------------------------
