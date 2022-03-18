clear all
close all
clc
tic
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
    toc
L_ardsquaredexponential = loss(gprMdl,tbl2)
gprMdl1 = fitrgp(tbl1,'qc','KernelFunction','matern32',...
      'FitMethod','sr','PredictMethod','fic')
  ypredtest1 = predict(gprMdl1,xtest);
    ypredtrain1 =resubPredict(gprMdl1);
    gprMdl2 = fitrgp(tbl1,'qc','KernelFunction','ardmatern32',...
      'FitMethod','sr','PredictMethod','fic')
   ypredtest2 = predict(gprMdl2,xtest);
    ypredtrain2 =resubPredict(gprMdl2);
    figure()
    hold on
    plot(51:512,ypredtrain,'b');
plot(1:50,ypredtest,'r');
plot(51:512,ytrain,'bo');
plot(1:50,ytest,'ro');
xlabel('Data number');
ylabel('CHF');
legend({'predictions(Train)','predictions(Test)','Train Data','Test Data'},'Location','Best');
title('KernelFunction:ardsquaredexponential ');
hold off;
    figure()
    hold on
    plot(51:512,ypredtrain1,'b');
plot(1:50,ypredtest1,'r');
plot(51:512,ytrain,'bo');
plot(1:50,ytest,'ro');
xlabel('Data number');
ylabel('CHF');
legend({'predictions(Train)','predictions(Test)','Train Data','Test Data'},'Location','Best');
title('KernelFunction: matern32');
hold off;
figure()
    hold on
    plot(51:512,ypredtrain2,'b');
plot(1:50,ypredtest2,'r');
plot(51:512,ytrain,'bo');
plot(1:50,ytest,'ro');
xlabel('Data number');
ylabel('CHF');
legend({'predictions(Train)','predictions(Test)','Train Data','Test Data'},'Location','Best');
title('KernelFunction: ardmatern32');
hold off;
 gprMdl3 = fitrgp(tbl1,'qc','KernelFunction','ardrationalquadratic',...
      'FitMethod','sr','PredictMethod','fic')
 ypredtest3 = predict(gprMdl3,xtest);
    ypredtrain3 =resubPredict(gprMdl3);
    figure()
    hold on
    plot(51:512,ypredtrain3,'b');
plot(1:50,ypredtest3,'r');
plot(51:512,ytrain,'bo');
plot(1:50,ytest,'ro');
xlabel('Data number');
ylabel('CHF');
legend({'predictions(Train)','predictions(Test)','Train Data','Test Data'},'Location','Best');
title('KernelFunction: ardrationalquadratic');
hold off;
 gprMdl4 = fitrgp(tbl1,'qc','KernelFunction','ardmatern52',...
      'FitMethod','sr','PredictMethod','fic')
  ypredtest4 = predict(gprMdl4,xtest);
    ypredtrain4 =resubPredict(gprMdl4);
    figure()
    hold on
    plot(51:512,ypredtrain4,'b');
plot(1:50,ypredtest4,'r');
plot(51:512,ytrain,'bo');
plot(1:50,ytest,'ro');
xlabel('Data number');
ylabel('CHF');
legend({'predictions(Train)','predictions(Test)','Train Data','Test Data'},'Location','Best');
title('KernelFunction: ardsmatern52');
hold off;
gprMdl5 = fitrgp(tbl1,'qc','KernelFunction','exponential',...
      'FitMethod','sr','PredictMethod','fic')
  ypredtest5 = predict(gprMdl5,xtest);
    ypredtrain5 =resubPredict(gprMdl5);
    figure()
    hold on
    plot(51:512,ypredtrain5,'b');
plot(1:50,ypredtest5,'r');
plot(51:512,ytrain,'bo');
plot(1:50,ytest,'ro');
xlabel('Data number');
ylabel('CHF');
legend({'predictions(Train)','predictions(Test)','Train Data','Test Data'},'Location','Best');
title('KernelFunction: exponential');
hold off;
gprMdl6 = fitrgp(tbl1,'qc','KernelFunction','matern52',...
      'FitMethod','sr','PredictMethod','fic')
  ypredtest6 = predict(gprMdl6,xtest);
    ypredtrain6 =resubPredict(gprMdl6);
    figure()
    hold on
    plot(51:512,ypredtrain6,'b');
