% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 17 de octubre de 2024
% Descripción: Encuntra el k-esimo elemento de una lista
% ===============================================

% -------- Código en C# (comentado) ------------
%using System;
%using System.Collections.Generic;

%class Program
%{
%    static void Main()
%    {
%        List<int> numbers = new List<int> { 1, 2, 3, 4, 5 };
%        int k = 3; // Cambia este valor para obtener otro elemento
%        int element = ElementAt(numbers, k);
%        Console.WriteLine($"El {k}-ésimo elemento es: {element}");
%    }

%    static int ElementAt(List<int> list, int k)
%    {
%        if (k == 1)
%        {
%            return list[0];
%        }
%        else if (k > 1 && k <= list.Count)
%        {
%            return ElementAt(list.GetRange(1, list.Count - 1), k - 1);
%        }
%        else
%        {
%            throw new ArgumentOutOfRangeException("k", "El índice debe ser mayor que 0 y menor o igual que el tamaño de la lista.");
%        }
%    }
%}



% ----------------------------------------------

% -------- Código en Prolog --------------------
% Encuentra el k-ésimo elemento de una lista.
% El índice K debe ser mayor que 0.
element_at(X, [X|_], 1).
element_at(X, [_|T], K) :- K > 1, K1 is K - 1, element_at(X, T, K1).
% ----------------------------------------------