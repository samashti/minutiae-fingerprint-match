clear all; clc; addpath(genpath(pwd));

%% ONE to ONE fingerprint matching
fprintf('Open a fingerprint \n');
pause(3);
[filename1, pathname1]= uigetfile('*.bmp;*.BMP;*.TIF;*.jpg;*.tif','Open A Fingerprint image'); 
img = imread(filename1);
if ndims(img) == 3; img = rgb2gray(img); end  % Color Images
disp(['Extracting features from ' filename1 ' ...']);
ffm1=ext_finger(img,1);

fprintf('Open next fingerprint to match \n');
pause(3);
[filename2, pathname2]= uigetfile('*.bmp;*.BMP;*.TIF;*.jpg;*.tif','Open Next Fingerprint image to match'); 
img = imread(filename2);
if ndims(img) == 3; img = rgb2gray(img); end  % Color Images
disp(['Extracting features from ' filename2 ' ...']);
ffm2=ext_finger(img,1);

disp(['Computing similarity between ' filename1 ' and ' filename2 ]);
S=match(ffm1,ffm2,1);

if S>=0.48
    fprintf('\n \n It is a MATCH \n');
else
    fprintf('\n \n Not a MATCH \n');
end

