img = imread('tst1.png');
imgTH = im2bw(img, 0.5);

imshow(imgTH)

imgD = imdilate(imgTH,strel('disk',2));

imgDCc = bwconncomp(imgD);
imgDCcCentroids = regionprops(imgDCc,'Centroid');

numPixels = cellfun(@numel,imgDCc.PixelIdxList);
[biggest,idx] = max(numPixels);
% imgD(imgDCc.PixelIdxList{i}) = 0;

moneyCounter = 0;

hold on;
for i = 1:imgDCc.NumObjects
    if numPixels(i) < 2800
        circle2(imgDCcCentroids(i).Centroid(1,1),imgDCcCentroids(i).Centroid(1,2),25,[0,0,1],4);
        moneyCounter =  moneyCounter + 50;
    else
        circle2(imgDCcCentroids(i).Centroid(1,1),imgDCcCentroids(i).Centroid(1,2),30,[1,0,0],4);
        moneyCounter =  moneyCounter + 100;
    end
end
hold off;

outstream = sprintf('We have: %d cents',moneyCounter);
disp(outstream);