function x = Backward_Euler2(x,h,g,vm,d)

for n = 1:size(x,2)        
    for i = size(x,1):-1:1
        if i ~= size(x,1) 
            x(i,n+1) = (x(i,n) + h * vm/d * x(i+1,n+1))/(1 + h * vm/d);
        else
            x(i,n+1) = x(i,n) + h * g;
        end
    end
end