clc,clear
c=[3,-1,-1];
a=[1,-2,1;4,-1,-2];
b=[11,3]';
aeq=[-2,0,1];
beq=1;
[x,y]=linprog(-c,a,b,aeq,beq,zeros(3,1))
y=-y%换算到目标函数最大化
prob=optimproblem('ObjectiveSence','max');%创建最大化线性规划问题，该问题有两个正变量和三个线性不等式约束
x=optimvar('x',3,'LowerBound',0);%创建正变量，在问题中设置一个目标函数
prob.Objective=c*x;%在问题中创建线性不等式约束
prob.Constraints.con1 = a*x<=b;
prob.Constraints.con2 = -2*x(1)+x(3) == 1
[sol,fval,flag,out]=solve(prob);%检验
