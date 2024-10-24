% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 22 de octubre de 2024
% Descripción: Elimina un numero K aleatorio de elementos de una lista
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static Random random = new Random();

%     static void Main()
%     {
%         // Definir la lista y el número de elementos a seleccionar
%         List<int> list = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
%         int numElements = 3;

%         // Llamar a la función rndSelect
%         List<int> selectedElements = RndSelect(list, numElements);

%         // Mostrar los elementos seleccionados
%         Console.WriteLine("Elementos seleccionados aleatoriamente: " + string.Join(", ", selectedElements));
%     }

%     // Función para seleccionar un número dado de elementos aleatorios de una lista
%     static List<int> RndSelect(List<int> list, int n)
%     {
%         // Crear una lista para almacenar los elementos seleccionados
%         List<int> result = new List<int>();

%         // Crear una copia de la lista original para poder modificarla
%         List<int> tempList = new List<int>(list);

%         // Seleccionar elementos aleatoriamente hasta que se seleccionen 'n' elementos
%         for (int i = 0; i < n; i++)
%         {
%             if (tempList.Count == 0)
%             {
%                 break; // Si la lista está vacía, termina el bucle
%             }

%             // Generar un índice aleatorio
%             int randomIndex = random.Next(0, tempList.Count);

%             // Obtener el elemento en el índice aleatorio
%             int selectedElement = tempList[randomIndex];

%             // Agregar el elemento seleccionado a la lista de resultados
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
% Extrae un número dado de elementos aleatorios de una lista.
% Utiliza un generador de números aleatorios y elimina los elementos seleccionados.
rnd_select(_, 0, []).
rnd_select(L, N, [X|R]) :- length(L, Len), random(1, Len, I), element_at(X, L, I), delete(L, X, L1), N1 is N - 1, rnd_select(L1, N1, R).
% Ejemplo de uso:
% rnd_select([a, b, c, d, e, f], 3, R), writeln(R), halt.
% ----------------------------------------------
