clc
clear all


a = imread('cameraman.tif');
b = size(a);


n = input('mask size giriniz ');
n1 = ceil(n/2);
a = double(a);
lpf = (1/n^2)*ones(n);
hpf=-lpf;
hpf(n1,n1)=(n^2-1)/n^2;

c = 0;
h = 0;
for i=n1:b(1)-n1+1
        for j = n1:b(2)-n1+1
            for k=1:n
                for l=1:n
                    c = c+a(i-n1+k,j-n1+1)*lpf(k,1);
                end
            end
            d(i,j)=c;
            c=0;
        end
end

e = uint8(d);
figure;
imshow(e); 
title('low pass filter görüntüsü');

for i =n1:b(1)-n1
    for j =n1:b(2)-n1
        for k =1:n
            for l=1:n
                h=h+a(i-n1+k, j-n1+1)*hpf(k,1);
            end
        end
        g(i,j)=h;
        h=0;
    end
end


f=uint8(g);
figure; 
imshow(f);
title('high pass filter görüntüsü');

figure; 
imshow(uint8(a));
title('Orijinal görüntü');

HB = 1.5;
HB1 = (HB-1)+lpf;
HBP = a*HB1

figure;
imshow(uint8(HBP));
title('High Boost görüntüsü');
