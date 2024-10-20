% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 20 de octubre de 2024
% Descripción: Calcula la longitud de una lista con recursion
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         List<int> numbers = new List<int> { 1, 2, 3, 4, 5 };
%         int length = ListLength(numbers);
%         Console.WriteLine($"La longitud de la lista es: {length}");
%     }

%     static int ListLength(List<int> list)
%     {
%         // Caso base: si la lista está vacía, su longitud es 0
%         if (list.Count == 0)
%         {
%             return 0;
%         }
%         // Caso recursivo: la longitud es 1 más que la longitud de la cola
%         else
%         {
%             return 1 + ListLength(list.GetRange(1, list.Count - 1));
%         }
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Calcula el número de elementos de una lista.
% Caso base: una lista vacía tiene longitud 0.
list_length([], 0).
% Caso recursivo: la longitud es 1 más que la longitud de la cola.
list_length([_|T], N) :- list_length(T, N1), N is N1 + 1.
% ----------------------------------------------