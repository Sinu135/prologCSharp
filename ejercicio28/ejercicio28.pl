% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 22 de octubre de 2024
% Descripción: Ordena una lista de listas de acuerdo con la longitud de las sublistas.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;

% class Program
% {
%     static void Main()
%     {
%         // Ejemplo de lista de listas
%         List<List<int>> listOfLists = new List<List<int>>
%         {
%             new List<int> { 1, 2, 3 },
%             new List<int> { 4, 5 },
%             new List<int> { 6 },
%             new List<int> { 7, 8, 9, 10 }
%         };

%         // Ordenar la lista de listas por la longitud de cada sublista
%         List<List<int>> sortedList = LSort(listOfLists);

%         // Mostrar la lista ordenada
%         foreach (var sublist in sortedList)
%         {
%             Console.WriteLine($"[{string.Join(", ", sublist)}]");
%         }
%     }

%     // Función que ordena una lista de listas según la longitud de las sublistas
%     static List<List<T>> LSort<T>(List<List<T>> lists)
%     {
%         // Utiliza LINQ para ordenar las listas según su longitud
%         return lists.OrderBy(sublist => sublist.Count).ToList();
%     }
% }


% ----------------------------------------------

% -------- Código en Prolog --------------------
% Ordena una lista de listas de acuerdo con la longitud de las sublistas.
lsort(L, S) :- map_list_to_pairs(length, L, P), keysort(P, SP), pairs_values(SP, S).
% Ejemplo de uso:
% lsort([[a], [b, c], [d, e, f]], S), writeln(S), halt.
% ----------------------------------------------
