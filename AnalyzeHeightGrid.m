%% Load file to be cropped/analyzed, define name of dataset, set non data numberheightGrid = fileNameW/OExtension;  %input heredataName = 'NameOfThisData';        %input herenonDataNumber = NonDataNumber;      %input here%% Remove non-dataheightGrid(heightGrid == nonDataNumber) = NaN;%% Plot initial height gridfigure(1); clf;pcolor(heightGrid);shading interp; axis image;title(strcat(dataName, ' Height Grid'));xlabel('x (centimeters)');ylabel('y (centimeters)');%% Crop height grid to an axially aligned rectangle of desired size%The following bounds are x and y indices on the height gridxLowerBound = xLower;   %input herexUpperBound = xUpper;   %input hereyLowerBound = yLower;   %input hereyUpperBound = yUpper;   %input hereheightGrid = heightGrid(yLowerBound:yUpperBound, xLowerBound:xUpperBound);%% Clear unwanted variablesclear 'xLowerBound' 'xUpperBound' 'yLowerBound' 'yUpperBound'%% Plot cropped height gridfigure(2); clf;pcolor(heightGrid);shading interp; axis image;title(strcat(dataName, ' Cropped Height Grid'));xlabel('x (centimeters)');ylabel('y (centimeters)');%% Detrend cropped height gridheightGrid = detrend_2d(heightGrid);%% Plot detrended cropped height gridfigure(3); clf;pcolor(heightGrid);shading interp; axis image;title(strcat(dataName, ' Detrended Cropped Height Grid'));xlabel('x (centimeters)');ylabel('y (centimeters)');%% Calculate statistics of the sampled area from the height fieldheightMean = mean2(heightGrid);heightMedian = median(median((heightGrid)));heightStDev = std2(heightGrid);heightMax = max(max(heightGrid));heightMin = min(min(heightGrid));disp('Mean:')disp(heightMean)disp('Median:')disp(heightMedian)disp('Standard Deviation:')disp(heightStDev)disp('Maximum:')disp(heightMax)disp('Minimum:')disp(heightMin)%% Clear statistic variablesclear 'heightMean' 'heightMedian' 'heightStDev' 'heightMax' 'heightMin'%% Plot of cdf values for the detrended cropped height gridfigure(4); clf;cdfplot(reshape(heightGrid,1,[]));title(strcat(dataName, ' CDF Plot of Detrended Cropped Height Grid'));xlabel('Height (m)');ylabel('CDF Output');%% Save figuresprint('-f1', 'HeightGrid', '-djpeg')print('-f2', 'CroppedHeightGrid', '-djpeg')print('-f3', 'DetrendedCroppedHeightGrid', '-djpeg')print('-f4', 'CDFPlot', '-djpeg')%% After evaluating a datasetclear 'dataName' 'heightGrid' 'nonDataNumber'%% Create CDF plot of multiple datasets%Take input for each individual plotcurrentSet = fileNameW/OExtension;  %input herexLower = lowerX;   %input herexUpper = upperX;   %input hereyLower = lowerY;   %input hereyUpper = upperY;   %input herenonDataNumber = NonDataNumber;      %input hereplotTitle = 'plotTitle';            %Input here%remove non-datacurrentSet(currentSet == nonDataNumber) = NaN;%crop height grid to an axially aligned rectangle of desired sizecurrentSet = currentSet(yLower:yUpper, xLower:xUpper);%clear unwanted variablesclear 'xLower' 'xUpper' 'yLower' 'yUpper'%detrend cropped height gridcurrentSet = detrend_2d(currentSet);%CDF plot of multiple sets - needs to be reconfigured for each usefigure(5);cdfplot(reshape(currentSet,1,[]));title(plotTitle);xlabel('Height (m)');ylabel('CDF Output');%after evaluating a datasetclear 'currentSet' 'nonDataNumber' 'plotTitle'%Hold on to each plot after it's createdhold on;%% For a cdf plot of multiple sets - to be added at the endlegend('', '', '', 'Location', 'NorthEast')