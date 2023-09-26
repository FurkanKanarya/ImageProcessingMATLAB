clc 
clear all

A=[0.32 0.58 1; 0.7 1.1 1.9 ; 0.12 0.48 0.5];
b=[-0.18; 0.78;0.74];
[m,n]=size(A);

s=0;
for j = i:n
    for i = s+1: m-1
        t = A(i+1,j)/A(j,j);
        A(i+1,:) = A(i+1,:)-t*A(j,:);
        b(i+1) = b(i+1)-t*b(j);
        f(i+1,j) = t;
    end
    s = s+1;

end
U = A
L = f; L(:,n) = zeros(n,1);
for i=1:n
    L(i,i) = 1;
end