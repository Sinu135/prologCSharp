% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que verifica si un término dado representa un árbol binario.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;

% class BinaryTree
% {
%     public BinaryTree Left { get; set; }
%     public BinaryTree Right { get; set; }

%     public BinaryTree(BinaryTree left, BinaryTree right)
%     {
%         Left = left;
%         Right = right;
%     }

%     public static bool IsTree(BinaryTree tree)
%     {
%         if (tree == null) return true; // Un árbol vacío es un árbol válido
%         return IsTree(tree.Left) && IsTree(tree.Right);
%     }

%     static void Main(string[] args)
%     {
%         // Ejemplo de un árbol válido
%         var validTree = new BinaryTree(new BinaryTree(null, null), new BinaryTree(null, null));

%         // Ejemplo de un árbol vacío (árbol válido)
%         BinaryTree emptyTree = null;

%         Console.WriteLine("Verificando árboles:");
%         Console.WriteLine("Árbol válido: " + IsTree(validTree));  // Debería ser True
%         Console.WriteLine("Árbol vacío: " + IsTree(emptyTree));    // Debería ser True
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Verifica si un término dado representa un árbol binario.
% Un árbol binario está compuesto por un nodo raíz y dos subárboles.
istree(nil).
istree(t(_, L, R)) :- istree(L), istree(R).
% ----------------------------------------------

% Ejemplo de uso:
% istree(t(a, t(b, nil, nil), t(c, nil, nil))), write('Es un árbol binario'), nl; write('No es un árbol binario'), nl.
% ----------------------------------------------
