clear all
close all
clc
data = importdata('data.xlsx');
T=array2table(data,'variablename',{'D','L','P','G','deltah','X','qc'});
tbl=T;
gprMdl1 = fitrgp(tbl,'qc','KernelFunction','matern32',...
      'FitMethod','sr','PredictMethod','fic')
  %'fitmethod': 'none' | 'exact' | 'sd' | 'sr' | 'fic'
  %'BasisFunction': 'constant' (default) | 'none' | 'linear' | 'pureQuadratic' | function handle
  %'Sigma': std(y)/sqrt(2) (default) | positive scalar value
  %'ConstantSigma':false (default) | true
  %'KernelFunction':'squaredexponential' (default) | 'exponential' | 'matern32' |
  %'matern52' | 'rationalquadratic' | 'ardsquaredexponential' | 'ardexponential' |
  %'ardmatern32' | 'ardmatern52' | 'ardrationalquadratic' | function handle
  %'PredictMethod':'exact' | 'bcd' | 'sd' | 'sr' | 'fic'
  ypred1 = resubPredict(gprMdl1);
  figure();
plot(tbl.qc,'r.');
hold on
plot(ypred1,'b');
xlabel('Data number')
ylabel('CHF')
legend({'data','predictions'},'Location','Best');
title('KernelFunction: matern32');
%axis([-1 515 0 1]);
hold off;
L_matern32 = resubLoss(gprMdl1);
gprMdl2 = fitrgp(tbl,'qc','KernelFunction','squaredexponential',...
      'FitMethod','sr','PredictMethod','fic')
   ypred2 = resubPredict(gprMdl2);
  figure();
plot(tbl.qc,'r.');
hold on
plot(ypred2,'b');
xlabel('Data number')
ylabel('CHF')
legend({'data','predictions'},'Location','Best');
title('KernelFunction:squaredexponential');
%axis([-1 515 0 1]);
hold off;
L_squaredexponential = resubLoss(gprMdl2);
gprMdl3 = fitrgp(tbl,'qc','KernelFunction','ardsquaredexponential',...
      'FitMethod','sr','PredictMethod','fic')
   ypred3 = resubPredict(gprMdl3);
  figure();
plot(tbl.qc,'r.');
hold on
plot(ypred3,'b');
xlabel('Data number')
ylabel('CHF')
legend({'data','predictions'},'Location','Best');
title('KernelFunction:ardsquaredexponential');
%axis([-1 515 0 1]);
hold off;
L_ardsquaredexponential = resubLoss(gprMdl3);
gprMdl4 = fitrgp(tbl,'qc','KernelFunction','exponential',...
      'FitMethod','sr','PredictMethod','fic')
   ypred4 = resubPredict(gprMdl4);
  figure();
plot(tbl.qc,'r.');
hold on
plot(ypred4,'b');
xlabel('Data number')
ylabel('CHF')
legend({'data','predictions'},'Location','Best');
title('KernelFunction:exponential');
hold off;
L_exponential = resubLoss(gprMdl4);
gprMdl5 = fitrgp(tbl,'qc','KernelFunction','matern52',...
      'FitMethod','sr','PredictMethod','fic')
   ypred5 = resubPredict(gprMdl5);
  figure();
plot(tbl.qc,'r.');
hold on
plot(ypred5,'b');
xlabel('Data number')
ylabel('CHF')
legend({'data','predictions'},'Location','Best');
title('KernelFunction:matern52');
%axis([-1 515 0 1]);
hold off;
L_matern52 = resubLoss(gprMdl5);
gprMdl6 = fitrgp(tbl,'qc','KernelFunction','ardmatern32',...
      'FitMethod','sr','PredictMethod','fic')
   ypred6 = resubPredict(gprMdl6);
  figure();
plot(tbl.qc,'r.');
hold on
plot(ypred6,'b');
xlabel('Data number')
ylabel('CHF')
legend({'data','predictions'},'Location','Best');
title('KernelFunction:ardmatern32');
%axis([-1 515 0 1]);
hold off;
L_ardmatern32 = resubLoss(gprMdl6);
gprMdl7 = fitrgp(tbl,'qc','KernelFunction','rationalquadratic',...
      'FitMethod','sr','PredictMethod','fic')
   ypred7 = resubPredict(gprMdl7);
  figure();
plot(tbl.qc,'r.');
hold on
plot(ypred7,'b');
xlabel('Data number')
ylabel('CHF')
legend({'data','predictions'},'Location','Best');
title('KernelFunction:rationalquadratic');
%axis([-1 515 0 1]);
hold off;
L_rationalquadratic = resubLoss(gprMdl7);
gprMdl8 = fitrgp(tbl,'qc','KernelFunction','ardrationalquadratic',...
      'FitMethod','sr','PredictMethod','fic')
   ypred8 = resubPredict(gprMdl8);
  figure();
plot(tbl.qc,'r.');
hold on
plot(ypred8,'b');
xlabel('Data number')
ylabel('CHF')
legend({'data','predictions'},'Location','Best');
title('KernelFunction:ardrationalquadratic');
%axis([-1 515 0 1]);
hold off;
L_ardrationalquadratic= resubLoss(gprMdl8);
gprMdl9 = fitrgp(tbl,'qc','KernelFunction','ardmatern52',...
      'FitMethod','sr','PredictMethod','fic')
   ypred9 = resubPredict(gprMdl9);
  figure();
plot(tbl.qc,'r.');
hold on
plot(ypred9,'b');
xlabel('Data number')
ylabel('CHF')
legend({'data','predictions'},'Location','Best');
title('KernelFunction:ardmatern52');
%axis([-1 515 0 1]);
hold off;
L_ardmatern52= resubLoss(gprMdl9);
gprMdl10 = fitrgp(tbl,'qc','KernelFunction','ardexponential',...
      'FitMethod','sr','PredictMethod','fic')
   ypred10 = resubPredict(gprMdl10);
  figure();
plot(tbl.qc,'r.');
hold on
plot(ypred10,'b');
xlabel('Data number')
ylabel('CHF')
legend({'data','predictions'},'Location','Best');
title('KernelFunction:ardexponential');
%axis([-1 515 0 1]);
hold off;
L_ardexponential= resubLoss(gprMdl10);
M=array2table([L_ardmatern32,L_ardrationalquadratic,L_ardsquaredexponential,...
   L_ardexponential,L_ardmatern52,L_exponential,L_matern32,L_matern52,L_rationalquadratic,...
    L_squaredexponential],'variablename',{'L_ardmatern32','L_ardrationalquadratic','L_ardsquaredexponential',...
   'L_ardexponential','L_ardmatern52','L_exponential','L_matern32','L_matern52','L_rationalquadratic',...
    'L_squaredexponential'});
rows2vars(M)
