clc
clear
close

img = imread('lion.jpg');
a = size(img);
img = double(img);

hist_Initial = zeros(1,256);
for i=1:a(1)
    for j=1:a(2)
        for k=0:255
            if img(i,j)==k
                hist_Initial(k+1)=hist_Initial(k+1)+1;
            end
        end
    end
end
    
pdf =(1/(a(1)*a(2)))*hist_Initial;

cdf = zeros(1,256);
cdf(1)=pdf(1);

for i=2:256
    cdf(i)=cdf(i-1)+pdf(i);
end
cdf = round(255*cdf);

ep = zeros (a);
for i =1:a(1)
    for j=1:a(2)

    t =(img(i,j)+1);
    ep(i,j)=cdf(t);
    end
end

hist_Eq = zeros(1,256);
for i=1:a(1)
    for j = 1:a(2)
        for k=0:255
            if ep(i,j)==k
                hist_Eq(k+1)=hist_Eq(k+1)+1;
            end
        end
    end
end

subplot(2,2,1);
imshow(uint8(img));
subplot(2,2,3);
imshow(uint8(ep));
subplot(2,2,2);
stem(hist_Initial);
subplot(2,2,4);
stem(hist_Eq);
