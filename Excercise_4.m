clc; clear; close all;

% Translation of A1 origin expressed in A0
p01 = [1.5; 0; 2];

% Rotation from the figure:
% x1 = +y0, y1 = -x0, z1 = +z0
R01 = [ 0 -1  0;
        1  0  0;
        0  0  1];

% A0A1 = ^A0 T_A1
T01 = [R01 p01;
       0 0 0 1];

% A1A0 = ^A1 T_A0 (inverse)
T10 = [R01.'  -R01.'*p01;
       0 0 0 1];

disp('A0A1 = ^A0T_A1'); disp(T01);
disp('A1A0 = ^A1T_A0'); disp(T10);

disp('Check T01*T10 (should be I):'); disp(T01*T10);
disp('Check T10*T01 (should be I):'); disp(T10*T01);

fprintf('Error1 = %.3e\n', norm(T01*T10 - eye(4), 'fro'));
fprintf('Error2 = %.3e\n', norm(T10*T01 - eye(4), 'fro'));
