% ===============================================
% Autor: Velazquez Duran Sinuhe de Jesus
% Fecha: 24 de octubre de 2024
% Descripción: Programa que genera el código Gray de N bits
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class GrayCode
% {
%     static void Main(string[] args)
%     {
%         int N = 3; // Cambia el valor de N según lo que necesites.
%         List<string> grayCode = GenerateGrayCode(N);
%         Console.WriteLine($"Gray Code of {N} bits:");
%         foreach (string code in grayCode)
%         {
%             Console.WriteLine(code);
%         }
%     }

%     static List<string> GenerateGrayCode(int N)
%     {
%         if (N == 1)
%         {
%             return new List<string> { "0", "1" };
%         }
%         else
%         {
%             List<string> previousGray = GenerateGrayCode(N - 1);
%             List<string> grayCode = new List<string>();
            
%             foreach (string code in previousGray)
%             {
%                 grayCode.Add("0" + code);
%             }

%             previousGray.Reverse();
%             foreach (string code in previousGray)
%             {
%                 grayCode.Add("1" + code);
%             }

%             return grayCode;
%         }
%     }
% }

% ----------------------------------------------

% -------- Código en Prolog --------------------
% Genera el código Gray de N bits.
% https://es.wikipedia.org/wiki/Código_Gray
% La secuencia de código Gray es una secuencia binaria en la que dos valores consecutivos difieren en solo un bit.
gray(1, ['0', '1']).
gray(N, C) :- N > 1, N1 is N - 1, gray(N1, C1), maplist(atom_concat('0'), C1, C0), reverse(C1, C1R), maplist(atom_concat('1'), C1R, C1G), append(C0, C1G, C).
% ----------------------------------------------

% Ejemplo de uso:
% gray(3, C), write(C), nl.
% ----------------------------------------------
