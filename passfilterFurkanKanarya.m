%Furkan KANARYA 30720100
clc;
clear all;
close all;

a = imread('cameraman.tif'); % Input image
a = im2double(a); 
subplot(2,2,1);
imshow(a);
title('Input Image');

[m,n] = size(a);  
D0 = 50; 
A = fft2(a);   %fourier transformation uygulanması


A_shift = fftshift(A);  %orjini kaydırma
A_real = abs(A_shift);  %Mutlak işlemi

%Low pass döngüsü
A_low = zeros(m,n);
d = zeros(m,n);
for u=1:m
    for v=1:n
        d(u,v)=sqrt((u-(m/2))^2+(v-(n/2))^2);
        if d(u,v) D0
            A_low(u,v)=A_shift(u,v);
            filt(u,v) = 1;
        else
            A_low(u,v)=0; 
            filt(u,v) = 0;
        end
    end
end


B = fftshift(A_low);  %Filtrelenen görüntünün geri shift edilmesi
B_inverse = ifft2(B); %Inverse Fourier işlemi
B_real = abs(B_inverse);
subplot(2,3,2);
imshow(B_real)
title('Ideal Low pass filter')
H = zeros(m,n);
D = zeros(m,n);

%High Pass ve High Boost için döngü
for u=1:m
    for v=1:n
        D(u,v)=sqrt((u-(m/2))^2+(v-(n/2))^2);
        if D(u,v) D0
            H(u,v) = 0;
        else
            H(u,v) = 1; 
        end
    end
end

AHB = 2.0; %High boost kat sayısı
H1 = (AHB-1)+ H;
X = A_shift.*H; 
X1 = A_shift.*H1;%High boost çarpanı ile high pass görüntüyü çarpma
XA = abs(ifft2(X));
XB = abs(ifft2(X1));

subplot(2,2,3);
imshow(XA);
title('High pass image');

subplot(2,2,4);
imshow(XB);
title('High boost image');

