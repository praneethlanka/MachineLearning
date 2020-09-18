% fil=csvread('Real.csv')
% x=fil(:,3)';
% y_act=fil(:,end)';
x=[1,2,4,3,5];
y_act=[1,3,3,2,5];
th00=0.2305:0.0001:0.2310;
th11=0.79:0.0001:0.7905;`

h=repmat(reshape(th00,[1,1,size(th00,2)]),[size(th11,2),size(x,2),1])+repmat(th11'*x,[1,1,size(th00,2)]);
y_act=repmat(y_act,[size(th11,2),1,size(th00,2)]);

% th0=repmat(reshape(th00,[1,1,size(th00,2)]),[size(th11,2),1,1]);
% th0=reshape(th0,[1,numel(th0),1]);
% th1=repmat(th11',[1,1,    size(th00,2)]);
% th1=reshape(th1,[1,numel(th1),1]);

sum_h=(1/(2*size(x,2)))*reshape(sum((h-y_act).^2,2),[size(th11,2),size(th00,2),1]);

[th0,th1]=meshgrid(th00,th11);
subplot(1,2,1)
surf(th0,th1,sum_h)

th0_fin=th0(sum_h==min(min(sum_h)));
th1_fin=th1(sum_h==min(min(sum_h)));
subplot(1,2,2)
scatter(x,y_act(1,:,1))
hold on
y=repmat(th0_fin,[1,size(x,2)])+(th1_fin*x);
plot(x,y)