% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 22 de octubre de 2024
% Descripción: Crea una lista con todos los enteros dentro de un rango
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         // Definir el rango
%         int start = 3;
%         int end = 8;

%         // Llamar a la función range
%         List<int> result = Range(start, end);

%         // Mostrar el resultado
%         Console.WriteLine("Lista de enteros en el rango: " + string.Join(", ", result));
%     }

%     // Función para crear una lista con todos los enteros dentro de un rango dado
%     static List<int> Range(int start, int end)
%     {
%         // Crear una lista para almacenar los números en el rango
%         List<int> rangeList = new List<int>();

%         // Agregar los números del rango (inclusive) a la lista
%         for (int i = start; i <= end; i++)
%         {
%             rangeList.Add(i);
%         }

%         return rangeList;
%     }
% }


% ----------------------------------------------

% -------- Código en Prolog --------------------
% Crea una lista con todos los enteros dentro de un rango dado.
% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).
% ----------------------------------------------
