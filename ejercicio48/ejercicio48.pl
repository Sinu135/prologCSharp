% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que construye un árbol binario de búsqueda a partir de una lista de enteros.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;

% class BinarySearchTree
% {
%     public int Value { get; set; }
%     public BinarySearchTree Left { get; set; }
%     public BinarySearchTree Right { get; set; }

%     public BinarySearchTree(int value)
%     {
%         Value = value;
%         Left = null;
%         Right = null;
%     }

%     // Método para agregar un nodo al árbol
%     public void Add(int value)
%     {
%         if (value < Value)
%         {
%             if (Left == null)
%                 Left = new BinarySearchTree(value);
%             else
%                 Left.Add(value);
%         }
%         else
%         {
%             if (Right == null)
%                 Right = new BinarySearchTree(value);
%             else
%                 Right.Add(value);
%         }
%     }

%     // Método para construir el árbol a partir de una lista de enteros
%     public static BinarySearchTree Construct(int[] values)
%     {
%         BinarySearchTree tree = null;
%         foreach (var value in values)
%         {
%             if (tree == null)
%                 tree = new BinarySearchTree(value);
%             else
%                 tree.Add(value);
%         }
%         return tree;
%     }

%     // Método para imprimir el árbol en orden
%     public void InOrder()
%     {
%         if (Left != null)
%             Left.InOrder();
%         Console.Write(Value + " ");
%         if (Right != null)
%             Right.InOrder();
%     }

%     public static void Main(string[] args)
%     {
%         int[] values = { 7, 3, 9, 1, 5, 8, 10 };
%         BinarySearchTree tree = Construct(values);

%         Console.WriteLine("Árbol binario de búsqueda en orden:");
%         tree.InOrder(); // Imprime el árbol en orden
%         Console.WriteLine();
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Construye un árbol binario de búsqueda a partir de una lista de enteros.
% Un árbol binario de búsqueda es un árbol en el cual, para cada nodo, todos los elementos en el subárbol izquierdo son menores y en el subárbol derecho son mayores.
construct([], nil).
construct([X|Xs], T) :- construct(Xs, T1), add(X, T1, T).

% Añade un nodo a un árbol binario de búsqueda.
add(X, nil, t(X, nil, nil)).
add(X, t(Root, L, R), t(Root, NL, R)) :- X < Root, add(X, L, NL).
add(X, t(Root, L, R), t(Root, L, NR)) :- X >= Root, add(X, R, NR).
% ----------------------------------------------

% Ejemplo de uso:
% construct([7, 3, 9, 1, 5, 8, 10], T), write(T), nl.
% ----------------------------------------------
