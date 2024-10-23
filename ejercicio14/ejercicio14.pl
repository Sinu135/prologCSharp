% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 21 de octubre de 2024
% Descripción: Para cada elemento de una lista, lo duplica
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         // Lista de entrada
%         List<int> input = new List<int> { 1, 2, 3, 4 };

%         // Llamada a la función para duplicar los elementos
%         List<int> duplicated = Dupli(input);

%         // Imprimir el resultado
%         Console.WriteLine(string.Join(", ", duplicated));
%     }

%     // Duplica los elementos de una lista
%     static List<int> Dupli(List<int> lst)
%     {
%         var duplicated = new List<int>();

%         // Recorremos cada elemento de la lista
%         foreach (var item in lst)
%         {
%             // Duplicamos cada elemento
%             duplicated.Add(item);
%             duplicated.Add(item);
%         }

%         return duplicated;
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Duplica los elementos de una lista.
% Caso base: la lista vacía se mantiene vacía.
dupli([], []).
% Caso recursivo: duplica el primer elemento y continúa con el resto.
dupli([H|T], [H,H|R]) :- dupli(T, R).
% ----------------------------------------------