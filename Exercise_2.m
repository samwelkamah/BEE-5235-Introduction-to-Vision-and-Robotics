clc; clear;

TAB = [1 0 0 3;
       0 1/sqrt(2) -1/sqrt(2) 5;
       0 1/sqrt(2)  1/sqrt(2) 7;
       0 0 0 1];

R = TAB(1:3,1:3);
t = TAB(1:3,4);

TBA = [R'  -R'*t;
       0 0 0 1];


disp(TAB*TBA)
disp(TBA)