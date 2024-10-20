% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 17 de octubre de 2024
% Descripción: Obtiene el penultimo elemento de una lista con recursion
% ===============================================

% -------- Código en C# (comentado) ------------
%using System;
%using System.Collections.Generic;

%class Program
%{
%    static void Main()
%    {
%        List<int> numbers = new List<int> { 1, 2, 3, 4, 5 };
%        int penultimateElement = Penultimate(numbers);
%        Console.WriteLine($"El penúltimo elemento es: {penultimateElement}");
%    }
%
%    static int Penultimate(List<int> list)
%    {
%        if (list.Count == 2)
%        {
%            return list[0];
%        }
%        else
%        {
%            return Penultimate(list.GetRange(1, list.Count - 1));
%        }
%    }
%}


% ----------------------------------------------

% -------- Código en Prolog --------------------
% Encuentra el penúltimo elemento de una lista.
% La lista debe tener al menos dos elementos.
penultimate(X, [X, _]).
penultimate(X, [_|T]) :- penultimate(X, T).
% ----------------------------------------------