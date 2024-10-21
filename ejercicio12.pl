% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 17 de octubre de 2024
% Descripción: Recibe una lista codificada con el formato (X, N) y los expande en su numero de elementos.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         // Lista codificada usando Run-Length [(N, X)]
%         List<object> encoded = new List<object>
%         {
%             Tuple.Create(3, 'a'),
%             'b',
%             Tuple.Create(2, 'c'),
%             'a',
%             Tuple.Create(3, 'd'),
%             'e'
%         };

%         List<char> decoded = Decode(encoded);

%         // Imprimir el resultado
%         Console.WriteLine(string.Join(", ", decoded));
%     }

%     // Decodifica una lista codificada mediante Run-Length.
%     static List<char> Decode(List<object> encoded)
%     {
%         var decoded = new List<char>();

%         foreach (var item in encoded)
%         {
%             if (item is Tuple<int, char> pair)
%             {
%                 // Expande cada par (N, X)
%                 decoded.AddRange(Expand(pair.Item2, pair.Item1));
%             }
%             else if (item is char singleChar)
%             {
%                 // Si es un valor individual, simplemente lo agrega
%                 decoded.Add(singleChar);
%             }
%         }

%         return decoded;
%     }

%     // Expande un elemento X en una lista de longitud N.
%     static List<char> Expand(char x, int n)
%     {
%         var expanded = new List<char>();

%         for (int i = 0; i < n; i++)
%         {
%             expanded.Add(x);
%         }

%         return expanded;
%     }
% }


% ----------------------------------------------

% -------- Código en Prolog --------------------
% Decodifica una lista codificada mediante Run-Length.
% Expande cada par (N, X) en una lista con N elementos X.
decode([], []).
decode([[N,X]|T], R) :- decode(T, R1), expand(X, N, E), append(E, R1, R).

% Expande un elemento X en una lista de longitud N.
expand(_, 0, []).
expand(X, N, [X|T]) :- N > 0, N1 is N - 1, expand(X, N1, T).
% ----------------------------------------------