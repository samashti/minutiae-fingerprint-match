clear all; clc; addpath(genpath(pwd));
%% Matching a fingerprint with database
load('db.mat');

%% ONE to MANY Fingerprint matching 
fprintf('Open fingerprint to find the match \n');
pause(2);
[filename, pathname]= uigetfile('*.bmp;*.BMP;*.TIF;*.jpg;*.tif','Open A Fingerprint image'); 
img = imread(filename);
if ndims(img) == 3; img = rgb2gray(img); end  % Color Images
disp(['Extracting features... ']);
ffnew=ext_finger(img,1);

%% Comparing with each of the fingerprint in database with similarity score
S=zeros(72,1);
fprintf(['Finding Match.... \n']);
for i=1:72
    second=['10' num2str(fix((i-1)/8)+1) '_' num2str(mod(i-1,8)+1)];
    S(i)=match(ffnew,ff{i});
    if S(i)>=0.48
        fprintf(['Match found \n ']);
        fprintf([second ' is a MATCH \n ']);
        break
    end
    drawnow
end

