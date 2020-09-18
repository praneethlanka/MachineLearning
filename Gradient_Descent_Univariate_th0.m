%%% The results obtained from this code have been verified with the
%%% brute-force method. The parameter predicted by botht the methods is the
%%% same
x=[1,2,4,3,5];
y_act=[1,3,3,2,5];

m=size(x,2);
%%% Let the Hypothesis be just dependent on th1 
%%% So we need an initial guess for th1

th1=0.5; %Initial Guess of Theta1
alph=0.1; %Learning Rate
deriv_th1=100;
i=20
while abs(deriv_th1)>1e-6 
    h=th1*x;
    deriv_th1=(1/m)*sum((h-y_act).*x);
    th1=th1-(alph*deriv_th1);
    costfun=(1/(2*m))*sum(((th1*x)-y_act).^2)
end

y_pred=th1*x;  %This is the Hypothesis Function
scatter(x,y_act,'*r')
hold on
plot(x,y_pred,'-ob')
hold off
