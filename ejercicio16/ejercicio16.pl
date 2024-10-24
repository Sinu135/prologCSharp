% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 21 de octubre de 2024
% Descripción: Elimina cada n-esimo elemento de una lista
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
%         int n = 3; // Eliminar cada 3er elemento

%         // Llamada a la función para eliminar cada n-ésimo elemento
%         List<int> result = Drop(input, n);

%         // Imprimir el resultado
%         Console.WriteLine(string.Join(", ", result));
%     }

%     // Elimina cada n-ésimo elemento de una lista
%     static List<int> Drop(List<int> lst, int n)
%     {
%         return Drop(lst, n, n);
%     }

%     // Sobrecarga que incluye el contador
%     static List<int> Drop(List<int> lst, int k, int n)
%     {
%         var result = new List<int>();

%         for (int i = 0; i < lst.Count; i++)
%         {
%             if (k == 1)
%             {
%                 // Si el contador llega a 1, se reinicia el contador y no se agrega el elemento
%                 k = n;
%             }
%             else
%             {
%                 // Si el contador es mayor que 1, agregamos el elemento y disminuimos el contador
%                 result.Add(lst[i]);
%                 k--;
%             }
%         }

%         return result;
%     }
% }


% ----------------------------------------------

% -------- Código en Prolog --------------------
% Elimina cada n-ésimo elemento de una lista.
% Utiliza un contador para determinar cuándo eliminar un elemento.
drop(L, N, R) :- drop(L, N, N, R).

% Caso base: cuando la lista está vacía, el resultado es vacío.
drop([], _, _, []).
% Si el contador llega a 1, omite el primer elemento y reinicia el contador.
drop([_|T], 1, N, R) :- drop(T, N, N, R).
% Caso recursivo: disminuye el contador y conserva el elemento.
drop([H|T], K, N, [H|R]) :- K > 1, K1 is K - 1, drop(T, K1, N, R).
% Ejemplo de uso:
% drop([a, b, c, d, e, f, g, h], 3, R), writeln(R), halt.
% ----------------------------------------------
