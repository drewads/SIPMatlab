%% load data
load E:/NoFoStDevs.csv
load E:/grainSizeExport.csv

stDevs = NoFoStDevs(1:5);
grainSizeExport = grainSizeExport(:, 1:5);
results = zeros(9,2);

%% Run correlation test
for i = 1:size(grainSizeExport(:,1))
   [r,p] = corrcoef(stDevs,grainSizeExport(i,:));
   disp(['r = ', num2str(i)]);
   disp(num2str(r));
   disp(['p = ', num2str(i)]);
   disp(num2str(p));
end    