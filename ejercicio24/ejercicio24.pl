% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 22 de octubre de 2024
% Descripción: Crea una nueva lista con elementos aleatorios de otra lista
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static Random random = new Random();

%     static void Main()
%     {
%         int N = 5; // Número de elementos a extraer
%         int M = 50; // Máximo valor del rango

%         // Llamada a la función lotto para extraer N números aleatorios del rango [1, M]
%         List<int> lottoNumbers = Lotto(N, M);

%         // Mostrar los números seleccionados
%         Console.WriteLine("Números seleccionados: " + string.Join(", ", lottoNumbers));
%     }

%     // Función que genera una lista con números aleatorios del rango [1, M]
%     static List<int> Lotto(int N, int M)
%     {
%         // Generar la lista de números desde 1 hasta M
%         List<int> rangeList = Range(1, M);

%         // Seleccionar N números aleatorios de la lista generada
%         return RndSelect(rangeList, N);
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

%     // Función que genera una lista con todos los números en el rango [I, K]
%     static List<int> Range(int I, int K)
%     {
%         List<int> result = new List<int>();

%         for (int i = I; i <= K; i++)
%         {
%             result.Add(i);
%         }

%         return result;
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------

element_at(X, [X|_], 1).
element_at(X, [_|T], K) :- K > 1, K1 is K - 1, element_at(X, T, K1).

rnd_select(_, 0, []).
rnd_select(L, N, [X|R]) :- length(L, Len), random(1, Len, I), element_at(X, L, I), delete(L, X, L1), N1 is N - 1, rnd_select(L1, N1, R).

range(I, I, [I]).
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).

% Extrae N números aleatorios de un rango dado.
% Utiliza la función range para generar la lista de números y luego selecciona aleatoriamente.
lotto(N, M, L) :- range(1, M, R), rnd_select(R, N, L).
% ----------------------------------------------