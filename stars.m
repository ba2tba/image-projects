i = uigetfile({'*.bmp';'*.png';'*.jpg'}); 
a1 = imread(i);
[M,L] = size(a1);
maxDist = L + M;
distMat = a1;
for i = 1:M 
    for j = 1:L 
        if distMat(i , j ) == 0
            distMat(i , j ) = inf;
        
        elseif distMat(i , j ) == 1
            distMat(i , j ) = 0;
        end    
    end
end
              % look forward
for i = 2:M-1 % leave top border
    for j = 2:L-1 % leave left border
        if distMat(i , j ) > (distMat( i-1, j) + 1)
            distMat(i , j ) = (distMat( i-1, j) + 1);
        
        elseif distMat(i , j ) > (distMat( i , j-1) + 1)
            distMat(i , j ) = (distMat( i , j-1) + 1);
           
        elseif distMat(i , j ) > (distMat( i-1, j-1) + 2)
            distMat(i , j ) = (distMat( i-1, j-1) + 2);
        
        elseif distMat(i , j ) > (distMat( i+1 , j-1) + 2)
            distMat(i , j ) = (distMat( i+1 , j-1) + 2);    
        end
        disp(distMat);
    end
end

for i = M-1:-1:2 % ignore bottom border
    for j = L-1:-1:2 % ignore right border
        % look backwards
        if distMat(i , j ) > (distMat( i+1, j) + 1)
            distMat(i , j ) = (distMat( i+1, j) + 1);
        
        elseif distMat(i , j ) > (distMat( i , j+1) + 1)
            distMat(i , j ) =(distMat( i , j+1) + 1);
        
        elseif distMat(i , j ) > (distMat( i+1, j+1) + 2)
            distMat(i , j ) = (distMat( i+1, j+1) + 2);
        
        elseif distMat(i , j ) > (distMat( i-1 , j+1) + 2)
            distMat(i , j ) = (distMat( i-1 , j+1) + 2);
        end
        disp(distMat);
    end
end
distMat;

%distMat = bwdist(distMat, 'cityblock');
subplot(121);imshow(a1);title('before');
subplot(122);imshow(distMat);title('after');