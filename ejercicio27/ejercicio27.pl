% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 22 de octubre de 2024
% Descripción: Agrupa los elementos de un conjunto en subconjuntos disjuntos dados los tamaños de los subgrupos.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;

% class Program
% {
%     static void Main()
%     {
%         List<int> elements = new List<int> { 1, 2, 3, 4, 5, 6 };
%         List<int> groupSizes = new List<int> { 2, 2, 2 };

%         // Llamada a la función para agrupar los elementos en subconjuntos disjuntos
%         List<List<List<int>>> groups = Group(groupSizes, elements);

%         // Mostrar los grupos
%         foreach (var group in groups)
%         {
%             foreach (var subgroup in group)
%             {
%                 Console.WriteLine(string.Join(", ", subgroup));
%             }
%             Console.WriteLine();
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

%     // Función para agrupar los elementos en subconjuntos disjuntos
%     static List<List<List<int>>> Group(List<int> groupSizes, List<int> elements)
%     {
%         List<List<List<int>>> result = new List<List<List<int>>>();

%         if (groupSizes.Count == 0)
%         {
%             // Si no hay más grupos por formar, se añade una lista vacía
%             result.Add(new List<List<int>>());
%         }
%         else
%         {
%             int currentGroupSize = groupSizes[0];
%             List<int> remainingGroupSizes = groupSizes.Skip(1).ToList();

%             // Generamos todas las combinaciones posibles para el tamaño actual del grupo
%             List<List<int>> currentCombinations = Combination(currentGroupSize, elements);

%             foreach (var combination in currentCombinations)
%             {
%                 // Eliminamos los elementos que ya están en la combinación
%                 List<int> remainingElements = Subtract(elements, combination);

%                 // Generamos los grupos restantes de forma recursiva
%                 foreach (var remainingGroups in Group(remainingGroupSizes, remainingElements))
%                 {
%                     // Añadimos el grupo actual al resultado
%                     List<List<int>> newGroup = new List<List<int>> { combination };
%                     newGroup.AddRange(remainingGroups);
%                     result.Add(newGroup);
%                 }
%             }
%         }

%         return result;
%     }

%     // Función que elimina los elementos de una lista que están en otra lista
%     static List<int> Subtract(List<int> list, List<int> toRemove)
%     {
%         return list.Where(e => !toRemove.Contains(e)).ToList();
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
combination(0, _, []).
combination(K, [H|T], [H|Comb]) :- K > 0, K1 is K - 1, combination(K1, T, Comb).
combination(K, [_|T], Comb) :- K > 0, combination(K, T, Comb).

% Agrupa los elementos de un conjunto en subconjuntos disjuntos dados los tamaños de los subgrupos.
group([], [], []).
group([N|Ns], Es, [G|Gs]) :- combination(N, Es, G), subtract(Es, G, Rest), group(Ns, Rest, Gs).
% Ejemplo de uso:
% group([2, 2], [a, b, c, d], G), writeln(G), halt.
% ----------------------------------------------