plot(1:50,ypredtest6,'r');
plot(51:512,ytrain,'bo');
plot(1:50,ytest,'ro');
xlabel('Data number');
ylabel('CHF');
legend({'predictions(Train)','predictions(Test)','Train Data','Test Data'},'Location','Best');
title('KernelFunction: matern52');
hold off;
gprMdl7 = fitrgp(tbl1,'qc','KernelFunction','rationalquadratic',...
      'FitMethod','sr','PredictMethod','fic')
  ypredtest7 = predict(gprMdl7,xtest);
    ypredtrain7 =resubPredict(gprMdl7);
    figure()
    hold on
    plot(51:512,ypredtrain7,'b');
plot(1:50,ypredtest7,'r');
plot(51:512,ytrain,'bo');
plot(1:50,ytest,'ro');
xlabel('Data number');
ylabel('CHF');
legend({'predictions(Train)','predictions(Test)','Train Data','Test Data'},'Location','Best');
title('KernelFunction: rationalquadratic');
hold off;
gprMdl8 = fitrgp(tbl1,'qc','KernelFunction','squaredexponential',...
      'FitMethod','sr','PredictMethod','fic')
  ypredtest8 = predict(gprMdl8,xtest);
    ypredtrain8 =resubPredict(gprMdl8);
    figure()
    hold on
    plot(51:512,ypredtrain8,'b');
plot(1:50,ypredtest8,'r');
plot(51:512,ytrain,'bo');
plot(1:50,ytest,'ro');
xlabel('Data number');
ylabel('CHF');
legend({'predictions(Train)','predictions(Test)','Train Data','Test Data'},'Location','Best');
title('KernelFunction: squaredexponential');
hold off;
 gprMdl9 = fitrgp(tbl1,'qc','KernelFunction','ardexponential',...
      'FitMethod','sr','PredictMethod','fic')
  ypredtest9 = predict(gprMdl9,xtest);
    ypredtrain9 =resubPredict(gprMdl9);
    figure()
    hold on
    plot(51:512,ypredtrain9,'b');
plot(1:50,ypredtest9,'r');
plot(51:512,ytrain,'bo');
plot(1:50,ytest,'ro');
xlabel('Data number');
ylabel('CHF');
legend({'predictions(Train)','predictions(Test)','Train Data','Test Data'},'Location','Best');
title('KernelFunction: ardexponential');
hold off;
Y=abs((ytest-ypredtest)./ytest);
N=size(Y,1);
MAPEtest_ardsquaredexponential=((sum(Y))*100)/N;
RMSEtest_ardsquaredexponential=sqrt((sum((ytest-ypredtest).^2))/N);
YY=abs((ytrain-ypredtrain)./ytrain);
HH=abs((ytrain-ypredtrain));
H=abs((ytest-ypredtest));
M=size(YY,1);
MAPEtrain_ardsquaredexponential=((sum(YY))*100)/M;
RMSEtrain_ardsquaredexponential=sqrt((sum((ytrain-ypredtrain).^2))/M);
figure;
hold on;
plot(51:512,ypredtrain,'b');
plot(1:50,ypredtest,'r');
xlabel('Data number');
ylabel('CHF');
legend({'GPR predicted values Train Data','GPR predicted values Test Data'},'Location','Best');
title('KernelFunction: ardsquaredexponential')
hold off
figure;
hold on;
plot(ytrain,ypredtrain,'bo');
plot(ytest,ypredtest,'ro');
f=fit([ytest;ytrain],[ypredtest;ypredtrain],'poly1');
plot(f,[ytest;ytrain],[ypredtest;ypredtrain],'k');
xlabel('Experimental values')
ylabel('CHF')
legend('Training Set','Test Set','fit','Best fit','Location','Best')
title('KernelFunction:ardsquaredexponential')
hold off
ZZ=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;HH];
figure;
hold on
bar(ZZ,'edgecolor','b','facecolor','b');
bar(H,'edgecolor','r','facecolor','r');
xlabel('Data Number')
ylabel('Prediction Error')
legend('Training Set','Test Set','Location','Best')
title('KernelFunction:ardsquaredexponential')
hold off
figure;
hold on
plot(51:512,ytrain,'bo')
plot(1:50,ytest,'ro')
plot(51:512,ypredtrain,'b*');
plot(1:50,ypredtest,'r*');
xlabel('Data number')
ylabel('CHF')
bar(ZZ,'edgecolor','b','facecolor','b');
bar(H,'edgecolor','r','facecolor','r');
legend({'Training Set','Test Set','Prediction of Train Set',...
    'Prediction of Test Set','Error(Train)','Error(Test)'},'Location','Best')
