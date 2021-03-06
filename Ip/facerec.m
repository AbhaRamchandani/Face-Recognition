
% Face recognition using eigen-faces (Principal Component Analysis)
% Feature Extraction:
% merge column vector for each training face

clear;

Mp = 6;

x1=imread('ig1.jpg');
x2=imread('ig2.jpg');
x3=imread('ig3.jpg');
x4=imread('ig4.jpg');
x5=imread('ig5.jpg');
x6=imread('ig6.jpg');
[m n]=size(x1);

%input image 

 B=imread('ig1.jpg');
%B=imread('ig7.jpg');

figure(1);
subplot(3,2,1);
imshow(x1);
title('image1');
subplot(3,2,2);
imshow(x2);
title('image2');
subplot(3,2,3);
imshow(x3);
title('image3');
subplot(3,2,4);
imshow(x4);
title('image4');
subplot(3,2,5);
imshow(x5);
title('image5');
subplot(3,2,6);
imshow(x6);
title('image6');

figure,imshow(B);
title('input image');

%each image being converted to a vector
    
    for i = 1 : m
        for j= 1 : n
         a1(j+(i-1)*n)=double(x1(i,j));
         a2(j+(i-1)*n)=double(x2(i,j));
         a3(j+(i-1)*n)=double(x3(i,j));
         a4(j+(i-1)*n)=double(x4(i,j));
         a5(j+(i-1)*n)=double(x5(i,j));
         a6(j+(i-1)*n)=double(x6(i,j));
         b(j+(i-1)*n)=double(B(i,j));
         end;
    end;    
      
X = [a1' a2' a3' a4' a5' a6' ];
Y = b';

% compute the average face

me = (a1'+a2'+a3'+a4'+a5'+a6')./6;

% difference b/w input image and mean image

A =double(X - [me me me me me me]);
A1=double(Y - me);

% obtaining covariance matrix

T = A'*A;

% obtaining eigen-values and eigen-vectors

[V,D]=eigs(T);      

% computing weight for the images

U=A*V;
Wa=(U'*A);
Wb=U'*A1;

% finding Euclidean-distance

    for i = 1 : Mp
        diff(:,i)=Wa(:,i)-Wb;
    end;

    for i = 1 : Mp
        sum = 0;
        for j = 1 : Mp
            sum = sum + diff(j,i)^2;
        end;
        dist(i)= sqrt(sum);
    end;

temp=0;
D0=.2*1.0e+008 ;

    for i = 1 : Mp
        if ( dist(i)<=D0 ),
        temp=1;
            switch(i)
                case 1 
                disp('input image matches with image 1 in database');
                break;
                case 2 
                disp('input image matches with image 2 in database');
                break;
                case 3 
                disp('input image matches with image 3 in database');
                break;
                case 4 
                disp('input image matches with image 4 in database');
                break;
                case 5 
                disp('input image matches with image 5 in database');
                break;
                case 6 
                disp('input image matches with image 6 in database');
                break;
            
            end;
        end;   
    end;    

 if (temp==0)
     disp('no match found');
 end;    
    
