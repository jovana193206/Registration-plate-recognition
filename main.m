clear all;
close all;
clc;

%%

% Ucitavanje slike
img=imread('fiesta5.jpg');

% Izdvajanje tablice sa slike
imgray = rgb2gray(img);
figure(1)
imshow(imgray), title('Grayscale image');
im = edge(imgray, 'roberts');
figure(2)
imshow(im), title('Edge image');

% Lociranje tablice na slici uz koriscenje prethodno odradjene detekcije
% ivica roberts-ovim detektorom
Iprops = regionprops(im, 'BoundingBox', 'Area', 'Image');
IBoxRegion = insertShape(imgray, 'Rectangle', vertcat(Iprops.BoundingBox),'LineWidth',3, 'Color', {'green'});
figure(3)
imshow(IBoxRegion), title('Detected Regions')
area = Iprops.Area;
count = numel(Iprops);
boundingBox = Iprops.BoundingBox;

% Find the max area
maxa = area;
for i=1:count
    if maxa < Iprops(i).Area
        if Iprops(i).BoundingBox(3) > 3 *Iprops(i).BoundingBox(4)
            if Iprops(i).BoundingBox(3) < 5 * Iprops(i).BoundingBox(4)
                maxa = Iprops(i).Area;
                boundingBox = Iprops(i).BoundingBox;
            end
        end
    end
end

% Isecanje tablice sa ulazne slike
im = imcrop(imgray, boundingBox);
figure(4)
imshow(im), title('Cut plate');

final = imresize(im, [100 400]);
figure(6)
imshow(final), title('Resized plate');


final = imbinarize(final);
figure(5)
imshow(final), title('Binary plate');

% Morfoloske operacije
final = bwareaopen(~final, 180);
figure(7)
imshow(final), title('Opened plate');
final = imclearborder(final);
figure(8)
imshow(final), title('Clearborder');
se = strel('rectangle',[7 1]);
final = imdilate(final,se);

% Prikaz izdvojene binarizovane tablice
figure(9)
imshow(final), title('Final image');

%%

% Trazenje MSER regiona.
[mserRegions, mserConnComp] = detectMSERFeatures(final, ... 
    'RegionAreaRange',[200 8000],'ThresholdDelta',4);

figure(10)
imshow(final)
hold on
plot(mserRegions, 'showPixelList', true,'showEllipses',false)
title('MSER regions')
hold off

%%

% Pronalazenje svojstava MSER feature-a
mserStats = regionprops(mserConnComp, 'BoundingBox', 'Eccentricity', ...
    'Solidity', 'Extent', 'Euler', 'Image');

% Izdvajanje okvira za sve regione
bboxes = vertcat(mserStats.BoundingBox);

%%

% Izdvajanje samo onih regiona koji predstavljaju karaktere registracione
% identifikacije, na osnovu visine karaktera
charBoxes = bboxes;
charBoxes(charBoxes(:,4) < 50, :) = [];
if length(charBoxes) == 0
    charBoxes = bboxes;
end
charBoxes = sortrows(charBoxes,1);

%%

% Prikaz izdvojenih regiona koji ce se dalje analizirati
uint8Image = uint8(255 * final);
IAllRegion = insertShape(uint8Image, 'Rectangle', bboxes,'LineWidth',3, 'Color', {'green'});
figure(11)
imshow(IAllRegion), title('Detected Regions')
ITextRegion = insertShape(uint8Image, 'Rectangle', charBoxes,'LineWidth',3, 'Color', {'green'});
figure(12)
imshow(ITextRegion), title('Detected text Regions')

%%

% Analiza svakog od izdvojenih regiona, odnosno svakog karaktera tablice
plateTxt=[];
for i=1:length(charBoxes)
    charImg = imcrop(final, charBoxes(i,:));
    if i <= 2 || i >= (length(charBoxes)-1)
        chr = read_letter(charImg);
    else
        chr = read_number(charImg);
    end
    plateTxt=[plateTxt chr];
end
plateTxt

%%

% Krajnji prikaz
figure(13)
subplot(1,2,1)
imshow(final), title('Izdvojena tablica');
subplot(1,2,2)
imshow(ITextRegion), title('Detektovani regioni');
