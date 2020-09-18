%% This code has been verified with data from Coursera
data = load('ex1data2.txt'); % read comma separated data
x=data(:,2)';
y_act=data(:,3)';
m=size(x,2); %Training Data Size

th1=0; %Initial Guess of Theta1
th0=0; %Inital Guess of Theeta0
alph=0.01; %Learning Rate
costfun=100;
i=1;
deriv_th0=1;    
deriv_th1=1;
ite=1
% Gradient Descent
%%% We can run it in two ways, one is to specify the number of iterations
%%% and the other way is to put a criterion on the Derivatives
while ite<1500
    h=th0+(th1*x);
    deriv_th0=(1/m)*sum(h-y_act);
    deriv_th1=(1/m)*sum((h-y_act).*x);
    th0=th0-(alph*deriv_th0);
    th1=th1-(alph*deriv_th1);
    h=th0+(th1*x);
    costfun=(1/(2*m))*sum((h-y_act).^2);
    ite=ite+1
end

y_pred=x*th; %This is the Hypothesis Function
subplot(2,1,2)
scatter(x(:,2),y_act,'*r')
hold on
plot(x(:,2),y_pred,'-b')
title('Linear Regression Model')
xlabel('Population in 10,000s')
ylabel('Profit in $10,000s')
legend('Actual data','Best Fit Line')
hold off

%%% Plotting the Cost function surface plot
th00=linspace(-5,5,100);
th11=linspace(-4,4,100);
h=repmat(reshape(th00,[1,1,size(th00,2)]),[size(th11,2),size(x,2),1])+repmat(th11'*x,[1,1,size(th00,2)]);
y_act=repmat(y_act,[size(th11,2),1,size(th00,2)]);
sum_h=(1/(2*size(x,2)))*reshape(sum((h-y_act).^2,2),[size(th11,2),size(th00,2),1]);
[th0,th1]=meshgrid(th00,th11);

subplot(2,1,1)
surf(th0,th1,sum_h)
title('Cost Function')
xlabel('\theta_0')
ylabel('\theta_1')
zlabel('J(\theta_0,\theta_1)')
