x1= imread('TCGA_CS_4942_19970222_11.tif');
x2= imread('TCGA_CS_4944_20010208_10.tif');
x3= imread('TCGA_DU_5851_19950428_15.tif');

x1truth= imread('TCGA_CS_4942_19970222_11_mask.tif');
bint1 = im2bw(x1truth,0.4);
x2truth= imread('TCGA_CS_4944_20010208_10_mask.tif');
bint2 = im2bw(x2truth,0.4);
x3truth= imread('TCGA_DU_5851_19950428_15_mask.tif');
bint3 = im2bw(x3truth,0.4);

s = strel('disk',4);

%applying the thresholding
tumor1 = (x1(:,:,1)<56 & x1(:,:,2)>107 & x1(:,:,3)<85);
binx1 = imdilate(tumor1,s);
binx1 = im2bw(binx1,0.4);

tumor2 = (x2(:,:,1)<140 & x2(:,:,2)>120 & x2(:,:,3)<59);
binx2 = imdilate(tumor2,s);
binx2 = im2bw(binx2,0.4);

tumor3 = (x3(:,:,1)<90 & x3(:,:,2)>113 & x3(:,:,3)<57);
binx3 = imdilate(tumor3,s);
binx3 = im2bw(binx3,0.4);

%calculating the error rate:
sim1 = 2*(sum(binx1.*bint1)) / sum(binx1+bint1);
sim2 = 2*(sum(binx2.*bint2)) / sum(binx2+bint2);
sim3 = 2*(sum(binx3.*bint3)) / sum(binx3+bint3);

subplot(321), imshow(binx1);
subplot(322), imshow(x1truth), title(sim1);

subplot(323), imshow(binx2);
subplot(324), imshow(x2truth); title(sim2);

subplot(325), imshow(binx3);
subplot(326), imshow(x3truth); title(sim3);
