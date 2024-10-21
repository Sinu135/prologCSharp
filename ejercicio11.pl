% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 17 de octubre de 2024
% Descripción: Recibe una lista. Si hay elementos duplicados, lo reemplaza por el formato (X,N) donde N es el numero de elementos. Si no tiene duplicados, lo agrega directamente.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         List<char> lst = new List<char> { 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'd', 'd', 'd', 'e' };
%         List<object> result = EncodeModified(lst);

%         // Imprimir el resultado
%         foreach (var item in result)
%         {
%             if (item is Tuple<int, char> tuple)
%             {
%                 Console.WriteLine($"({tuple.Item1}, '{tuple.Item2}')");
%             }
%             else
%             {
%                 Console.WriteLine(item);
%             }
%         }
%     }

%     // Codifica una lista usando codificación Run-Length.
%     // Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
%     static List<object> EncodeModified(List<char> lst)
%     {
%         List<Tuple<int, char>> encoded = Encode(lst);
%         return Modify(encoded);
%     }

%     // Agrupa duplicados consecutivos de una lista en sublistas.
%     static List<List<char>> Pack(List<char> lst)
%     {
%         var packed = new List<List<char>>();

%         if (lst.Count == 0)
%             return packed;

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

%     // Codifica una lista usando codificación Run-Length.
%     static List<Tuple<int, char>> Encode(List<char> lst)
%     {
%         List<List<char>> packedList = Pack(lst);
%         return Transform(packedList);
%     }

%     // Modifica la codificación Run-Length de una lista.
%     // Si un elemento no tiene duplicados, se mantiene sin empaquetar.
%     static List<object> Modify(List<Tuple<int, char>> encoded)
%     {
%         var modified = new List<object>();

%         foreach (var item in encoded)
%         {
%             if (item.Item1 == 1)
%             {
%                 // Si el elemento no tiene duplicados, lo dejamos como está.
%                 modified.Add(item.Item2);
%             }
%             else
%             {
%                 // Si tiene duplicados, mantenemos el formato (N, X).
%                 modified.Add(item);
%             }
%         }

%         return modified;
%     }
% }


% ----------------------------------------------

% -------- Código en Prolog --------------------
pack([], []).
pack([X|Xs], [[X|Ys]|Zs]) :- transfer(X, Xs, Ys, Rest), pack(Rest, Zs).

transfer(X, [], [], []).
transfer(X, [Y|Ys], [], [Y|Ys]) :- X \= Y.
transfer(X, [X|Xs], [X|Ys], Rest) :- transfer(X, Xs, Ys, Rest).


encode(L, R) :- pack(L, P), transform(P, R).

transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- length([X|Xs], N), transform(Ys, Zs).


% Modifica la codificación Run-Length de una lista.
% Si un elemento no tiene duplicados, se mantiene sin empaquetar.
encode_modified(L, R) :- encode(L, Enc), modify(Enc, R).

% Caso base: lista vacía.
modify([], []).
% Si hay solo un elemento, agrégalo directamente.
modify([[1,X]|T], [X|R]) :- modify(T, R).
% Si hay más de un elemento, mantén el formato (N, X).
modify([[N,X]|T], [[N,X]|R]) :- N > 1, modify(T, R).
% ----------------------------------------------