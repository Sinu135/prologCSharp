% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que construye un árbol binario completamente equilibrado con N nodos.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;

% class BinaryTree
% {
%     public string Value { get; set; }
%     public BinaryTree Left { get; set; }
%     public BinaryTree Right { get; set; }

%     public BinaryTree(string value, BinaryTree left = null, BinaryTree right = null)
%     {
%         Value = value;
%         Left = left;
%         Right = right;
%     }

%     public static BinaryTree CreateBalancedTree(int n)
%     {
%         if (n == 0) return null;  // Árbol vacío

%         n -= 1;
%         int leftSize = n / 2;
%         int rightSize = n - leftSize;

%         return new BinaryTree("x", CreateBalancedTree(leftSize), CreateBalancedTree(rightSize));
%     }

%     public static void PrintTree(BinaryTree tree, string indent = "", bool isLeft = true)
%     {
%         if (tree != null)
%         {
%             Console.WriteLine(indent + (isLeft ? "├── " : "└── ") + tree.Value);
%             PrintTree(tree.Left, indent + (isLeft ? "│   " : "    "), true);
%             PrintTree(tree.Right, indent + (isLeft ? "│   " : "    "), false);
%         }
%     }

%     static void Main(string[] args)
%     {
%         Console.WriteLine("Introduce el número de nodos:");
%         int n = int.Parse(Console.ReadLine());

%         var balancedTree = CreateBalancedTree(n);
%         Console.WriteLine("Árbol binario completamente equilibrado con " + n + " nodos:");
%         PrintTree(balancedTree);
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Construye un árbol binario completamente equilibrado con N nodos.
% Un árbol completamente equilibrado tiene subárboles cuya diferencia de tamaño es como máximo 1.
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :- N > 0, N1 is N - 1, divide(N1, N2, N3), cbal_tree(N2, L), cbal_tree(N3, R).

% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- N1 is N // 2, N2 is N - N1.
% ----------------------------------------------

% Ejemplo de uso:
% cbal_tree(5, T), write(T), nl.
% ----------------------------------------------
