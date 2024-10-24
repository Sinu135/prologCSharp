% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 20 de octubre de 2024
% Descripción: Invierte una lista con recursion introduciendo el ultimo elemento a un acumulador
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         List<int> numbers = new List<int> { 1, 2, 3, 4, 5 };
%         List<int> reversed = ReverseList(numbers);
%         Console.WriteLine("La lista invertida es: " + string.Join(", ", reversed));
%     }

%     static List<int> ReverseList(List<int> list)
%     {
%         // Llamada inicial a la función auxiliar con un acumulador vacío
%         return ReverseList(list, new List<int>());
%     }

%     static List<int> ReverseList(List<int> list, List<int> accumulator)
%     {
%         // Caso base: si la lista original está vacía, devolver el acumulador (lista invertida)
%         if (list.Count == 0)
%         {
%             return accumulator;
%         }

%         // Caso recursivo: mover el primer elemento de la lista al acumulador y seguir con el resto
%         accumulator.Insert(0, list[0]);  // Agregar el elemento al inicio del acumulador
%         return ReverseList(list.GetRange(1, list.Count - 1), accumulator);  // Llamar recursivamente
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
     

% Invierte una lista.
% Utiliza un acumulador para ir construyendo la lista invertida.
reverse_list(L, R) :- reverse_list(L, [], R).
% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).
% Caso recursivo: mueve el elemento de la cabeza al acumulador.
reverse_list([H|T], Acc, R) :- reverse_list(T, [H|Acc], R).
% Ejemplo de uso:
% reverse_list([1,2,3], R), write(R), nl, halt.
% ----------------------------------------------