title('KernelFunction:ardsquaredexponential')
hold off
Y1=abs((ytest-ypredtest1)./ytest);
N1=size(Y1,1);
MAPEtest_matern32=((sum(Y1))*100)/N1;
RMSEtest_matern32=sqrt((sum((ytest-ypredtest1).^2))/N1);
YY1=abs((ytrain-ypredtrain1)./ytrain);
HH1=abs((ytrain-ypredtrain1));
H1=abs((ytest-ypredtest1));
M1=size(YY1,1);
MAPEtrain_matern32=((sum(YY1))*100)/M1;
RMSEtrain_matern32=sqrt((sum((ytrain-ypredtrain1).^2))/M1);
figure
hold on;
plot(51:512,ypredtrain1,'b');
plot(1:50,ypredtest1,'r');
xlabel('Data number');
ylabel('CHF');
legend({'GPR predicted values Train Data','GPR predicted values Test Data'},'Location','Best');
title('KernelFunction: matern32')
hold off
figure;
hold on;
plot(ytrain,ypredtrain1,'bo');
plot(ytest,ypredtest1,'ro');
f=fit([ytest;ytrain],[ypredtest1;ypredtrain1],'poly1');
plot(f,[ytest;ytrain],[ypredtest1;ypredtrain1],'k');
xlabel('Experimental values')
ylabel('CHF')
legend('Training Set','Test Set','fit','best fit','Location','Best')
title('KernelFunction:matern32')
hold off
ZZ1=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;HH1];
figure;
hold on
bar(ZZ1,'edgecolor','b','facecolor','b');
bar(H1,'edgecolor','r','facecolor','r');
xlabel('Data Number')
ylabel('Prediction Error')
legend('Training Set','Test Set','Location','Best')
title('KernelFunction:matern32')
hold off
figure;
hold on
plot(51:512,ytrain,'bo')
plot(1:50,ytest,'ro')
plot(51:512,ypredtrain1,'b*');
plot(1:50,ypredtest1,'r*');
xlabel('Data number')
ylabel('CHF')
bar(ZZ1,'edgecolor','b','facecolor','b');
bar(H1,'edgecolor','r','facecolor','r');
legend({'Training Set','Test Set','Prediction of Train Set',...
    'Prediction of Test Set','Error(Train)','Error(Test)'},'Location','Best')
title('KernelFunction:matern32')
hold off
Y2=abs((ytest-ypredtest2)./ytest);
N2=size(Y2,1);
MAPEtest_ardmatern32=((sum(Y2))*100)/N2;
RMSEtest_ardmatern32=sqrt((sum((ytest-ypredtest2).^2))/N2);
YY2=abs((ytrain-ypredtrain2)./ytrain);
HH2=abs((ytrain-ypredtrain2));
H2=abs((ytest-ypredtest2));
M2=size(YY2,1);
MAPEtrain_ardmatern32=((sum(YY2))*100)/M2;
RMSEtrain_ardmatern32=sqrt((sum((ytrain-ypredtrain2).^2))/M2);
figure;
hold on;
plot(51:512,ypredtrain2,'b');
plot(1:50,ypredtest2,'r');
xlabel('Data number');
ylabel('CHF');
legend({'GPR predicted values Train Data','GPR predicted values Test Data'},'Location','Best');
title('KernelFunction: ardmatern32')
hold off
figure;
hold on;
plot(ytrain,ypredtrain2,'bo');
plot(ytest,ypredtest2,'ro');
f=fit([ytest;ytrain],[ypredtest2;ypredtrain2],'poly1');
plot(f,[ytest;ytrain],[ypredtest2;ypredtrain2],'k');
xlabel('Experimental values')
ylabel('CHF')
legend('Training Set','Test Set','fit','Best fit','Location','Best')
title('KernelFunction:ardmatern32')
hold off
figure;
hold on;
plot(ytrain,ypredtrain1,'bo');
plot(ytest,ypredtest1,'ro');
f=fit([ytest;ytrain],[ypredtest1;ypredtrain1],'poly1');
plot(f,[ytest;ytrain],[ypredtest1;ypredtrain1],'k');
xlabel('Experimental values')
ylabel('CHF')
legend('Training Set','Test Set','fit','Best fit','Location','Best')
title('KernelFunction:matern32')
hold off
ZZ2=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;HH2];
figure;
hold on
bar(ZZ2,'edgecolor','b','facecolor','b');
bar(H2,'edgecolor','r','facecolor','r');
xlabel('Data Number')
ylabel('Prediction Error')
legend('Training Set','Test Set','Location','Best')
title('KernelFunction:ardmatern32')
hold off
figure;
hold on
plot(51:512,ytrain,'bo')
plot(1:50,ytest,'ro')
plot(51:512,ypredtrain2,'b*');
plot(1:50,ypredtest2,'r*');
xlabel('Data number')
ylabel('CHF')
bar(ZZ2,'edgecolor','b','facecolor','b');
bar(H2,'edgecolor','r','facecolor','r');
legend({'Training Set','Test Set','Prediction of Train Set',...
    'Prediction of Test Set','Error(Train)','Error(Test)'},'Location','Best')
