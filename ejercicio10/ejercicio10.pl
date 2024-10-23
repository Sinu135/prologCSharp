% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 20 de octubre de 2024
% Descripción: Agrupa los elementos consecutivos en parejas (N, X) donde N es la cantidad de elementos
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         List<char> lst = new List<char> { 'a', 'a', 'a', 'b', 'b', 'c', 'c', 'c', 'c' };
%         List<Tuple<int, char>> result = Encode(lst);
        
%         // Imprimir el resultado
%         foreach (var pair in result)
%         {
%             Console.WriteLine($"({pair.Item1}, '{pair.Item2}')");
%         }
%     }

%     // Codifica una lista usando codificación Run-Length.
%     static List<Tuple<int, char>> Encode(List<char> lst)
%     {
%         List<List<char>> packedList = Pack(lst);
%         return Transform(packedList);
%     }

%     // Agrupa duplicados consecutivos de una lista en sublistas.
%     static List<List<char>> Pack(List<char> lst)
%     {
%         var packed = new List<List<char>>();
        
%         if (lst.Count == 0)
%             return packed;
        
%         // Comenzar con el primer elemento
%         char current = lst[0];
%         var currentGroup = new List<char> { current };

%         for (int i = 1; i < lst.Count; i++)
%         {
%             if (lst[i] == current)
%             {
%                 currentGroup.Add(lst[i]);
%             }
%             else
%             {
%                 packed.Add(currentGroup);
%                 current = lst[i];
%                 currentGroup = new List<char> { current };
%             }
%         }
        
%         // Añadir el último grupo
%         packed.Add(currentGroup);

%         return packed;
%     }

%     // Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
%     static List<Tuple<int, char>> Transform(List<List<char>> packedList)
%     {
%         var transformed = new List<Tuple<int, char>>();
        
%         foreach (var group in packedList)
%         {
%             transformed.Add(new Tuple<int, char>(group.Count, group[0]));
%         }
        
%         return transformed;
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
pack([], []).
pack([X|Xs], [[X|Ys]|Zs]) :- transfer(X, Xs, Ys, Rest), pack(Rest, Zs).

transfer(X, [], [], []).
transfer(X, [Y|Ys], [], [Y|Ys]) :- X \= Y.
transfer(X, [X|Xs], [X|Ys], Rest) :- transfer(X, Xs, Ys, Rest).

% Codifica una lista usando codificación Run-Length.
% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
encode(L, R) :- pack(L, P), transform(P, R).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- length([X|Xs], N), transform(Ys, Zs).
% ----------------------------------------------