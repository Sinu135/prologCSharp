% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 21 de octubre de 2024
% Descripción: Divide una lista, agarrando el numero de elementos de la primera lista con la variable N
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         // Lista de entrada
%         List<int> input = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
%         int n = 3; // Número de elementos para la primera parte

%         // Llamada a la función para dividir la lista
%         (List<int> firstPart, List<int> secondPart) = Split(input, n);

%         // Imprimir el resultado
%         Console.WriteLine("Primera parte: " + string.Join(", ", firstPart));
%         Console.WriteLine("Segunda parte: " + string.Join(", ", secondPart));
%     }

%     // Divide una lista en dos partes
%     static (List<int>, List<int>) Split(List<int> lst, int n)
%     {
%         List<int> firstPart = new List<int>();
%         List<int> secondPart = new List<int>();

%         for (int i = 0; i < lst.Count; i++)
%         {
%             if (i < n)
%             {
%                 firstPart.Add(lst[i]);
%             }
%             else
%             {
%                 secondPart.Add(lst[i]);
%             }
%         }

%         return (firstPart, secondPart);
%     }
% }


% ----------------------------------------------

% -------- Código en Prolog --------------------
% Divide una lista en dos partes.
% La longitud de la primera parte está dada por el segundo argumento.
split(L, 0, [], L).
split([H|T], N, [H|L1], L2) :- N > 0, N1 is N - 1, split(T, N1, L1, L2).
% ----------------------------------------------