title('KernelFunction:ardmatern32')
hold off
Y3=abs((ytest-ypredtest3)./ytest);
N3=size(Y3,1);
MAPEtest_ardrationalquadratic=((sum(Y3))*100)/N3;
RMSEtest_ardrationalquadratic=sqrt((sum((ytest-ypredtest3).^2))/N3);
YY3=abs((ytrain-ypredtrain3)./ytrain);
HH3=abs((ytrain-ypredtrain3));
H3=abs((ytest-ypredtest3));
M3=size(YY3,1);
MAPEtrain_ardrationalquadratic=((sum(YY3))*100)/M3;
RMSEtrain_ardrationalquadratic=sqrt((sum((ytrain-ypredtrain3).^2))/M3);
Y4=abs((ytest-ypredtest4)./ytest);
N4=size(Y4,1);
MAPEtest_ardmatern52=((sum(Y4))*100)/N4;
RMSEtest_ardmatern52=sqrt((sum((ytest-ypredtest4).^2))/N4);
YY4=abs((ytrain-ypredtrain4)./ytrain);
HH4=abs((ytrain-ypredtrain4));
H4=abs((ytest-ypredtest4));
M4=size(YY4,1);
MAPEtrain_ardmatern52=((sum(YY4))*100)/M4;
RMSEtrain_ardmatern52=sqrt((sum((ytrain-ypredtrain4).^2))/M4);
Y5=abs((ytest-ypredtest5)./ytest);
N5=size(Y5,1);
MAPEtest_exponential=((sum(Y5))*100)/N5;
RMSEtest_exponential=sqrt((sum((ytest-ypredtest5).^2))/N5);
YY5=abs((ytrain-ypredtrain5)./ytrain);
HH5=abs((ytrain-ypredtrain5));
H5=abs((ytest-ypredtest5));
M5=size(YY5,1);
MAPEtrain_exponential=((sum(YY5))*100)/M5;
RMSEtrain_exponential=sqrt((sum((ytrain-ypredtrain5).^2))/M5);
Y6=abs((ytest-ypredtest6)./ytest);
N6=size(Y6,1);
MAPEtest_matern52=((sum(Y6))*100)/N6;
RMSEtest_matern52=sqrt((sum((ytest-ypredtest6).^2))/N6);
YY6=abs((ytrain-ypredtrain6)./ytrain);
HH6=abs((ytrain-ypredtrain6));
H6=abs((ytest-ypredtest6));
M6=size(YY6,1);
MAPEtrain_matern52=((sum(YY6))*100)/M6;
RMSEtrain_matern52=sqrt((sum((ytrain-ypredtrain6).^2))/M6);
Y7=abs((ytest-ypredtest7)./ytest);
N7=size(Y7,1);
MAPEtest_rationalquadratic=((sum(Y7))*100)/N7;
RMSEtest_rationalquadratic=sqrt((sum((ytest-ypredtest7).^2))/N7);
YY7=abs((ytrain-ypredtrain7)./ytrain);
HH7=abs((ytrain-ypredtrain7));
H7=abs((ytest-ypredtest7));
M7=size(YY7,1);
MAPEtrain_rationalquadratic=((sum(YY7))*100)/M7;
RMSEtrain_rationalquadratic=sqrt((sum((ytrain-ypredtrain7).^2))/M7);
Y8=abs((ytest-ypredtest8)./ytest);
N8=size(Y8,1);
MAPEtest_squaredexponential=((sum(Y8))*100)/N8;
RMSEtest_squaredexponential=sqrt((sum((ytest-ypredtest8).^2))/N8);
YY8=abs((ytrain-ypredtrain8)./ytrain);
HH8=abs((ytrain-ypredtrain8));
H8=abs((ytest-ypredtest8));
M8=size(YY8,1);
MAPEtrain_squaredexponential=((sum(YY8))*100)/M8;
RMSEtrain_squaredexponential=sqrt((sum((ytrain-ypredtrain8).^2))/M8);
Y9=abs((ytest-ypredtest9)./ytest);
N9=size(Y9,1);
MAPEtest_ardexponential=((sum(Y9))*100)/N9;
RMSEtest_ardexponential=sqrt((sum((ytest-ypredtest9).^2))/N9);
YY9=abs((ytrain-ypredtrain9)./ytrain);
HH9=abs((ytrain-ypredtrain9));
H9=abs((ytest-ypredtest9));
M9=size(YY9,1);
MAPEtrain_ardexponential=((sum(YY9))*100)/M9;
RMSEtrain_ardexponential=sqrt((sum((ytrain-ypredtrain9).^2))/M9);
S=array2table([MAPEtest_ardmatern32,MAPEtest_ardrationalquadratic,MAPEtest_ardsquaredexponential,...
    MAPEtest_exponential,MAPEtest_matern32,MAPEtest_matern52,MAPEtest_ardmatern52,MAPEtest_rationalquadratic,MAPEtest_squaredexponential...
    ,MAPEtest_ardexponential,MAPEtrain_ardmatern32,MAPEtrain_ardrationalquadratic,MAPEtrain_ardsquaredexponential,MAPEtrain_exponential...
    ,MAPEtrain_matern32,MAPEtrain_matern52,MAPEtrain_ardmatern52,MAPEtrain_rationalquadratic,MAPEtrain_squaredexponential,MAPEtrain_ardexponential,...
   RMSEtest_ardmatern32,RMSEtest_ardrationalquadratic,RMSEtest_ardsquaredexponential,RMSEtest_exponential,...
  RMSEtest_matern32,RMSEtest_matern52,RMSEtest_ardmatern52,RMSEtest_rationalquadratic,RMSEtest_squaredexponential,RMSEtest_ardexponential,...
 RMSEtrain_ardmatern32,RMSEtrain_ardrationalquadratic,RMSEtrain_ardsquaredexponential,RMSEtrain_exponential,...
RMSEtrain_matern32,RMSEtrain_matern52,RMSEtrain_ardmatern52,RMSEtrain_rationalquadratic,RMSEtrain_squaredexponential,RMSEtrain_ardexponential ],'variablename',...
    {'MAPEtest_ardmatern32','MAPEtest_ardrationalquadratic','MAPEtest_ardsquaredexponential','MAPEtest_exponential',...
    'MAPEtest_matern32','MAPEtest_matern52','MAPEtest_ardmatern52','MAPEtest_rationalquadratic','MAPEtest_squaredexponential','MAPEtest_ardexponential'...
    ,'MAPEtrain_ardmatern32','MAPEtrain_ardrationalquadratic','MAPEtrain_ardsquaredexponential','MAPEtrain_exponential',...
    'MAPEtrain_matern32','MAPEtrain_matern52','MAPEtrain_ardmatern52','MAPEtrain_rationalquadratic','MAPEtrain_squaredexponential','MAPEtrain_ardexponential',...
    'RMSEtest_ardmatern32','RMSEtest_ardrationalquadratic','RMSEtest_ardsquaredexponential','RMSEtest_exponential',...
    'RMSEtest_matern32','RMSEtest_matern52','RMSEtest_ardmatern52','RMSEtest_rationalquadratic','RMSEtest_squaredexponential','RMSEtest_ardexponential',...
   'RMSEtrain_ardmatern32','RMSEtrain_ardrationalquadratic','RMSEtrain_ardsquaredexponential','RMSEtrain_exponential',...
  'RMSEtrain_matern32','RMSEtrain_matern52','RMSEtrain_ardmatern52','RMSEtrain_rationalquadratic','RMSEtrain_squaredexponential','RMSEtrain_ardexponential'});
