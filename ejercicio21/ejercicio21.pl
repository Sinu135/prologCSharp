% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 22 de octubre de 2024
% Descripción: Inserta un elemento en la posicion dada de una lista con recursividad
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         // Lista de entrada
%         List<int> input = new List<int> { 1, 2, 3, 4, 5 };
%         int elementToInsert = 99; // Elemento a insertar
%         int position = 3;         // Posición donde insertar el elemento

%         // Llamada a la función para insertar el elemento en la posición dada
%         List<int> result = InsertAt(elementToInsert, input, position);

%         // Imprimir el resultado
%         Console.WriteLine("Lista resultante: " + string.Join(", ", result));
%     }

%     // Función para insertar un elemento en una lista en una posición dada
%     static List<int> InsertAt(int element, List<int> lst, int position)
%     {
%         // Manejar casos en los que la posición no es válida
%         if (position < 1 || position > lst.Count + 1)
%         {
%             throw new ArgumentOutOfRangeException(nameof(position), "La posición está fuera del rango permitido.");
%         }

%         // Crear una nueva lista para almacenar el resultado
%         List<int> result = new List<int>(lst);

%         // Insertar el elemento en la posición dada (índices en C# son 0-based, por eso position - 1)
%         result.Insert(position - 1, element);

%         return result;
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Inserta un elemento en una lista en la posición dada.
% El índice K debe ser mayor que 0.
insert_at(X, L, 1, [X|L]).
insert_at(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, insert_at(X, T, K1, R).
% Ejemplo de uso:
% insert_at(a, [b, c, d], 2, R), writeln(R), halt.
% ----------------------------------------------
