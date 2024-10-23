% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 21 de octubre de 2024
% Descripción: Extrae un fragmento de una lista en base a un rango
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
%         int start = 3; // Índice de inicio (1-based)
%         int end = 6;   // Índice de fin (1-based)

%         // Llamada a la función para extraer la porción
%         List<int> result = Slice(input, start, end);

%         // Imprimir el resultado
%         Console.WriteLine("Porción de la lista: " + string.Join(", ", result));
%     }

%     // Función para extraer una porción de una lista
%     static List<int> Slice(List<int> lst, int start, int end)
%     {
%         List<int> result = new List<int>();

%         // Convertimos los índices a base 0 para manejar en C#
%         int startIndex = start - 1;
%         int endIndex = end - 1;

%         // Iterar a través de la lista entre los índices indicados
%         for (int i = 0; i < lst.Count; i++)
%         {
%             if (i >= startIndex && i <= endIndex)
%             {
%                 result.Add(lst[i]);
%             }
%         }

%         return result;
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Extrae una porción de una lista, dado un rango.
% Los índices I y K deben ser mayores que 0.
slice([H|_], 1, 1, [H]).
slice([H|T], 1, K, [H|R]) :- K > 1, K1 is K - 1, slice(T, 1, K1, R).
slice([_|T], I, K, R) :- I > 1, I1 is I - 1, K1 is K - 1, slice(T, I1, K1, R).
% ----------------------------------------------