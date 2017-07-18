load /Users/Megan/Downloads/x7611i.txt
heights = x7611i;

%% Creating a color map and finding certain parameters of 'heights'
interval = 0.002; %Resolution of the grid: 2mm in meters

%the x and y axes of the data/color map (the length and width of the flume)
x = 0.002:interval:(max(size(heights))*interval);
y = 0.002:interval:(min(size(heights))*interval);

%Creating a color map of hights
figure(1); clf;
pHeights = pcolor(x, y, heights);
shading interp; axis image;
set(gca, 'XTick', interval*(0:round(length(heights)/9):length(heights)));   %No x axis tick markers
set(gca, 'YTick', interval*(0:round(min(size(heights))/3):min(size(heights))));   %No y axis tick markers
xlabel('Length (m)')
ylabel('Width (m)')
title('Map of Sediment Heights from the Bottom of a Flume')
cBarHeights = colorbar;
cBarHeights.Label.String = 'Height (m)';

%set up for calculation of mean, max, min, sd that occurs in for loop
%each of the following variables is the parameter of 'heights' that it's
%name describes
hMean = heights;
hMax = heights;
hMin = heights;
hSD = heights;

%Finds mean, max, min, and sd for matrix 'heights' agnostic of dimension
for i=1:ndims(heights)
    hMean = mean(hMean);
    hMax = max(hMax);
    hMin = min(hMin);
    hSD = std(hSD);
end

%Prints the above parameters of 'heights'
disp(['Mean: ', num2str(hMean), '  Max: ', num2str(hMax), '  Min: ', num2str(hMin), '  Standard Deviation: ', num2str(hSD)]);
disp('');


%% Finding the slope and y intercept of the flume
lmSlopeSet = zeros(1, min(size(heights)));   %Vector of slopes for each row in 'heights'
lmInterceptSet = zeros(1, min(size(heights)));  %Vector of intercepts for each row in 'heights'

%Calculates each slope for each row in 'heights' and adds the slope to
%'lmSlopeSet'
for i = 1:min(size(heights))
    lm = polyfit(x, heights(i, :), 1);
    lmSlopeSet(i) = lm(1);
    lmInterceptSet(i) = lm(2);
end

slope = mean(lmSlopeSet);
disp(['Slope of the flume: ', num2str(slope)]); %The mean slope of the sediment - approximates the slope of the flume
intercept = mean(lmInterceptSet);

%% Detrending the heights in the flume

%Detrending with slope
for i = 1:max(size(heights))
    heights(:, i) = heights(:, i) - slope*x(i);
end

%Detrending with intercept
heights = heights - intercept;


%Below: displaying parameters for the detrended flume

%set up for calculation of mean, max, min, sd that occurs in for loop
%each of the following variables is the parameter of 'heights' that it's
%name describes
hMean = heights;
hMax = heights;
hMin = heights;
hSD = heights;

%Finds mean, max, min, and sd for matrix 'heights' agnostic of dimension
for i=1:ndims(heights)
    hMean = mean(hMean);
    hMax = max(hMax);
    hMin = min(hMin);
    hSD = std(hSD);
end

disp([num2str(hMean), ' ', num2str(hMax), ' ', num2str(hMin), ' ', num2str(hSD)]);
