function x = fixed_point(x,h,g,vm,d,i,n,err)

z = x(i,n);
z1 = x(i,n) + h * f(x(i+1,n+1) - z,vm,d);
while abs(z1 - z) > err
    z = z1;
    z1 = x(i,n) + h * f(x(i+1,n+1) - z,vm,d);
end
x(i,n+1) = z1;
end