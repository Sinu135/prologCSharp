% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que construye un árbol binario equilibrado en altura con una altura dada.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;

% class Ejercicio50
% {
%     static void Main(string[] args)
%     {
%         int height = 3; // Cambia el valor según el tamaño que desees
%         Node tree = HbalTree(height);
%         PrintTree(tree);
%     }

%     // Clase para representar los nodos del árbol
%     class Node
%     {
%         public string Value;
%         public Node Left;
%         public Node Right;

%         public Node(string value, Node left = null, Node right = null)
%         {
%             Value = value;
%             Left = left;
%             Right = right;
%         }
%     }

%     // Función que genera un árbol binario balanceado por altura
%     static Node HbalTree(int height)
%     {
%         if (height == 0)
%             return null;

%         int h1 = height - 1;
%         int h2 = h1 - 1;

%         return new Node("x", HbalTree(h1), HbalTree(h2));
%     }

%     // Función para imprimir el árbol
%     static void PrintTree(Node node, string indent = "", bool last = true)
%     {
%         if (node != null)
%         {
%             Console.WriteLine(indent + "+- " + node.Value);
%             indent += last ? "   " : "|  ";
%             PrintTree(node.Left, indent, false);
%             PrintTree(node.Right, indent, true);
%         }
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Construye un árbol binario equilibrado en altura con una altura dada.
% Un árbol equilibrado en altura tiene subárboles cuya diferencia de altura es como máximo 1.
% Genera árboles binarios balanceados por altura (árboles AVL).
hbal_tree(0, nil).
hbal_tree(H, t('x', L, R)) :- 
    H > 0, 
    H1 is H - 1,
    hbal_tree(H1, L),
    hbal_tree(H1, R).

% ----------------------------------------------

% Ejemplo de uso:
% hbal_tree(3, Tree), write(Tree), nl
% ----------------------------------------------
