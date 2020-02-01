clear all; clc; addpath(genpath(pwd));

%% Plot FMR & FNMR
load('fmr.mat'); load('fnmr.mat');
figure, hold on;

afmr=mean(fmr,2);
plot(0.01:.01:1,afmr,'LineWidth',2);
text(0.60,0.3,'\leftarrow FNMR','HorizontalAlignment','left');

afnmr=mean(fnmr,2);
plot(0.01:.01:1,afnmr,'r','LineWidth',2);
text(0.27,0.5,'FMR \rightarrow','HorizontalAlignment','right');

plot([0.48 0.48],[0.01 0.88],'-.m');
text(0.42,0.92,'Zero FMR');

text(0.37,0.09,'EER');
xlabel('Similarity Score'); ylabel('Rate');