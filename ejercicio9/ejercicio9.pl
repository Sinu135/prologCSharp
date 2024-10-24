%===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 20 de octubre de 2024
% Descripción: Si hay elementos consecutivos en una lista, los agrupa en una sublista
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         List<int> numbers = new List<int> { 1, 1, 2, 3, 3, 3, 4, 4, 5, 1, 1 };
%         List<List<int>> packedList = Pack(numbers);
        
%         // Imprimir la lista agrupada
%         foreach (var sublist in packedList)
%         {
%             Console.WriteLine("[" + string.Join(", ", sublist) + "]");
%         }
%     }

%     // Función principal para agrupar duplicados consecutivos
%     static List<List<int>> Pack(List<int> list)
%     {
%         // Caso base: si la lista está vacía, devuelve una lista vacía
%         if (list.Count == 0)
%         {
%             return new List<List<int>>();
%         }

%         // Llamada a la función auxiliar 'Transfer' para agrupar duplicados
%         List<int> currentGroup = new List<int>();
%         List<int> rest;
%         Transfer(list[0], list.GetRange(1, list.Count - 1), currentGroup, out rest);

%         // Crear la sublista con los duplicados y continuar recursivamente con el resto
%         List<List<int>> result = new List<List<int>> { currentGroup };
%         result.AddRange(Pack(rest));

%         return result;
%     }

%     // Función auxiliar 'Transfer' para mover duplicados consecutivos a una sublista
%     static void Transfer(int x, List<int> list, List<int> group, out List<int> rest)
%     {
%         group.Add(x);

%         // Caso base: si la lista está vacía, no queda nada más que procesar
%         if (list.Count == 0)
%         {
%             rest = new List<int>();
%             return;
%         }

%         // Si el siguiente elemento es diferente, termina la transferencia
%         if (list[0] != x)
%         {
%             rest = list;
%             return;
%         }

%         // Si el siguiente elemento es igual, agrégalo al grupo y sigue transfiriendo
%         Transfer(x, list.GetRange(1, list.Count - 1), group, out rest);
%     }
% }


% ----------------------------------------------

% -------- Código en Prolog --------------------
% Agrupa duplicados consecutivos de una lista en sublistas.
% Caso base: una lista vacía se agrupa como una lista vacía.
pack([], []).
% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
pack([X|Xs], [[X|Ys]|Zs]) :- transfer(X, Xs, Ys, Rest), pack(Rest, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista.
transfer(X, [], [], []).
% Si el siguiente elemento es diferente, termina la transferencia.
transfer(X, [Y|Ys], [], [Y|Ys]) :- X \= Y.
% Si el siguiente elemento es igual, agrégalo a la sublista.
transfer(X, [X|Xs], [X|Ys], Rest) :- transfer(X, Xs, Ys, Rest).
% Ejemplo de uso:
% pack([a,a,b,b,c,a,a,a,d], R), write(R), nl, halt.
% ----------------------------------------------
