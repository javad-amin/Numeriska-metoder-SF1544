function x = Euler(x,h,g,vm,d)

for n = 1:size(x,2)
    for i = 1:size(x,1)
        if i ~= size(x,1)
            x(i,n+1) = x(i,n) + h * f(x(i+1,n) - x(i,n),vm,d); 
        else
            x(i,n+1) = x(i,n) + h * g;
        end
    end
end