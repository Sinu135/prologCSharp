% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 21 de octubre de 2024
% Descripción: Se duplicará cada elemento de una lista un número N de veces
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         // Lista de entrada
%         List<int> input = new List<int> { 1, 2, 3, 4 };
%         int n = 3; // Número de veces que se duplicarán los elementos

%         // Llamada a la función para duplicar los elementos
%         List<int> duplicated = Dupli(input, n);

%         // Imprimir el resultado
%         Console.WriteLine(string.Join(", ", duplicated));
%     }

%     // Duplica los elementos de una lista un número dado de veces
%     static List<int> Dupli(List<int> lst, int n)
%     {
%         var duplicated = new List<int>();

%         foreach (var item in lst)
%         {
%             // Llamada a la función que crea una lista con el elemento duplicado N veces
%             duplicated.AddRange(Duplicate(item, n));
%         }

%         return duplicated;
%     }

%     // Crea una lista con N repeticiones del elemento X
%     static List<int> Duplicate(int x, int n)
%     {
%         var result = new List<int>();

%         for (int i = 0; i < n; i++)
%         {
%             result.Add(x);
%         }

%         return result;
%     }
% }


% ----------------------------------------------

% -------- Código en Prolog --------------------
% Duplica los elementos de una lista un número dado de veces.
% Caso base: la lista vacía se mantiene vacía.
dupli([], _, []).
% Caso recursivo: duplica el primer elemento N veces y continúa con el resto.
dupli([H|T], N, R) :- duplicate(H, N, D), dupli(T, N, R1), append(D, R1, R).

% Crea una lista con N repeticiones del elemento X.
duplicate(_, 0, []).
duplicate(X, N, [X|R]) :- N > 0, N1 is N - 1, duplicate(X, N1, R).
% Ejemplo de uso:
% dupli([a, b, c, d], 3, R), writeln(R), halt.
% ----------------------------------------------
