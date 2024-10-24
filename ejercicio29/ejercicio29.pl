% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 22 de octubre de 2024
% Descripción: Ordena una lista de listas de acuerdo con la frecuencia de la longitud de las sublistas.
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
%             new List<int> { 7, 8 },
%             new List<int> { 9 },
%             new List<int> { 10, 11 }
%         };

%         // Obtener la frecuencia de longitudes
%         var lengthFrequency = LengthFrequency(listOfLists);

%         // Mostrar la frecuencia de longitudes
%         foreach (var item in lengthFrequency)
%         {
%             Console.WriteLine($"[{item.Item1}, {item.Item2}]");
%         }
%     }

%     // Codifica la lista usando la frecuencia de la longitud
%     static List<(int, int)> LengthFrequency(List<List<int>> lists)
%     {
%         // Mapea las longitudes a pares
%         var lengths = lists.Select(l => l.Count).ToList();
        
%         // Codifica la frecuencia de longitudes
%         return Encode(Pack(lengths));
%     }

%     // Empaqueta los elementos consecutivos en sublistas
%     static List<List<int>> Pack(List<int> lengths)
%     {
%         var result = new List<List<int>>();

%         if (lengths.Count == 0)
%             return result;

%         int current = lengths[0];
%         var group = new List<int> { current };

%         for (int i = 1; i < lengths.Count; i++)
%         {
%             if (lengths[i] == current)
%             {
%                 group.Add(lengths[i]);
%             }
%             else
%             {
%                 result.Add(group);
%                 group = new List<int> { lengths[i] };
%                 current = lengths[i];
%             }
%         }

%         result.Add(group); // Agregar el último grupo
%         return result;
%     }

%     // Codifica las longitudes y cuenta la frecuencia
%     static List<(int, int)> Encode(List<List<int>> packed)
%     {
%         var frequency = new List<(int, int)>();

%         foreach (var group in packed)
%         {
%             frequency.Add((group.Count, group[0])); // (frecuencia, longitud)
%         }

%         return frequency.GroupBy(x => x.Item2)
%                         .Select(g => (g.Count(), g.Key))
%                         .OrderBy(x => x.Item2)
%                         .ToList();
%     }
% }


% ----------------------------------------------

% -------- Código en Prolog --------------------
encode(L, R) :- pack(L, P), transform(P, R).

pack([], []).
pack([X|Xs], [[X|Ys]|Zs]) :- transfer(X, Xs, Ys, Rest), pack(Rest, Zs).

transfer(X, [], [], []).
transfer(X, [Y|Ys], [], [Y|Ys]) :- X \= Y.
transfer(X, [X|Xs], [X|Ys], Rest) :- transfer(X, Xs, Ys, Rest).

transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- length([X|Xs], N), transform(Ys, Zs).

% Ordena una lista de listas de acuerdo con la frecuencia de la longitud de las sublistas.
length_frequency(L, F) :- map_list_to_pairs(length, L, P), msort(P, SP), encode(SP, F).
% Ejemplo de uso:
% length_frequency([[a], [b, c], [d, e, f], [g, h, i, j]], F), writeln(F), halt.
% ----------------------------------------------
