% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 17 de octubre de 2024
% Descripción: Obtiene el ultimo elemento de una lista con recursion
% ===============================================

% -------- Código en C# (comentado) ------------
%using System;
%using System.Collections.Generic;
%
%class Program
%{
%    static void Main()
%    {
%        List<int> numbers = new List<int> { 1, 2, 3, 4, 5 };
%        int lastElement = MyLast(numbers);
%        Console.WriteLine($"El último elemento es: {lastElement}");
%    }
%
%    static int MyLast(List<int> list)
%    {
%        if (list.Count == 1)
%        {
%            return list[0];
%        }
%        else
%        {
%            return MyLast(list.GetRange(1, list.Count - 1));
%        }
%    }
%}

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Encuentra el último elemento de una lista.
% La lista debe tener al menos un elemento.
my_last(X, [X]).
my_last(X, [_|T]) :- my_last(X, T).
%
% Ejemplo de uso:
% ?- my_last(X, [1, 2, 3]), writeln(X), halt.
%
% ----------------------------------------------% Ejemplo de uso:
%
% ----------------------------------------------
