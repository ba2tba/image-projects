clc;
clear all;
close all;
a = imread('Img1.png');
a = im2double(a);
subplot(131),
imshow(a);
w= fspecial('average',[5 5]);
b = imfilter(a,w);
subplot(132),
imshow(b);