rows2vars(S)
figure;
hold on;
[curve, goodness, output] = fit(ytest,ypredtest1,'poly1');
plot(curve,ytest,ypredtest1);
xlabel('Experimental values')
ylabel('CHF')
legend('Test Set','Best fit','Location','Best')
title('KernelFunction:matern32')
hold off
figure;
hold on;
[curve, goodness, output] = fit([ytest;ytrain],[ypredtest;ypredtrain],'poly1');
plot(curve,[ytest;ytrain],[ypredtest;ypredtrain]);
xlabel('Experimental values')
ylabel('CHF(predict)')
legend('GPR(CHF)','Best fit','Location','Best')
title('KernelFunction:ardsquaredexponential')
hold off
H3=abs((ytest-ypredtest3));
HH3=abs((ytrain-ypredtrain3));
ZZ3=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;HH3];
figure;
hold on
plot(51:512,ytrain,'bo')
plot(1:50,ytest,'ro')
plot(51:512,ypredtrain3,'b*');
plot(1:50,ypredtest3,'r*');
xlabel('Data number')
ylabel('CHF')
bar(ZZ3,'edgecolor','b','facecolor','b');
bar(H3,'edgecolor','r','facecolor','r');
legend({'Training Set','Test Set','Prediction of Train Set',...
    'Prediction of Test Set','Error(Train)','Error(Test)'},'Location','Best')
