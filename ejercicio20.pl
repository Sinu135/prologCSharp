% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 21 de octubre de 2024
% Descripción: Elimina el k-esimo elemento de una lista
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
%         int k = 4; // Índice del elemento a eliminar (1-based)

%         // Llamada a la función para eliminar el k-ésimo elemento
%         (int removedElement, List<int> result) = RemoveAt(input, k);

%         // Imprimir el resultado
%         Console.WriteLine($"Elemento eliminado: {removedElement}");
%         Console.WriteLine("Lista resultante: " + string.Join(", ", result));
%     }

%     // Función para eliminar el k-ésimo elemento de una lista
%     static (int, List<int>) RemoveAt(List<int> lst, int k)
%     {
%         // Verificar que el índice es válido
%         if (k < 1 || k > lst.Count)
%         {
%             throw new ArgumentOutOfRangeException("k", "El índice debe estar entre 1 y la longitud de la lista.");
%         }

%         // Crear una nueva lista para almacenar el resultado
%         List<int> result = new List<int>();
%         int removedElement = 0;

%         // Recorrer la lista original
%         for (int i = 0; i < lst.Count; i++)
%         {
%             if (i == k - 1)
%             {
%                 // Si es el índice a eliminar, lo almacenamos y lo omitimos en el resultado
%                 removedElement = lst[i];
%                 continue;
%             }
%             result.Add(lst[i]);
%         }

%         return (removedElement, result);
%     }
% }


% ----------------------------------------------

% -------- Código en Prolog --------------------
% Elimina el k-ésimo elemento de una lista.
% El índice K debe ser mayor que 0.
remove_at(X, [X|T], 1, T).
remove_at(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, remove_at(X, T, K1, R).
% ----------------------------------------------