clc,clear
c=[3,-1,-1];
a=[1,-2,1;4,-1,-2];
b=[11,3]';
aeq=[-2,0,1];
beq=1;
[x,y]=linprog(-c,a,b,aeq,beq,zeros(3,1))
y=-y%���㵽Ŀ�꺯�����
prob=optimproblem('ObjectiveSence','max');%����������Թ滮���⣬���������������������������Բ���ʽԼ��
x=optimvar('x',3,'LowerBound',0);%������������������������һ��Ŀ�꺯��
prob.Objective=c*x;%�������д������Բ���ʽԼ��
prob.Constraints.con1 = a*x<=b;
prob.Constraints.con2 = -2*x(1)+x(3) == 1
[sol,fval,flag,out]=solve(prob);%����
