% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 22 de octubre de 2024
% Descripción: Genera todas las combinaciones de una lista de elementos
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         List<int> list = new List<int> { 1, 2, 3, 4, 5 };
%         int K = 3;

%         // Llamada a la función para obtener todas las combinaciones de K elementos
%         List<List<int>> combinations = Combination(K, list);

%         // Mostrar las combinaciones
%         foreach (var comb in combinations)
%         {
%             Console.WriteLine(string.Join(", ", comb));
%         }
%     }

%     // Función que genera todas las combinaciones de K elementos
%     static List<List<int>> Combination(int K, List<int> list)
%     {
%         List<List<int>> result = new List<List<int>>();

%         if (K == 0)
%         {
%             // Si K es 0, la única combinación es la lista vacía
%             result.Add(new List<int>());
%         }
%         else if (list.Count > 0)
%         {
%             // Si la lista no está vacía, intentamos seleccionar el primer elemento
%             int head = list[0];
%             List<int> tail = list.GetRange(1, list.Count - 1);

%             // Combinaciones que incluyen el primer elemento
%             foreach (var comb in Combination(K - 1, tail))
%             {
%                 List<int> newComb = new List<int> { head };
%                 newComb.AddRange(comb);
%                 result.Add(newComb);
%             }

%             // Combinaciones que no incluyen el primer elemento
%             result.AddRange(Combination(K, tail));
%         }

%         return result;
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Genera todas las combinaciones de K elementos seleccionados de una lista dada.
combination(0, _, []).
combination(K, [H|T], [H|Comb]) :- K > 0, K1 is K - 1, combination(K1, T, Comb).
combination(K, [_|T], Comb) :- K > 0, combination(K, T, Comb).
% Ejemplo de uso:
% combination(2, [a, b, c, d], Comb), writeln(Comb), halt.
% ----------------------------------------------
