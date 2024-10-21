% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 21 de octubre de 2024
% Descripción: Rota una lista un numero n de veces
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
%         int n = 3; // Número de posiciones a rotar a la izquierda

%         // Llamada a la función para rotar la lista
%         List<int> result = Rotate(input, n);

%         // Imprimir el resultado
%         Console.WriteLine("Lista rotada: " + string.Join(", ", result));
%     }

%     // Función para rotar una lista N lugares a la izquierda
%     static List<int> Rotate(List<int> lst, int n)
%     {
%         // Manejar casos donde la lista esté vacía o N sea 0
%         if (lst.Count == 0 || n == 0)
%         {
%             return lst;
%         }

%         // Calcular la longitud de la lista
%         int len = lst.Count;

%         // Normalizar N para que esté dentro del rango de longitud de la lista
%         int n1 = n % len;

%         // Dividir la lista en dos partes
%         List<int> firstPart = lst.GetRange(0, n1);
%         List<int> secondPart = lst.GetRange(n1, len - n1);

%         // Concatenar las dos partes para obtener la lista rotada
%         secondPart.AddRange(firstPart);

%         return secondPart;
%     }
% }


% ----------------------------------------------

% -------- Código en Prolog --------------------
split(L, 0, [], L).
split([H|T], N, [H|L1], L2) :- N > 0, N1 is N - 1, split(T, N1, L1, L2).

% Rota una lista N lugares a la izquierda.
% Utiliza la longitud de la lista para manejar rotaciones mayores que la longitud.
rotate(L, N, R) :- length(L, Len), N1 is N mod Len, split(L, N1, L1, L2), append(L2, L1, R).
% ----------------------------------------------