title('KernelFunction:ardrationalquadratic')
hold off
H4=abs((ytest-ypredtest4));
HH4=abs((ytrain-ypredtrain4));
ZZ4=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;HH4];
figure;
hold on
plot(51:512,ytrain,'bo')
plot(1:50,ytest,'ro')
plot(51:512,ypredtrain4,'b*');
plot(1:50,ypredtest4,'r*');
xlabel('Data number')
ylabel('CHF')
bar(ZZ4,'edgecolor','b','facecolor','b');
bar(H4,'edgecolor','r','facecolor','r');
legend({'Training Set','Test Set','Prediction of Train Set',...
    'Prediction of Test Set','Error(Train)','Error(Test)'},'Location','Best')
title('KernelFunction:ardmatern52')
hold off
H5=abs((ytest-ypredtest5));
HH5=abs((ytrain-ypredtrain5));
ZZ5=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;HH5];
figure;
hold on
plot(51:512,ytrain,'bo')
plot(1:50,ytest,'ro')
plot(51:512,ypredtrain5,'b*');
plot(1:50,ypredtest5,'r*');
xlabel('Data number')
ylabel('CHF')
bar(ZZ5,'edgecolor','b','facecolor','b');
bar(H5,'edgecolor','r','facecolor','r');
legend({'Training Set','Test Set','Prediction of Train Set',...
    'Prediction of Test Set','Error(Train)','Error(Test)'},'Location','Best')
title('KernelFunction:exponential')
hold off
H6=abs((ytest-ypredtest6));
HH6=abs((ytrain-ypredtrain6));
ZZ6=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;HH6];
figure;
hold on
plot(51:512,ytrain,'bo')
plot(1:50,ytest,'ro')
plot(51:512,ypredtrain6,'b*');
plot(1:50,ypredtest6,'r*');
xlabel('Data number')
ylabel('CHF')
bar(ZZ6,'edgecolor','b','facecolor','b');
bar(H6,'edgecolor','r','facecolor','r');
legend({'Training Set','Test Set','Prediction of Train Set',...
    'Prediction of Test Set','Error(Train)','Error(Test)'},'Location','Best')
title('KernelFunction:matern52')
hold off
H7=abs((ytest-ypredtest7));
HH7=abs((ytrain-ypredtrain7));
ZZ7=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;HH7];
figure;
hold on
plot(51:512,ytrain,'bo')
plot(1:50,ytest,'ro')
plot(51:512,ypredtrain7,'b*');
plot(1:50,ypredtest7,'r*');
xlabel('Data number')
ylabel('CHF')
bar(ZZ7,'edgecolor','b','facecolor','b');
bar(H7,'edgecolor','r','facecolor','r');
legend({'Training Set','Test Set','Prediction of Train Set',...
    'Prediction of Test Set','Error(Train)','Error(Test)'},'Location','Best')
title('KernelFunction:rationalquadratic')
hold off
H8=abs((ytest-ypredtest8));
HH8=abs((ytrain-ypredtrain8));
ZZ8=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;HH8];
figure;
hold on
plot(51:512,ytrain,'bo')
plot(1:50,ytest,'ro')
plot(51:512,ypredtrain8,'b*');
plot(1:50,ypredtest8,'r*');
xlabel('Data number')
ylabel('CHF')
bar(ZZ8,'edgecolor','b','facecolor','b');
bar(H8,'edgecolor','r','facecolor','r');
legend({'Training Set','Test Set','Prediction of Train Set',...
    'Prediction of Test Set','Error(Train)','Error(Test)'},'Location','Best')
