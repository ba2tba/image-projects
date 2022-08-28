x= imread('fish.jpg');
%pval = impixel(x);
%pval
blue = (x(:,:,1)<170 & x(:,:,2)>=80 & x(:,:,3)>=170);
blue_mask = im2bw(imcomplement(blue));
blue_mask = cat(3, blue_mask, blue_mask, blue_mask);
blue_fish = x;
blue_fish(blue_mask) = 0;
%figure, imshow(blue_fish);
subplot(121), imshow(x), title('original');
subplot(122), imshow(blue_fish), title('only blue');