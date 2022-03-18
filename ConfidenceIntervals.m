clear all
close all
clc
data = importdata('data.xlsx');
TTT=array2table(data,'variablename',{'D','L','P','G','deltah','X','qc'});
datatrain = importdata('train.xlsx');
datatest = importdata('test.xlsx');
T=array2table(datatrain,'variablename',{'D','L','P','G','deltah','X','qc'});
tbl1=T;
TT=array2table(datatest,'variablename',{'D','L','P','G','deltah','X','qc'});
tbl2=TT;
xtest=datatest(:,1:6);
ytest=datatest(:,7);
xtrain=datatrain(:,1:6);
ytrain=datatrain(:,7);
gprMdl = fitrgp(tbl1,'qc','KernelFunction','ardsquaredexponential',...
      'FitMethod','sr','PredictMethod','fic')
    ypredtest = predict(gprMdl,xtest);
    ypredtrain =resubPredict(gprMdl);
x       = 1:50;
Ypred=ypredtest.';
Data_sd = std(ypredtest);
% prepare it for the fill function
x_ax    = 1:50;
X_plot  = [x_ax, fliplr(x_ax)];
Y_plot  = [Ypred-1.96.*Data_sd, fliplr(Ypred+1.96.*Data_sd)];
% plot a line + confidence bands
hold on 
plot(x_ax, Ypred, 'blue', 'LineWidth', 1.2)
fill(X_plot, Y_plot , 1,....
        'facecolor','blue', ...
        'edgecolor','none', ...
        'facealpha', 0.3);
    plot(1:50,ytest,'bo')
    plot(1:50,ypredtest,'r*')
    H=abs((ytest-ypredtest));
Error_ytestypredtest=H
    errorbar(x,Ypred,H,'k')
    legend('Prediction of Test Set','95% confidence interval','actual values','Predict point','Error bars','Location','Best')
title('Confidence Interval ardsquaredexponential kernel')
xlabel('Data number')
ylabel('CHF')
hold off
gprMdl1 = fitrgp(tbl1,'qc','KernelFunction','squaredexponential',...
      'FitMethod','sr','PredictMethod','fic')
  ypredtest1 = predict(gprMdl1,xtest);
    ypredtrain1 =resubPredict(gprMdl1);
Ypred1=(ypredtest1).';
Data_sd1 = std(Ypred1);
% prepare it for the fill function
x_axx    = 1:50;
X_plot  = [x_axx, fliplr(x_axx)];
Y_plot  = [Ypred1-1.96.*Data_sd1, fliplr(Ypred1+1.96.*Data_sd1)];
% plot a line + confidence bands
figure()
hold on 
plot(x_axx, Ypred1, 'blue', 'LineWidth', 1.2)
fill(X_plot, Y_plot , 1,....
        'facecolor','blue', ...
        'edgecolor','none', ...
        'facealpha', 0.3);
    plot(1:50,ytest,'bo')
    plot(1:50,Ypred1,'r*')
    HH=abs((ytest-ypredtest1));
Error_ytestypredtest1 = HH
    errorbar(x,ypredtest1,HH,'k')
    legend('Prediction of Test Set','95% confidence interval','actual values','Predict point','Error bars','Location','Best')
title('Confidence Interval squared exponential kernel')
xlabel('Data number')
ylabel('CHF')
hold off
x=1:50;
xx=x';
figure()
fitresult=fit(xx,ypredtest,'poly1');
p11 = predint(fitresult,xx,0.95,'observation','off');
p12 = predint(fitresult,xx,0.95,'observation','on');
p21 = predint(fitresult,xx,0.95,'functional','off');
p22 = predint(fitresult,xx,0.95,'functional','on');
subplot(2,2,1)
plot(fitresult,xx,ypredtest)
hold on
plot(xx,p11,'m--')
title('Nonsimultaneous Observation Bounds','FontSize',9)
legend off  
subplot(2,2,2)
plot(fitresult,xx,ypredtest)
hold on
plot(xx,p12,'m--')
title('Simultaneous Observation Bounds','FontSize',9)
legend off
subplot(2,2,3)
plot(fitresult,xx,ypredtest)
hold on
plot(xx,p21,'m--')
title('Nonsimultaneous Functional Bounds','FontSize',9)
legend off

subplot(2,2,4)
plot(fitresult,xx,ypredtest)
hold on
plot(xx,p22,'m--')
title('Simultaneous Functional Bounds','FontSize',9)
legend({'Data','Fitted curve', 'Prediction intervals'},...
       'FontSize',8,'Location','northeast')
   figure()
fitresult1=fit(xx,ypredtest1,'poly1');
p11 = predint(fitresult1,xx,0.95,'observation','off');
p12 = predint(fitresult1,xx,0.95,'observation','on');
p21 = predint(fitresult1,xx,0.95,'functional','off');
p22 = predint(fitresult1,xx,0.95,'functional','on');
subplot(2,2,1)
plot(fitresult1,xx,ypredtest1)
hold on
plot(xx,p11,'m--')
title('Nonsimultaneous Observation Bounds','FontSize',9)
legend off  
subplot(2,2,2)
plot(fitresult1,xx,ypredtest1)
hold on
plot(xx,p12,'m--')
title('Simultaneous Observation Bounds','FontSize',9)
legend off
subplot(2,2,3)
plot(fitresult1,xx,ypredtest1)
hold on
plot(xx,p21,'m--')
title('Nonsimultaneous Functional Bounds','FontSize',9)
legend off

subplot(2,2,4)
plot(fitresult1,xx,ypredtest1)
hold on
plot(xx,p22,'m--')
title('Simultaneous Functional Bounds','FontSize',9)

[ytestpred,~,ytestci] = predict(gprMdl,xtest);
figure;
plot(ytest,'r');
hold on;
plot(ytestpred,'b');
plot(ytestci(:,1),'k-');
plot(ytestci(:,2),'k-');
legend('Actual response','GPR predictions',...
'95% lower','95% upper','Location','Best');
title('covariace kernel:ardsquaredexponential');
hold off
[ytestpred,~,ytestci] = predict(gprMdl1,xtest);
figure;
plot(ytest,'r');
hold on;
plot(ytestpred,'b');
plot(ytestci(:,1),'k-');
plot(ytestci(:,2),'k-');
legend('Actual response','GPR predictions',...
'95% lower','95% upper','Location','Best');
title('covariace kernel:squaredexponential');
hold off
