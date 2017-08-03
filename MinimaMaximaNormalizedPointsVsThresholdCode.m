%% Work
df = ElevationThresholdCopyofMinimaRawNumbers3;

sites = {'NoFo 3', 'NoFo 3b', 'NoFo 4', 'NoFo 5'};
figure(3);
for nThresholdRow = 12:3:(9 + length(sites)*3)
    currentNormalThreshold = df(:, nThresholdRow);
    currentNormalThreshold = currentNormalThreshold(~isnan(currentNormalThreshold));

    nNumPointsRow = nThresholdRow + 1;
    currentNormalPoints = df(:, nNumPointsRow);
    currentNormalPoints = currentNormalPoints(~isnan(currentNormalPoints));
    
    scatter(currentNormalThreshold, log(currentNormalPoints))
    %coefficients = polyfit(currentNormalThreshold, log(currentNormalPoints), 1);
    %y = coefficients(1)*currentNormalThreshold + coefficients(2);
    %plot(currentNormalThreshold, y)
    hold on;
end

title('Log Scaled Graph of Normalized Points vs Threshold for NoFo Minima - D90 Means')
xlabel('Normalized Elevation Threshold')
ylabel('Natural Log of Normalized Number of Points')

legend('NoFo 3', 'NoFo 3b', 'NoFo 4', 'NoFo 5', 'Location', 'NorthWest')
%% h
title('Local Minima Normalized Point Number vs Elevation Threshold - D90 Means in Log Space')
xlabel('Natural Log of Normalized Elevation Threshold')
ylabel('Natural Log of Normalized Number of Points')
legend('NoFo 1', 'NoFo 2', 'NoFo 2b', 'NoFo 3', 'NoFo 3b', 'NoFo 4', 'NoFo 5', 'Location', 'NorthWest');

print('-f1', 'MinimaD90MeansNo7Log', '-djpeg')