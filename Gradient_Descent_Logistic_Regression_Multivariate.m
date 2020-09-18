%% This is just two classes X1 and X2. 
%It has to be saled for more number of classes
data=load('ex2data1.txt');
x=data(:,1:end-1);
y=data(:,end);


[m,n]=size(x);  %m=No. of Training Examples, n=No. of Features
%Number of classes
classes=unique(y);
noc=size(classes,1);

%Features are classsified based on their classes
%and are plotted with different colors for different classes
feat=cell(noc,1);

pntColor=hsv(noc);  

X=[ones(m,1),x]; 
the=zeros(n+1,1); %Inital Guess of theta

ite=10000000;
J=zeros(ite,1);
alpha=0.001;
%Gradient Descent it is very slow. 
%I can choose a higher alpha,but it is diverging. 
%THerefor I need to use sime inbuilt optimisation algorithm
for i=1:ite
    h=sigmoid(X*the);
    J(i)=sum(-y.*log(h)-(1-y).*log(1-h))*(1/m); %Cost Function
    grad=(1/m)*((h-y)'*X)';  %Gradients
    the=the-(alpha*grad);
end
plot(1:ite,J)

x1_desci=(min(x(:,2)-10):(max(x(:,2))+10));
x1_desci=[ones(size(x1_desci,2),1),x1_desci'];
x2_desci=-(x1_desci*the(1:2))./the(3);

for i=1:noc
    feat{i}=x(y==classes(i),:);
    scatter(feat{i}(:,1),feat{i}(:,2),'Marker','x','MarkerFaceColor',pntColor(i,:))
    hold on
end
plot(x1_desci(:,2),x2_desci)

%%% Testing the hypothesis on our training data
h_pred=sigmoid(X*the);
h_pred(h_pred>0.5)=1;
h_pred(h_pred<0.5)=0;

options=optimoptions(@fminunc,'Display','iter','Algorithm','quasi-newton','SpecifyObjectiveGradient',true);
ini_the=zeros(3,1);

[the,cost]=fminunc([J,grad],ini_the,options)