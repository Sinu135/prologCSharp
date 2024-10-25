% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que genera todos los árboles binarios simétricos y completamente equilibrados con N nodos.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% public class TreeNode
% {
%     public char Value;
%     public TreeNode Left;
%     public TreeNode Right;

%     public TreeNode(char value)
%     {
%         Value = value;
%         Left = null;
%         Right = null;
%     }
% }

% class Program
% {
%     static void Main()
%     {
%         int n = 4; // Cambia este valor para generar árboles con diferente cantidad de nodos
%         var trees = SymmetricBalancedTrees(n);
%         foreach (var tree in trees)
%         {
%             PrintTree(tree);
%             Console.WriteLine();
%         }
%     }

%     public static List<TreeNode> SymmetricBalancedTrees(int n)
%     {
%         List<TreeNode> trees = new List<TreeNode>();
%         GenerateTrees(n, trees);
%         return trees;
%     }

%     private static void GenerateTrees(int n, List<TreeNode> trees)
%     {
%         if (n == 0)
%         {
%             trees.Add(null);
%             return;
%         }
        
%         for (int i = 0; i <= n - 1; i++)
%         {
%             int left = i;
%             int right = n - 1 - i;
%             foreach (var leftTree in SymmetricBalancedTrees(left))
%             {
%                 foreach (var rightTree in SymmetricBalancedTrees(right))
%                 {
%                     var node = new TreeNode('x') { Left = leftTree, Right = rightTree };
%                     if (IsMirror(leftTree, rightTree))
%                     {
%                         trees.Add(node);
%                     }
%                 }
%             }
%         }
%     }

%     private static bool IsMirror(TreeNode left, TreeNode right)
%     {
%         if (left == null && right == null) return true;
%         if (left == null || right == null) return false;
%         return left.Value == right.Value && IsMirror(left.Left, right.Right) && IsMirror(left.Right, right.Left);
%     }

%     private static void PrintTree(TreeNode node, string indent = "", bool last = true)
%     {
%         if (node != null)
%         {
%             Console.Write(indent);
%             if (last)
%             {
%                 Console.Write("R----");
%                 indent += "   ";
%             }
%             else
%             {
%                 Console.Write("L----");
%                 indent += "|  ";
%             }
%             Console.WriteLine(node.Value);
%             PrintTree(node.Left, indent, false);
%             PrintTree(node.Right, indent, true);
%         }
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :- N > 0, N1 is N - 1, divide(N1, N2, N3), cbal_tree(N2, L), cbal_tree(N3, R).

divide(N, N1, N2) :- N1 is N // 2, N2 is N - N1.

% Genera todos los árboles binarios simétricos y completamente equilibrados con N nodos.
% Utiliza el paradigma de generar y probar para encontrar todos los árboles que cumplen ambas propiedades.
sym_cbal_trees(N, Ts) :- findall(T, (cbal_tree(N, T), symmetric(T)), Ts).
% ----------------------------------------------

% Ejemplo de uso:
% N=3, sym_cbal_trees(N, Trees), write(Trees), nl.
% ----------------------------------------------
