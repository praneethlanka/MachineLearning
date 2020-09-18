data=load('ex1data2.txt'); % read comma separated data
x=data(:,1:2);
% m=size(x,1);
%%% Feature Scaling
mu=mean(x);
sigma=std(x);
x=(x-mu)./sigma;

m=size(x,1); %Training Data Siz
x=[ones(m,1),x];  % 1 is appended in the begining to account for theta0
n=size(x,2);         %No. of Features
y_act=data(:,end);

th=zeros(n,1); %Parameters of the Hypothesis
alpha=0.1;
  
i=1;
ite=400;
deriv_th=zeros(n+1,m);
costfun=zeros(ite,1);
while i<ite
    h=(x*th);
    deriv_th=(1/m)*(h-y_act)'*x;
    th=th-(alpha*deriv_th)';
    h=(x*th);  
    costfun(i)=(1/(2*m))*sum((h-y_act).^2);
    i=i+1;
end

scatter3(x(:,2),x(:,3),y_act)
hold on
scatter3(x(:,2),x(:,3),h,'r*')
hold off
xlabel('Scaled X1')
ylabel('Scaled X2')
zlabel('price')
legend('Actual','Predicted')
