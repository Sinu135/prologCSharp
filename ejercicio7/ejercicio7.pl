%===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 20 de octubre de 2024
% Descripción: Si un elemento de la lista es una lista, la reemplaza por sus elemento en la lista original
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         var nestedList = new List<object> {
%             1,
%             new List<object> { 2, 3, new List<object> { 4, 5 }, 6 },
%             7,
%             new List<object> { 8, 9 }
%         };

%         List<object> flatList = MyFlatten(nestedList);
%         Console.WriteLine("Lista aplanada: " + string.Join(", ", flatList));
%     }

%     static List<object> MyFlatten(object list)
%     {
%         // Caso base: si es una lista vacía, devuelve una lista vacía
%         if (list is IList && ((IList)list).Count == 0)
%         {
%             return new List<object>();
%         }

%         // Caso recursivo: si es una lista, aplana la cabeza y la cola recursivamente
%         if (list is IList nestedList)
%         {
%             List<object> flatResult = new List<object>();

%             foreach (var element in nestedList)
%             {
%                 flatResult.AddRange(MyFlatten(element));
%             }

%             return flatResult;
%         }

%         // Si no es una lista, devuélvelo como un solo elemento en una lista
%         return new List<object> { list };
%     }
% }


% ----------------------------------------------

% -------- Código en Prolog --------------------
% Aplana una lista anidada en una lista simple.
% Caso base: la lista vacía se aplana a una lista vacía.
my_flatten([], []).
% Caso recursivo: si la cabeza es una lista, aplana la cabeza y la cola recursivamente.
my_flatten([H|T], Flat) :- my_flatten(H, FH), my_flatten(T, FT), append(FH, FT, Flat).
% Si la cabeza no es una lista, simplemente agrégala al resultado.
my_flatten(X, [X]) :- X \= [], \+ is_list(X).
% Ejemplo de uso:
% my_flatten([[a,b],[c,d]], R), write(R), nl, halt.
% ----------------------------------------------
