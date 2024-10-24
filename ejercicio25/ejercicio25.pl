% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 22 de octubre de 2024
% Descripción: Mezcla aleatoriamente los elementos de una lista
% ===============================================

% -------- Código en C# (comentado) ------------

% using System;
% using System.Collections.Generic;

% class Program
% {
%     static Random random = new Random();

%     static void Main()
%     {
%         List<int> originalList = new List<int> { 1, 2, 3, 4, 5 };

%         // Llamada a la función rnd_permu para obtener una permutación aleatoria
%         List<int> permutedList = RndPermu(originalList);

%         // Mostrar la permutación
%         Console.WriteLine("Permutación aleatoria: " + string.Join(", ", permutedList));
%     }

%     // Función que genera una permutación aleatoria de los elementos de una lista
%     static List<int> RndPermu(List<int> list)
%     {
%         // Generar una permutación aleatoria seleccionando todos los elementos
%         return RndSelect(list, list.Count);
%     }

%     // Función que selecciona N elementos aleatorios de una lista
%     static List<int> RndSelect(List<int> list, int N)
%     {
%         List<int> result = new List<int>();
%         List<int> tempList = new List<int>(list);

%         // Seleccionar N elementos aleatorios
%         for (int i = 0; i < N; i++)
%         {
%             if (tempList.Count == 0)
%             {
%                 break; // Si la lista está vacía, termina
%             }

%             // Generar un índice aleatorio
%             int randomIndex = random.Next(0, tempList.Count);

%             // Obtener el elemento en el índice aleatorio
%             int selectedElement = tempList[randomIndex];

%             // Agregar el elemento a los resultados
%             result.Add(selectedElement);

%             // Eliminar el elemento seleccionado de la lista temporal
%             tempList.RemoveAt(randomIndex);
%         }

%         return result;
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
element_at(X, [X|_], 1).
element_at(X, [_|T], K) :- K > 1, K1 is K - 1, element_at(X, T, K1).

rnd_select(_, 0, []).
rnd_select(L, N, [X|R]) :- length(L, Len),Max is Len + 1, random(1, Max, I), element_at(X, L, I), delete(L, X, L1), N1 is N - 1, rnd_select(L1, N1, R).
% Genera una permutación aleatoria de los elementos de una lista.
% Utiliza la selección aleatoria para construir la permutación.
rnd_permu(L, P) :- length(L, Len), rnd_select(L, Len, P).
% Ejemplo de uso:
% rnd_permu([a, b, c, d, e], P), writeln(P), halt.
% ----------------------------------------------
