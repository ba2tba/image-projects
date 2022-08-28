clc;
clear all;
close all;
a = imread('Img2.png');
a = im2double(a);
subplot(121),
imshow(a);
a = medfilt2(a);
subplot(122),
imshow(a);