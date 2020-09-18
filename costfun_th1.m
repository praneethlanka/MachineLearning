% x=1:5;
% y_act=1:5;
x=[1,2,4,3,5];
y_act=[1,3,3,2,5];

th1=0.89:0.00001:0.91;

h=th1'*x;
y_act=repmat(y_act,[size(th1,1),1]);
er=((h-y_act).^2)*(1/(2*size(x,2)));
cost=sum(er,2);
% er=(1/(2*size(x,2)))*((repmat(y_act,[size(th1,2),1])-h).^2)
plot(th1,cost,'-*')

th1(cost==min(cost))