title('KernelFunction:squareexponential')
hold off
H9=abs((ytest-ypredtest9));
HH9=abs((ytrain-ypredtrain9));
ZZ9=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;HH9];
figure;
hold on
plot(51:512,ytrain,'bo')
plot(1:50,ytest,'ro')
plot(51:512,ypredtrain9,'b*');
plot(1:50,ypredtest9,'r*');
xlabel('Data number')
ylabel('CHF')
bar(ZZ9,'edgecolor','b','facecolor','b');
bar(H9,'edgecolor','r','facecolor','r');
legend({'Training Set','Test Set','Prediction of Train Set',...
    'Prediction of Test Set','Error(Train)','Error(Test)'},'Location','Best')
title('KernelFunction:ardexponential')
hold off
figure;
hold on;
plot(ytrain,ypredtrain3,'bo');
plot(ytest,ypredtest3,'ro');
f=fit([ytest;ytrain],[ypredtest3;ypredtrain3],'poly1');
plot(f,[ytest;ytrain],[ypredtest3;ypredtrain3],'k');
xlabel('Experimental values')
ylabel('CHF')
legend('Training Set','Test Set','fit','Best fit','Location','Best')
title('KernelFunction:ardrationalquadratic')
hold off
figure;
hold on;
plot(ytrain,ypredtrain4,'bo');
plot(ytest,ypredtest4,'ro');
f=fit([ytest;ytrain],[ypredtest4;ypredtrain4],'poly1');
plot(f,[ytest;ytrain],[ypredtest4;ypredtrain4],'k');
xlabel('Experimental values')
ylabel('CHF')
legend('Training Set','Test Set','fit','Best fit','Location','Best')
title('KernelFunction:ardmaten52')
hold off
figure;
hold on;
plot(ytrain,ypredtrain5,'bo');
plot(ytest,ypredtest5,'ro');
f=fit([ytest;ytrain],[ypredtest5;ypredtrain5],'poly1');
plot(f,[ytest;ytrain],[ypredtest5;ypredtrain5],'k');
xlabel('Experimental values')
ylabel('CHF')
legend('Training Set','Test Set','fit','Best fit','Location','Best')
title('KernelFunction:exponential')
hold off
figure;
hold on;
plot(ytrain,ypredtrain6,'bo');
plot(ytest,ypredtest6,'ro');
f=fit([ytest;ytrain],[ypredtest6;ypredtrain6],'poly1');
plot(f,[ytest;ytrain],[ypredtest6;ypredtrain6],'k');
xlabel('Experimental values')
ylabel('CHF')
legend('Training Set','Test Set','fit','Best fit','Location','Best')
title('KernelFunction:matern52')
hold off
figure;
hold on;
plot(ytrain,ypredtrain7,'bo');
plot(ytest,ypredtest7,'ro');
f=fit([ytest;ytrain],[ypredtest7;ypredtrain7],'poly1');
plot(f,[ytest;ytrain],[ypredtest7;ypredtrain7],'k');
xlabel('Experimental values')
ylabel('CHF')
legend('Training Set','Test Set','fit','Best fit','Location','Best')
title('KernelFunction:rationalquadratic')
hold off
figure;
hold on;
plot(ytrain,ypredtrain8,'bo');
plot(ytest,ypredtest8,'ro');
f=fit([ytest;ytrain],[ypredtest8;ypredtrain8],'poly1');
plot(f,[ytest;ytrain],[ypredtest8;ypredtrain8],'k');
xlabel('Experimental values')
ylabel('CHF')
legend('Training Set','Test Set','fit','Best fit','Location','Best')
title('KernelFunction:squareexponential')
hold off
figure;
hold on;
plot(ytrain,ypredtrain9,'bo');
plot(ytest,ypredtest9,'ro');
f=fit([ytest;ytrain],[ypredtest9;ypredtrain9],'poly1');
plot(f,[ytest;ytrain],[ypredtest9;ypredtrain9],'k');
xlabel('Experimental values')
ylabel('CHF')
legend('Training Set','Test Set','fit','Best fit','Location','Best')
title('KernelFunction:ardexponential')
hold off