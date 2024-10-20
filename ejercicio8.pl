%===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 20 de octubre de 2024
% Descripción: Si hay elementos consecutivos en una lista, solo conserva una instancia
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         List<int> numbers = new List<int> { 1, 1, 2, 3, 3, 3, 4, 4, 5, 1, 1 };
%         List<int> compressedList = Compress(numbers);
%         Console.WriteLine("Lista comprimida (sin duplicados consecutivos): " + string.Join(", ", compressedList));
%     }

%     static List<int> Compress(List<int> list)
%     {
%         // Caso base: si la lista está vacía, devuelve una lista vacía
%         if (list.Count == 0)
%         {
%             return new List<int>();
%         }

%         // Caso base: si queda un solo elemento, devuelve ese elemento
%         if (list.Count == 1)
%         {
%             return new List<int> { list[0] };
%         }

%         // Caso recursivo: si el primer y segundo elemento son iguales, ignoramos el primero
%         if (list[0] == list[1])
%         {
%             return Compress(list.GetRange(1, list.Count - 1));
%         }

%         // Caso recursivo: si el primer y segundo elemento son distintos, conservamos el primero
%         List<int> result = new List<int> { list[0] };
%         result.AddRange(Compress(list.GetRange(1, list.Count - 1)));
%         return result;
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Elimina duplicados consecutivos de una lista.
% Caso base: una lista vacía se mantiene vacía.
compress([], []).
% Si queda un solo elemento, no hay duplicados.
compress([X], [X]).
% Caso recursivo: si el primer y segundo elemento son iguales, ignora el primero.
compress([X,X|T], R) :- compress([X|T], R).
% Si el primer y segundo elemento son distintos, conserva el primero.
compress([X,Y|T], [X|R]) :- X \= Y, compress([Y|T], R).
% ----------------------------------------------