clc;
clear all;
close all;
a = imread('Img1.png');
a = im2double(a);
subplot(131),
imshow(a);
b = wiener2(a,[4,4]);
subplot(132),
imshow(b);