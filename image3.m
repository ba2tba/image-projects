clc;
clear all;
close all;
a = imread('Img3.png');
a1 = im2double(a);
[r,c] = size(a1);
gamma = 1.6;
out = abs((1*a1).^gamma);
maxr = max(out(:));
minc = min(out(:));

for i=1:r;
    for j = 1:c;
        out(i,j) = (255*out(i,j))/(maxr - minc);
    end
end
out = uint8(out);
subplot(121);imshow(a);title('before');
subplot(122);imshow(out);title('after');