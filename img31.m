clc;
clear all;
close all;
a = imread('Img3.png');
a = im2double(a);
subplot(121),
imshow(a);
b = imadjust(a,stretchlim(a),[]);
subplot(122),
imshow(b);