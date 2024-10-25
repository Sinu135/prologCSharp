% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que comprueba si un árbol binario es simétrico.
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

%     public static bool IsSymmetric(BinaryTree tree)
%     {
%         return IsMirror(tree?.Left, tree?.Right);
%     }

%     private static bool IsMirror(BinaryTree t1, BinaryTree t2)
%     {
%         if (t1 == null && t2 == null) return true;
%         if (t1 == null || t2 == null) return false;

%         return (t1.Value == t2.Value)
%             && IsMirror(t1.Left, t2.Right)
%             && IsMirror(t1.Right, t2.Left);
%     }

%     public static void Main(string[] args)
%     {
%         // Crear un árbol binario de ejemplo
%         BinaryTree tree = new BinaryTree("1",
%             new BinaryTree("2", new BinaryTree("3"), new BinaryTree("4")),
%             new BinaryTree("2", new BinaryTree("4"), new BinaryTree("3"))
%         );

%         Console.WriteLine("El árbol es simétrico: " + (IsSymmetric(tree) ? "Sí" : "No"));
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Definición de un árbol binario simétrico
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si un árbol es el espejo de otro
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

% Predicado para verificar simetría y escribir el resultado
check_symmetric(Tree) :-
    (symmetric(Tree) ->
        write('El árbol es simétrico.'), nl
    ;
        write('El árbol no es simétrico.'), nl
    ).


% ----------------------------------------------

% Ejemplo de uso:
% check_symmetric(t(1, t(2, t(3, nil, nil), t(4, nil, nil)), t(2, t(4, nil, nil), t(3, nil, nil)))), halt.
% ----------------------------------------------
