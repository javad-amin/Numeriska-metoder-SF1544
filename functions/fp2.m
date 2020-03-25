function x = fixed_point(x,h,g,vm,d,i,n,num_iter)

z = x(i,n);
z1 = x(i,n) + h * f(x(i+1,n+1) - z,vm,d);   
for k = 1:num_iter
    z = z1;
    z1 = x(i,n) + h * f(x(i+1,n+1) - z,vm,d); 
end
x(i,n+1) = z1;