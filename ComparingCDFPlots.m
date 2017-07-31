%% Create CDF plot of multiple datasets
%Take input for each individual plot
currentSet = heightGrid;  %input here -- also dlmread('filename', ' ', 6, 0);

plotTitle = 'NoFo 1';            %Input here

%CDF plot of multiple sets - needs to be reconfigured for each use
figure(5);
cdfplot(reshape(currentSet,1,[]));
title(plotTitle);
xlabel('Height (m)');
ylabel('CDF Output');

%after evaluating a dataset
clear 'currentSet' 'plotTitle'

%Hold on to each plot after it's created
hold on;

%% For a cdf plot of multiple sets - to be added at the end
legend('', '', '', 'Location', 'NorthEast')