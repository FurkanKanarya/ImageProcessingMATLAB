clc
clear all

f=@(x) x^2+5*x-7;
format long

x=[-5:0.1:5];
y = arrayfun(f,x);
plot(x,y)
xline(0)
yline(0)
hold on

xl=input('Enter the lower value');
xu=input('Enter the upper value');
error=input('Enter toleration of error');
iteration=input('Enter the number of iterations');

if f(xl)*f(xu)>0
    fprintf('There is not a solution in the interval');
    return
elseif f(xl)== 0
    fprintf('%f is the solution',xl);
    return
elseif f(xu)==0
    fprintf('%f is the solution',xu);
    return
end

fprintf('i       xl         xu       xm        error-f(x)\n');
fprintf('------------------------------------------------\n');
for i=1:iteration
    xm = xu -(xl-xu)*f(xu)/(f(xl)-f(xu));
    
    fprintf('%i   %f   %f   %f   %f\n',i,xl,xu,xm,f(xm));

    if abs(f(xm))<error
        return
    end

    if f(xl)*f(xm)<0
        xu =xm;
    elseif f(xm)*f(xu)<0
        xl=xm;
    end
    scatter(xm,f(xm),'red')
end
