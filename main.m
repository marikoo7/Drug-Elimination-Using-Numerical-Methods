% main.m
clc; clear; close all;


C0 = 100;        
k = 0.2;         
h = 1;           
t_final = 24;   
f = @(t, C) -k * C;   


[t1, y1] = Euler(f, 0, t_final, C0, h);
[t2, y2] = Midpoint(f, 0, t_final, C0, h);
[t3, y3] = rung_cutto(f, 0, t_final, C0, h);


plot-connection(t1, y1, y2, y3);   

