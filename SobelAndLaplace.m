a = imread('colored.jpeg');
b = rgb2gray(a);
figure,imshow(b);
c=double(b);
for i =1:size(c,1)-2
    for j =1:size(c,2)-2
    Gx = ((2*c(i+2,j+1)+c(i+2,j)+c(i+2,j+2)) -(2*c(i,j+1)+c(i,j)+c(i,j+2)));

    Gy = ((2*c(i+1,j+2)+c(i,j+2)+c(i+2,j+2))-(2*c(i+1,j)+c(i,j)+c(i+2,j)));

    b(i,j) =sqrt(Gx.^2+Gy.^2);
    end
end
figure,imshow(b);
title('Sobel');

clc
clear
a = imread('colored.jpeg');
a = rgb2gray(a);
a = double(a);
figure,imshow(a,[])

M = size(a,1); 
N = size(a,2);
C=3; D=3;
P=M+C-1; Q =N+D-1;
ap = zeros(P,Q);
ap(1:M,1:N) = a;
hp(1,1)=-4; hp(2,1)=1; hp(1,2)=1;
hp(P,1)=1; hp(1,Q)=1;

Ap=fft2(double(ap),P,Q);
Hp=fft2(double(hp),P,Q);
H = fftshift(Hp);
A1 = abs(H);
A1 = log(A1+1);
imshow(A1);

Gp=Ap.*Hp;
gp=ifft2(Gp);
gp=real(gp);
g=gp(1:M,1:N);
figure,imshow(g,[])

gnorm = g;
gshar = double(a-gnorm);
figure,imshow(uint8(gshar))
title('Laplace');

