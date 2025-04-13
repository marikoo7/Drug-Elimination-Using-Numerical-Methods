% main.m
clc; clear; close all;


C0 = 100;        
k = 0.2;         
h = 1;           
t_final = 24;   
f = @(t, C) -k * C;   


[t1, y1] = EulerForward(f, 0, t_final, C0, h);
[t2, y2] = Midpoint(f, 0, t_final, C0, h);
[t3, y3] = rung_cutto(f, 0, t_final, C0, h);
[t4, y4] = HeunsMethod(f, 0, t_final, C0, h);
[t5, y5] = adams_bashforth(f, 0, t_final, C0, h);
[t6, y6] = lmm_adams_moulton(f, 0, t_final, C0, h);
[t7, y7] = EulerBackward(f, 0, t_final, C0, h);


plot_connection(t1,y1,y2,y3,y4,y5,y6,y7);
   drawnow;  

