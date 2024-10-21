% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 17 de octubre de 2024
% Descripción: Agrupa los elementos consecutivos en parejas (N, X) donde N es la cantidad de elementos
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         // Lista de entrada
%         List<char> input = new List<char> { 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'd', 'd', 'd', 'e' };

%         List<Tuple<int, char>> encoded = EncodeDirect(input);

%         // Imprimir el resultado
%         foreach (var tuple in encoded)
%         {
%             Console.WriteLine($"({tuple.Item1}, '{tuple.Item2}')");
%         }
%     }

%     // Codifica directamente una lista usando codificación Run-Length.
%     static List<Tuple<int, char>> EncodeDirect(List<char> lst)
%     {
%         var encoded = new List<Tuple<int, char>>();

%         if (lst.Count == 0)
%             return encoded;

%         char current = lst[0];
%         int count;
%         List<char> rest = lst;

%         while (rest.Count > 0)
%         {
%             count = Count(current, rest, out rest);
%             encoded.Add(new Tuple<int, char>(count, current));

%             if (rest.Count > 0)
%             {
%                 current = rest[0]; // Cambiamos al siguiente elemento no procesado
%             }
%         }

%         return encoded;
%     }

%     // Cuenta cuántos elementos consecutivos son iguales.
%     // Devuelve la cantidad de elementos iguales y actualiza la lista con el resto de los elementos.
%     static int Count(char x, List<char> lst, out List<char> rest)
%     {
%         int count = 0;
%         int i = 0;

%         // Contar elementos consecutivos iguales
%         while (i < lst.Count && lst[i] == x)
%         {
%             count++;
%             i++;
%         }

%         // El resto de la lista comienza después de los elementos contados
%         rest = lst.GetRange(i, lst.Count - i);
%         return count;
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Codifica directamente una lista usando codificación Run-Length.
% Cuenta cuántos elementos consecutivos son iguales.
encode_direct([], []).
encode_direct([X|Xs], [[N,X]|R]) :- count(X, [X|Xs], N, Rest), encode_direct(Rest, R).

% Cuenta cuántos elementos consecutivos son iguales.
count(_, [], 0, []).
count(X, [X|Xs], N, Rest) :- count(X, Xs, N1, Rest), N is N1 + 1.
count(X, [Y|Ys], 0, [Y|Ys]) :- X \= Y.
% ----------------------------------------------