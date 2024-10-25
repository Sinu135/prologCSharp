% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que genera un árbol de Huffman dado un conjunto de frecuencias.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;

% class HuffmanTree
% {
%     public string Symbol { get; set; }
%     public int Frequency { get; set; }
%     public HuffmanTree Left { get; set; }
%     public HuffmanTree Right { get; set; }

%     public HuffmanTree(string symbol, int frequency)
%     {
%         Symbol = symbol;
%         Frequency = frequency;
%     }

%     public HuffmanTree(HuffmanTree left, HuffmanTree right)
%     {
%         Left = left;
%         Right = right;
%         Frequency = left.Frequency + right.Frequency;
%     }

%     public static List<HuffmanTree> BuildHuffmanTree(List<HuffmanTree> frequencies)
%     {
%         while (frequencies.Count > 1)
%         {
%             frequencies = frequencies.OrderBy(f => f.Frequency).ToList();
%             var left = frequencies[0];
%             var right = frequencies[1];
%             frequencies.RemoveRange(0, 2);
%             frequencies.Add(new HuffmanTree(left, right));
%         }
%         return frequencies;
%     }

%     public void PrintCodes(string code)
%     {
%         if (Left == null && Right == null)
%         {
%             Console.WriteLine($"{Symbol}: {code}");
%         }
%         else
%         {
%             Left?.PrintCodes(code + "0");
%             Right?.PrintCodes(code + "1");
%         }
%     }
% }

% class Program
% {
%     static void Main(string[] args)
%     {
%         var frequencies = new List<HuffmanTree>
%         {
%             new HuffmanTree("A", 5),
%             new HuffmanTree("B", 9),
%             new HuffmanTree("C", 12),
%             new HuffmanTree("D", 13),
%             new HuffmanTree("E", 16),
%             new HuffmanTree("F", 45)
%         };

%         var huffmanTree = HuffmanTree.BuildHuffmanTree(frequencies)[0];
%         Console.WriteLine("Huffman Codes:");
%         huffmanTree.PrintCodes("");
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Genera un árbol de Huffman dado un conjunto de frecuencias.
% https://es.wikipedia.org/wiki/Codificación_Huffman
% El algoritmo de Huffman se utiliza para la compresión de datos, construyendo un árbol binario óptimo para la codificación.
huffman(Fs, Hs) :- length(Fs, Len), Len > 1, sort(2, @=<, Fs, Sorted), huffman_tree(Sorted, Hs).

% Caso base para construir el árbol de Huffman.
huffman_tree([fr(X, _) | []], hc(X, '0')).
huffman_tree([fr(_, _) | [fr(_, _) | _]], _).
% ----------------------------------------------

% Ejemplo de uso:
% huffman([fr(a, 5), fr(b, 9), fr(c, 12), fr(d, 13), fr(e, 16), fr(f, 45)], H), write(H), nl.
% ----------------------------------------------
