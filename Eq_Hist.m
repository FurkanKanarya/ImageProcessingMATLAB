clc 
clear 

img = imread('lion.jpg');
if (size(img,3)>1)
    img = rgb2gray(img);
end

max_r = size(img,1);
max_c = size(img,2);
histogram = zeros([1,256]);
cumulative__hist = zeros([1 256]);

for r =1:max_r
    for c=1:max_c
        for count=1:256
            if (img(r,c)==count-1)
                histogram(count) = histogram(count) + 1;
                break;
            end
        end
    end
end

current_value =0;
for count = 1:256
    current_value = current_value + histogram(count);
    cumulative_hist(count) = current_value;
end

normalized_hist =zeros([1 256]);
cdf_min = min(cumulative_hist);

for count= 1:256
    normalized_hist(count) = cumulative_hist(count)-cdf_min;
    normalized_hist(count) = normalized_hist(count) / (max_r*max_c) -cdf_min;
    normalized_hist(count) = round(normalized_hist(count)*255);
end

equalized_img = zeros([max_r max_c]);

for r=1:max_r
    for c=1:max_c
        for count=1:256
            if(img(r,c) == (count-1))
                equalized_img(r,c) = normalized_hist(count);
                break;
            end
        end
    end
end

subplot(2,2,1)
imshow(img);
title('Orijinal görüntü');
subplot(2,2,2);
imhist(img);
title('Orijinal görüntünün histogramı');

subplot(2,2,3);
imshow(uint8(equalized_img));
title('Equalized görüntü');
H = uint8(equalized_img);
subplot(2,2,4);
imhist(H);
title('Equalized görüntünün histogramı');







            