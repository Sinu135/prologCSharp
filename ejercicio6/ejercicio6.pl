% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 20 de octubre de 2024
% Descripción:  Con la funcion de invertir lista comprueba si una lista es palindromo
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     static void Main()
%     {
%         List<int> numbers = new List<int> { 1, 2, 3, 2, 1 };
%         bool isPalindrome = IsPalindrome(numbers);
%         Console.WriteLine(isPalindrome ? "La lista es un palíndromo." : "La lista no es un palíndromo.");
%     }

%     // Función para verificar si una lista es un palíndromo
%     static bool IsPalindrome(List<int> list)
%     {
%         // Invertimos la lista usando la función de inversión
%         List<int> reversedList = ReverseList(list);
        
%         // Comparamos si la lista original es igual a la lista invertida
%         return AreListsEqual(list, reversedList);
%     }

%     // Función para invertir una lista (recursiva con acumulador)
%     static List<int> ReverseList(List<int> list)
%     {
%         return ReverseList(list, new List<int>());
%     }

%     static List<int> ReverseList(List<int> list, List<int> accumulator)
%     {
%         if (list.Count == 0)
%         {
%             return accumulator;
%         }

%         accumulator.Insert(0, list[0]);
%         return ReverseList(list.GetRange(1, list.Count - 1), accumulator);
%     }

%     // Función para comparar si dos listas son iguales
%     static bool AreListsEqual(List<int> list1, List<int> list2)
%     {
%         if (list1.Count != list2.Count)
%         {
%             return false;
%         }

%         for (int i = 0; i < list1.Count; i++)
%         {
%             if (list1[i] != list2[i])
%             {
%                 return false;
%             }
%         }

%         return true;
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------

reverse_list(L, R) :- reverse_list(L, [], R).
reverse_list([], Acc, Acc).
reverse_list([H|T], Acc, R) :- reverse_list(T, [H|Acc], R).

% Verifica si una lista es un palíndromo.
% Una lista es un palíndromo si es igual a su inversa.
palindrome(L) :- reverse_list(L, L).
% ----------------------------------------------